


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

  RxList<Country> countries = <Country>[].obs;
  RxList<Area> areas = <Area>[].obs;
  Rx registerClientUserResponse = RegisterClientUserResponse().obs;
  static dio.MultipartFile? photo;
  var countryCode = '+966'.obs;
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
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
    }
    return null;
  }
  String? validatePassword(String val) {
    if (val.length < 6) {
      return 'الباسوورد لا يقل عن 6 حروف او ارقام';
    }
    return null;
  }
  String? validateCompanyName(String val) {
    if (val.length < 3) {
      return 'الباسوورد لا يقل عن 3 حروف ';
    }
    return null;
  }
  String? validateUserName(String val) {
    if (val.length < 3) {
      return 'الاسم لا يقل 3 رقم';
    }
    return null;
  }
  String? validateAccountName(String val) {
    if (val.length < 3) {
      return 'الاسم لا يقل 3 رقم';
    }
    return null;
  }
  String? validateEmail(String val) {
    if (!GetUtils.isEmail(val)) {
      return 'رجاء ادخل الايميل بشكل صحيح';
    }
    return null;
  }
  String? validateNationalId(String val) {
    if (val.length < 8) {
      return 'رقم الهوية لا يقل عن 10 ارقام';
    }
    return null;
  }

  String? validateRecordID(String val) {
    if (val.length < 3) {
      return 'رقم السجل لا يقل عن 3 ارقام';
    }
    return null;
  }
  String? validateAccountAdminName(String val) {
    if (val.length < 3) {
      return 'رقم الادمن لا يقل عن 3 ارقام';
    }
    return null;
  }
  void checkLogin(context) {
    final isValid = registerNewCompanyUserControllerKeyForm1.currentState!
        .validate();
    if (!isValid) {
      return;
    }
    registerNewCompanyUserControllerKeyForm1.currentState!.save();
    // loginClient();
   // Get.toNamed('/bakaPage');

      if(countryId.isNotEmpty&&areaId.isNotEmpty){
        registerCompanyUser(context: context);}
      else{
        Get.snackbar(
          "خطأ",
          'يجب اختيار الدولة ثم المدينة' ?? '',colorText: AppColors.white,
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

  void registerCompanyUser({required BuildContext context}) {
    Repository repo = Repository();

    repo.postWithImageMultipart<RegisterClientUserResponse>(
        path: 'auth/register',
        fromJson: (json) => RegisterClientUserResponse.fromJson(json),
        json: {
          "account_name": accountNameController.text,
          "area_id": areaId.value,
          "country_id": countryId.value,
          "email": emailController.text,
          "fcm_token": 'ffc',
          "role":'user',
          "password": passwordController.text,
          "sgl": recordIDController.text,
          "phone": phoneController.text,
          "type": 'company',
          "username": companyNameController.text,
          "manager_name":accountAdminNameController.text,
          "image": photo
        },
        onSuccess: (res) {
          storage.write(
              "data", registerClientUserResponse.value.toJson());
          Get.toNamed('/bakaPage');
        },
        onError: (err) {
          Get.snackbar(
            "خطأ",
            err.toString(),
            icon: const Icon(Icons.person, color: Colors.red),
            backgroundColor: Colors.yellow,
            snackPosition: SnackPosition.BOTTOM,);
        });
    @override
    void onClose() {
      phoneController.dispose();

      super.onClose();
    }
  }
}