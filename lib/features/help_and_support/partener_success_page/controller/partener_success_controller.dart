import 'package:advertisers/app_core/network/models/PartenerModel.dart';
import 'package:advertisers/app_core/network/models/TaxSettingsModel.dart';
import 'package:advertisers/app_core/network/models/VideoModel.dart';
import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/responses/GuidesVideosResponse.dart';
import 'package:advertisers/app_core/network/responses/PartenersSuccessResponse.dart';
import 'package:advertisers/app_core/network/responses/TaxSettingsResponse.dart';
import 'package:advertisers/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';


class PartnerSuccessController extends GetxController {
  var partners=<PartnerModel>[].obs;
  late Repository repo;
  @override
  void onInit() {
    token = storage.read("token");
    // passIndex;
    repo = Repository();
    getPartners();
    super.onInit();
  }
  getPartners() {
    EasyLoading.show();


    repo.get<PartenersSuccessResponse>(
        path: 'support/partners',
        fromJson: (json) => PartenersSuccessResponse.fromJson(json),
        json: {"token": "Bearer  $token",
        },
        onSuccess: (res) {
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }
          partners.value=res.data!;
        },
        onError: (err, res) {
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }
          Get.snackbar(
            "خطأ",
            res.message.toString(),
            icon: const Icon(Icons.person, color: Colors.red),
            backgroundColor: Colors.yellow,
            snackPosition: SnackPosition.BOTTOM,);
        });
  }

  @override
  void onClose() {


    super.onClose();
  }

}

