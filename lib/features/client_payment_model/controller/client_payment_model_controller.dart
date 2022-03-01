
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


class ClientPaymentModelController extends GetxController {



  late TextEditingController noteController;

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

noteController=TextEditingController();

    super.onInit();
  }


  // void registerCompanyUser() {
  //   EasyLoading.show();
  //   Repository repo = Repository();
  //
  //   repo.postWithImageMultipart<RegisterCompanyResponse>(
  //       path: 'auth/register',
  //       fromJson: (json) => RegisterCompanyResponse.fromJson(json),
  //       json: {
  //         "company_name": companyNameController.text,
  //         "account_name": accountNameController.text,
  //         "area_id": areaId.value,
  //         "country_id": countryId.value,
  //         "email": emailController.text,
  //         "fcm_token": token,
  //         "password": passwordController.text,
  //         "sgl": recordIDController.text,
  //         "phone": phoneController.text,
  //         "role": 'advertiser',
  //         "type": 'company',
  //         "username": companyNameController.text,
  //         "manager_name": accountAdminNameController.text,
  //         "image": photo
  //       },
  //       onSuccess: (res) async {
  //         if (EasyLoading.isShow) {
  //           EasyLoading.dismiss();
  //         }
  //         registerCompanyResponse.value = res!;
  //         storage.write(
  //             "data", registerCompanyResponse.value.toJson());
  //         print("registerAdvertiseToken ${res.data!.token}");
  //         await storage.write("token", res.data!.token);
  //         Get.toNamed('/chooseBakaPage');
  //       },
  //       onError: (err, res) {
  //         errorRegister.value = true;
  //         isValid.value = false;
  //         nationalIDMess.value = res.data!.personalId ?? '';
  //         phoneMess.value = res.data!.phone ?? '';
  //         nameMess.value = res.data!.username ?? '';
  //         accountNameMess.value = res.data!.accountName ?? '';
  //         emailMess.value = res.data!.email ?? '';
  //         recordIDMess.value=res.data!.sgl??'';
  //         // accountAdminNameMess.value=res.data!.;
  //         //  companyNameMess.value=''.obs;
  //         // recordIDMess.value=''.obs;
  //
  //         if (EasyLoading.isShow) {
  //           EasyLoading.dismiss();
  //         }
  //         Get.snackbar(
  //           "خطأ",
  //           err.toString(),
  //           icon: const Icon(Icons.person, color: Colors.red),
  //           backgroundColor: Colors.yellow,
  //           snackPosition: SnackPosition.BOTTOM,);
  //       });
  // }
  @override
  void onClose() {
    noteController.dispose();

    super.onClose();
  }
}
