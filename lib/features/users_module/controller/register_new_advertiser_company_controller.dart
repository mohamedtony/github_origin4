


import 'dart:io';

import 'package:advertisers/app_core/network/models/Area.dart';
import 'package:advertisers/app_core/network/models/Country.dart';
import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/responses/RegisterCompanyResponse.dart';
import 'package:advertisers/features/users_module/app_colors.dart';
import 'package:advertisers/main.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';


class RegisterNewAdvertiserCompanyController extends GetxController {
  GlobalKey<
      FormState> registerNewAdvertiserCompanyControllerKeyForm = GlobalKey<
      FormState>(debugLabel: 'registerNewAdvertiserCompanyControllerKeyForm');

  late TextEditingController phoneController;
  late TextEditingController companyNameController;
  late TextEditingController accountNameController;
  late TextEditingController accountAdminNameController;
  late TextEditingController emailController;
  late TextEditingController recordIDController;
  late TextEditingController passwordController;

  var isValid=false.obs;
  var errorRegister=false.obs;
  RxList<Country> countries = <Country>[].obs;
  RxList<Area> areas = <Area>[].obs;
  Rx registerCompanyResponse = RegisterCompanyResponse().obs;
  static dio.MultipartFile? photo;
  var imageBase641 = ''.obs;
  var areaId = ''.obs;
  var file =File(' ').obs;
  var countryId = ''.obs;
  var logoPath = ''.obs;
  var countryCode = '+966'.obs;
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  var password = '';
  var phone = '';
  var accountName = '';
  var nationalID = '';
  var savedFile = File(' ').obs;
  String email='';
  String companyName='';
  String accountAdminName='';
  String recordNumber='';
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

    client!.getCountries().then((value) {
      if (value.data != null) {
        countries.value = value.data!;
        print(value.data![0].name);
        Logger().i(value.data);
      }
    });
    phoneController = TextEditingController();
    companyNameController = TextEditingController();
    accountNameController = TextEditingController();
    emailController = TextEditingController();
    accountAdminNameController = TextEditingController();
    passwordController = TextEditingController();
    recordIDController = TextEditingController();

    phoneController.text=Get.parameters['phone'].toString();
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
      return 'الباسوورد لا يقل عن 8 حروف او ارقام';
    }
    return null;
  }
  String? validateCompanyName(String val) {
    if (val.length < 3) {
      return 'الاسم لا يقل عن 3 حروف ';
    }else if(companyNameMess.isNotEmpty){
      return companyNameMess.value;
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
    return null;
  }

  String? validateRecordID(String val) {
    if (val.length < 3) {
      return 'رقم السجل لا يقل عن 3 ارقام';
    }else if(recordIDMess.isNotEmpty){
      return recordIDMess.value;
    }
    return null;
  }
  String? validateAccountAdminName(String val) {
    if (val.length < 3) {
      return 'اسم الادمن لا يقل عن 3 حروف';
    }else if(accountAdminNameMess.isNotEmpty){
      return accountAdminNameMess.value;
    }
    return null;
  }
  void checkLogin()async {
    final isValid = registerNewAdvertiserCompanyControllerKeyForm.currentState!
        .validate();
    if (!isValid) {
      return;
    }
    registerNewAdvertiserCompanyControllerKeyForm.currentState!.save();
    // loginClient();
    // Get.toNamed('/bakaPage');

    if(countryId.isNotEmpty&&areaId.isNotEmpty){
      photo =
          await dio.MultipartFile.fromFile(savedFile.value.path,
          filename: savedFile.value.path
              .substring(savedFile.value.path.lastIndexOf("/") + 1));

      registerCompanyUser();}
    else{
      Get.snackbar(
        "خطأ",
        'يجب اختيار الدولة ثم المدينة' ?? '',colorText: AppColors.whiteColor,
        icon: const Icon(Icons.person, color: Colors.black),
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,);
    }
  }
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

  void registerCompanyUser() {
    EasyLoading.show();
    Repository repo = Repository();

    repo.postWithImageMultipart<RegisterCompanyResponse>(
        path: 'auth/register',
        fromJson: (json) => RegisterCompanyResponse.fromJson(json),
        json: {
          "company_name": companyNameController.text,
          "account_name": accountNameController.text,
          "area_id": areaId.value,
          "country_id": countryId.value,
          "email": emailController.text,
          "fcm_token": token,
          "password": passwordController.text,
          "sgl": recordIDController.text,
          "phone": phoneController.text,
          "role": 'advertiser',
          "type": 'company',
          "username": companyNameController.text,
          "manager_name": accountAdminNameController.text,
          "image": photo
        },
        onSuccess: (res) async {
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }
          registerCompanyResponse.value = res!;
          storage.write(
              "data", registerCompanyResponse.value.toJson());
          print("registerAdvertiseToken ${res.data!.token}");
          await storage.write("token", res.data!.token);
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
          recordIDMess.value=res.data!.sgl??'';
          // accountAdminNameMess.value=res.data!.;
          //  companyNameMess.value=''.obs;
          // recordIDMess.value=''.obs;
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
    @override
    void onClose() {
      phoneController.dispose();

      super.onClose();
    }
  }
