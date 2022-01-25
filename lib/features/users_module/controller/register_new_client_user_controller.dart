


import 'dart:io';

import 'package:advertisers/app_core/network/models/Area.dart';
import 'package:advertisers/app_core/network/models/Country.dart';
import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/requests/RegisterClientUserRequest.dart';
import 'package:advertisers/app_core/network/responses/RegisterClientUserResponse.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:advertisers/main.dart';
// import 'package:advertisers/shared/network/models/Area.dart';
// import 'package:advertisers/shared/network/models/Country.dart';
// import 'package:advertisers/shared/network/responses/CountriesResponse.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';


class RegisterNewClientUserController extends GetxController {
  GlobalKey<FormState> registerNewClientUserControllerFormKey = GlobalKey<
      FormState>(debugLabel: 'registerNewClientUserControllerFormKey');

  late TextEditingController phoneController;
  late TextEditingController nameController;
  late TextEditingController accountNameController;
  late TextEditingController emailController;
  late TextEditingController nationalIDController;
  late TextEditingController passwordController;
  var isValid=false.obs;
  var errorRegister=false.obs;
  var countryCode = '+966'.obs;
  var latitude = 0.0.obs;
  var savedFile = File(' ').obs;
  var longitude = 0.0.obs;
  var password = '';
  var phone = '';
  var role = ''.obs;
  static dio.MultipartFile? photo;
  var imageBase641 = ''.obs;
  var areaId = ''.obs;
  var countryId = ''.obs;
  var name = '';

  var nationalID = '';
  var accountName = '';
  var email = '';
///////////////////////////////////
  var phoneMess = ''.obs;
  var nameMess = ''.obs;
  var nationalIDMess = ''.obs;
  var accountNameMess = ''.obs;
  var emailMess = ''.obs;
  //var nationalIDMessValid=false.obs;
  //List<Country> countries = [];
  RxList<Country> countries = <Country>[].obs;
  RxList<Area> areas = <Area>[].obs;
  Rx registerClientUserResponse = RegisterClientUserResponse().obs;

  //Repository repo=Repository();
  @override
  void onInit() {
    //repo.postWithImageMultipart({})

    phoneController = TextEditingController();
    nameController = TextEditingController();
    accountNameController = TextEditingController();
    emailController = TextEditingController();
    nationalIDController = TextEditingController();
    passwordController = TextEditingController();
    phoneController.text=Get.parameters['phone'].toString();
    client!.getCountries().then((value) {
      if (value.data != null) {
        countries.value = value.data!;
        print(value.data![0].name);
        Logger().i(value.data);
      }
    });

    super.onInit();
  }

  String? validatePhone(String phone) {
    if (phone.length < 8) {
      return 'رقم الهاتف لا يقل عن 8 رقم';
    }else if(phoneMess.isNotEmpty){
      return phoneMess.value;
    }
    return null;
  }
  String? validatePassword(String val) {
    if (val.length < 6) {
      return 'الباسوورد لا يقل عن 6 حروف او ارقام';
    }
    return null;
  }
  String? validateUserName(String val) {
    if (val.length < 3) {
      return 'الاسم لا يقل 3 رقم';
    }else if(nameMess.isNotEmpty){
      return nameMess.value;
    }
    return null;
  }
  String? validateAccountName(String val) {
    if (val.length < 3) {
      return 'الاسم لا يقل 3 رقم';
    }else if(accountNameMess.isNotEmpty){
      return accountNameMess.value;
    }
    return null;
  }
  String? validateEmail(String val) {
    if (!GetUtils.isEmail(val)) {
      return 'رجاء ادخل الايميل بشكل صحيح';
    }else if(emailMess.isNotEmpty){
      return emailMess.value;
    }
    return null;
  }
  String? validateNationalId(String val) {
    if (val.length < 8) {
      return 'رقم الهوية لا يقل عن 10 ارقام';
    }else if(nationalIDMess.isNotEmpty){
      return nationalIDMess.value;
    }
    // else if(nationalIDMessValid.value==true){
    //   return null;
    // }
    return null;
  }

  // void changeAreas(int countryId){
  void changeAreas(Country country2) {
    areas.value = [];
    Country? country = countries.firstWhereOrNull((element) =>
    element.id == country2.id);
    if (country != null) {
      areas.value = country.areas!;
    }
    /*countries.forEach((element) {
      if(element.id==countryId){
        areas.add(element.)
      }
    });*/
  }

  void checkLogin() {
     isValid.value = registerNewClientUserControllerFormKey.currentState!
        .validate();
    if (!isValid.value||errorRegister.value==true) {
      return;
    }
    registerNewClientUserControllerFormKey.currentState!.save();
   // registerClientUser(context: context);
    if(role.value.isNotEmpty){
    if(countryId.isNotEmpty&&areaId.isNotEmpty) {
      registerClientUser();
      //registerClientUser();
    }else{
      Get.snackbar(
        "خطأ",
        'يجب اختيار الدولة ثم المدينة' ?? '',colorText: AppColors.white,
        icon: const Icon(Icons.person, color: Colors.black),
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,);
    }}else{
      Get.snackbar(
        "خطأ",
        'يجب اختيار النوع' ?? '',colorText: AppColors.white,
        icon: const Icon(Icons.person, color: Colors.black),
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,);
    }
    // loginClient();

  }

  void registerClientUser() {
    EasyLoading.show();
    Repository repo = Repository();

    repo.postWithImageMultipart<RegisterClientUserResponse>(
        path: 'auth/register',
        fromJson: (json) => RegisterClientUserResponse.fromJson(json),
        json: {
          "account_name": accountNameController.text,
          "area_id": areaId.value,
          "country_id": countryId.value,
          "email": emailController.text,
          "fcm_token": token,
          "password": passwordController.text,
          "personal_id": nationalIDController.text,
          "phone": phoneController.text,
          "role": role.value,
          "type": 'client',
          "username": nameController.text,
          "image": photo,

        },
        onSuccess: (res) {
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }
          registerClientUserResponse.value = res;
          storage.write("token", res.data!.token);
          storage.write(
              "data", registerClientUserResponse.value.toJson());
          Get.toNamed('/chooseBakaPage');
        },
        onError: (err, res) {
          errorRegister.value = true;
          isValid.value = false;
          nationalIDMess.value = res.data!.personalId ?? '';
          phoneMess.value = res.data!.phone ?? '';
          nameMess.value = res.data!.username ?? '';
          accountNameMess.value = res.data!.accountName ?? '';
          emailMess.value = res.data!.email ?? '';

          checkLogin();
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }
          Get.snackbar(
            "خطأ",
            err.toString(),
            icon: const Icon(Icons.person, color: Colors.red),
            backgroundColor: Colors.yellow,
            snackPosition: SnackPosition.BOTTOM,);
        });
  }
  //   void registerClientUser() {
  //     EasyLoading.show();
  //     client!.registerClientUser(body:dio.FormData.fromMap( {
  //       "account_name": accountNameController.text,
  //       "area_id": areaId.value,
  //       "country_id": countryId.value,
  //       "email": emailController.text,
  //       "fcm_token": 'ffc',
  //       "password": passwordController.text,
  //       "personal_id": nationalIDController.text,
  //       "phone": phoneController.text,
  //       "role": role.value,
  //       "type": 'client',
  //       "username": nameController.text,
  //       "image": photo
  //     })).then((value) {
  //       if (EasyLoading.isShow) {
  //         EasyLoading.dismiss();
  //       }
  //       print('>>>>>>>>>>>>>>>>>>>>>>>${value.toJson()}');
  //       if (value != null) {
  //         registerClientUserResponse.value = value;
  //         //print(value.data!);
  //         Logger().i(value.data?.toJson());
  //         if (value.status == 200) {
  //           storage.write(
  //               "clientUser", registerClientUserResponse.value.toJson());
  //           Get.toNamed('/bakaPage');
  //         } else {
  //           Get.snackbar(
  //             "خطأ",
  //             value.message! ?? '',colorText: AppColors.white,
  //             icon: const Icon(Icons.person, color: Colors.black),
  //             backgroundColor: Colors.red,
  //             snackPosition: SnackPosition.BOTTOM,);
  //         }
  //       }
  //     });
  //   }
    // void loginClient(){
    //   repo.post<LoginSalonResponse>(path: '/loginClient',fromJson:(json) => LoginSalonResponse.fromJson(json),
    //       json:LoginSalonRequest(phone: phoneController.text,password: passwordController.text),onSuccess:(res) {
    //         account.model=AccountModel.fromJson(res.account!.toJson());
    //         Get.toNamed("/homeClientPage");
    //       },onError: (err){
    //
    //       }
    //   );
    //
    // }
    @override
    void onClose() {
      phoneController.dispose();

      super.onClose();
    }
  }

