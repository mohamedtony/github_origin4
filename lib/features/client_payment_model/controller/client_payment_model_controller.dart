
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
  late TextEditingController dateController;
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
  late String token;
  //Repository repo=Repository();
  @override
  void onInit() {
    //repo.postWithImageMultipart({})
    dateController=TextEditingController();
noteController=TextEditingController();
token=storage.read("token");
    super.onInit();
  }


  void bankTransfer() {
    EasyLoading.show();
    Repository repo = Repository();

    repo.postWithImageMultipart<RegisterCompanyResponse>(
        path: 'requests/${Get.parameters['requestId']}/transfer',
        fromJson: (json) => RegisterCompanyResponse.fromJson(json),
        json: {
          "name":"stc pya",
           "date":dateController.text,
          "image": photo,
          "token":"Bearer $token"
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

          // accountAdminNameMess.value=res.data!.;
          //  companyNameMess.value=''.obs;
          // recordIDMess.value=''.obs;

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
    noteController.dispose();

    super.onClose();
  }
}
