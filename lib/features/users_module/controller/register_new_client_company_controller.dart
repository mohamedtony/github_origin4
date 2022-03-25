


import 'dart:io';

import 'package:advertisers/app_core/network/models/Area.dart';
import 'package:advertisers/app_core/network/models/Country.dart';
import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/responses/RegisterClientUserResponse.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:advertisers/main.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';


class RegisterNewClientCompanyController extends GetxController {
  GlobalKey<FormState> registerNewCompanyUserControllerKeyForm1 = GlobalKey<
      FormState>(debugLabel: 'registerNewCompanyUserControllerKeyForm');

  late TextEditingController phoneController;
  late TextEditingController companyNameController;
  late TextEditingController accountNameController;
  late TextEditingController accountAdminNameController;
  late TextEditingController emailController;
  late TextEditingController recordIDController;
  late TextEditingController passwordController;
  var empty=false.obs;
  var isValid=false.obs;
  var errorRegister=false.obs;
  var country=Country().obs;
  RxList<Country> countries = <Country>[].obs;
  RxList<Area> areas = <Area>[].obs;
  Rx registerClientUserResponse = RegisterClientUserResponse().obs;
  static dio.MultipartFile? photo;
  var countryCode = '+966'.obs;
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  var file =File(' ').obs;
  var password = '';
  var phone = '';
  var role=''.obs;
  String email='';
  String companyName='';
  String accountAdminName='';
  String accountName='';
  String recordNumber='';
  var savedFile = File(' ').obs;
  var imageBase641 = ''.obs;
  var areaId = ''.obs;
  var countryId = ''.obs;
  var logoPath = ''.obs;
///////////////////////////////////
  var phoneMess = ''.obs;
  var nameMess = ''.obs;
  var nationalIDMess = ''.obs;
  var accountNameMess = ''.obs;
  var emailMess = ''.obs;
  var accountAdminNameMess=''.obs;
  var  companyNameMess=''.obs;
  var recordIDMess=''.obs;
  //Repository repo=Repository();
  @override
  void onInit() {
    //repo.postWithImageMultipart({})

    // client!.getCountries().then((value) {
    //   if (value.data != null) {
    //     countries.value = value.data!;
    //     print(value.data![0].name);
    //     Logger().i(value.data);
    //   }
    // });
    phoneController = TextEditingController();
    companyNameController = TextEditingController();
    accountNameController = TextEditingController();
    emailController = TextEditingController();
    accountAdminNameController = TextEditingController();
    passwordController = TextEditingController();
    recordIDController = TextEditingController();
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
      return 'رقم الهاتف لا يقل 8 رقم';
    }else if(phoneMess.isNotEmpty){
      return phoneMess.value;
    }
    return null;
  }
  String? validatePassword(String val) {
    if (val.length < 8) {
      return 'كلمة المرور لا يقل عن 8 حروف او ارقام';
    }
    return null;
  }
  String? validateCompanyName(String val) {
    if (val.length < 5) {
      return 'الاسم لا يقل عن 5 حروف ';
    }else if(companyNameMess.isNotEmpty){
      return companyNameMess.value;
    }
    return null;
  }
  String? validateUserName(String val) {
    if (val.length < 5) {
      return 'الاسم لا يقل 5 حروف';
    }else if(nameMess.isNotEmpty){
      return nameMess.value;
    }
    return null;
  }
  String? validateAccountName(String val) {
    if (val.length < 5) {
      return 'الاسم لا يقل 5 حروف';
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
    if (!GetUtils.isNumericOnly(val)||val.length < 10) {
      return 'رقم الهوية لا يقل عن 10 ارقام';
    }else if(nationalIDMess.isNotEmpty){
      return nationalIDMess.value;
    }
    return null;
  }

  String? validateRecordID(String val) {
    if (!GetUtils.isNumericOnly(val)||val.length < 3) {
      return 'رقم السجل لا يقل عن 3 ارقام';
    }else if(recordIDMess.isNotEmpty){
      return recordIDMess.value;
    }
    return null;
  }
  String? validateAccountAdminName(String val) {
    if (val.length < 5) {
      return 'الادمن لا يقل عن 5 حروف';
    }else if(accountAdminNameMess.isNotEmpty){
      return accountAdminNameMess.value;
    }
    return null;
  }

  void checkLogin(BuildContext context) async{
   isValid.value = registerNewCompanyUserControllerKeyForm1.currentState!
        .validate();
    if (!isValid.value||errorRegister.value==true) {
      return;
    }
    registerNewCompanyUserControllerKeyForm1.currentState!.save();
    // loginClient();
   // Get.toNamed('/bakaPage');

      if(countryId.isNotEmpty&&areaId.isNotEmpty){
        photo =
            await dio.MultipartFile.fromFile(savedFile.value.path,
            filename: savedFile.value.path
                .substring(savedFile.value.path.lastIndexOf("/") + 1));

        registerCompanyUser(context);}
      else{
        Get.snackbar(
          "خطأ",
          'يجب اختيار الدولة ثم المدينة' ?? '',colorText: AppColors.white,
          icon: const Icon(Icons.person, color: Colors.black),
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,);
      }
  }

  // void changeAreas(int countryId){
  void changeAreas(Country country2) {

    areas.value = [];
    Country? country = countries.firstWhereOrNull((element) =>
    element.id == country2.id);
    if (country != null) {
      areas.value = country.areas!;
      areaId.value=areas[0].id.toString()??'0';
    }

    /*countries.forEach((element) {
      if(element.id==countryId){
        areas.add(element.)
      }
    });*/
  }
  // void changeAreas(Country country2) {
  //   areas.value = [];
  //   Country? country = countries.firstWhereOrNull((element) =>
  //   element.id == country2.id);
  //   if (country != null) {
  //     areas.value = country.areas!;
  //   }
  //   /*countries.forEach((element) {
  //     if(element.id==countryId){
  //       areas.add(element.)
  //     }
  //   });*/
  // }

  void registerCompanyUser(BuildContext context) {
    Repository repo = Repository();

    repo.postWithImageMultipart<RegisterClientUserResponse>(
        path: 'auth/register',
        fromJson: (json) => RegisterClientUserResponse.fromJson(json),
        json: {
          "company_name": companyNameController.text,
          "account_name": accountNameController.text,
          "area_id": areaId.value,
          "country_id": countryId.value,
          "email": emailController.text,
          "fcm_token": token,
          "role": 'user',
          "password": passwordController.text,
          "sgl": recordIDController.text,
          "phone": phoneController.text,
          "type": 'company',
          "username": companyNameController.text,
          "manager_name": accountAdminNameController.text,
          "image": photo
        },
        onSuccess: (res) async {
          storage.write(
              "data", registerClientUserResponse.value.toJson());
          print("registerToken ${res.data!.token}");
          await storage.write("token", res.data!.token);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:  Text('لقد تم تسجيلك بنجاح !',style: TextStyle(color:Colors.white,fontSize: 17,fontFamily: 'Arabic-Regular'),),
          ));
          Get.offAllNamed('/Home');
          //Get.toNamed('/chooseBakaPage');
        },
        onError: (err, res) {
          errorRegister.value = true;
          isValid.value = false;
          nationalIDMess.value = res.data!.personalId ?? '';
          phoneMess.value = res.data!.phone ?? '';
          nameMess.value = res.data!.username ?? '';
          accountNameMess.value = res.data!.accountName ?? '';
          emailMess.value = res.data!.email ?? '';
          // accountAdminNameMess.value=res.data!.;
          //  companyNameMess.value=''.obs;
           recordIDMess.value=res.data!.sgl??'';
          checkLogin(context);
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
    @override
    void onClose() {
      phoneController.dispose();

      super.onClose();
    }
  }
