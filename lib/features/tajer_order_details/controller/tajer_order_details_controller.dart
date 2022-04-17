import 'dart:math';

import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/responses/AdvertiserOrderDetailsResponse.dart';
import 'package:advertisers/app_core/network/responses/ShowAdsDetailsResponse.dart';
import 'package:advertisers/shared/networking/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get.dart' hide FormData , Response;
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../../../main.dart';

class TajerOrderDetailsController extends GetxController {
  int? firstSeeMore = 2;
  int? secondSeeMore = 2;

  late AdvertiserOrderDetailsResponse myOderDetails;

  late Repository repo;
  late String token;
  @override
  void onInit() {
    token = storage.read("token");
    repo=Repository();
    getOderDetails();
    myOderDetails=AdvertiserOrderDetailsResponse();
    super.onInit();
  }

  late int requestId;
  final ApiService _apiService = Get.put(ApiService());
  updateSeeMore({required String builderId}) {
    if (builderId == 'First') {
      if (firstSeeMore == 2) {
        firstSeeMore = null;
      } else {
        firstSeeMore = 2;
      }
    } else {
      if (secondSeeMore == 2) {
        secondSeeMore = null;
      } else {
        secondSeeMore = 2;
      }
    }

    update([builderId]);
  }

  int selectedIndex = 0;
  updateSelectedIndex({required String builderId, int mSelectedIndex = 0}) {
    selectedIndex = mSelectedIndex;
    update([builderId]);
  }

  var showAdsDetailsResponse=ShowAdsDetailsResponse().obs;

  void getTajerData({int? id}) async {

    EasyLoading.show();
    repo.get<ShowAdsDetailsResponse>(
        path: 'ads/$id',
        fromJson: (json) => ShowAdsDetailsResponse.fromJson(json),
        json: {"token": "Bearer $token"},
        onSuccess: (res) {
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }

          //Logger().i(res.data);
          showAdsDetailsResponse.value.data=res.data;

          update();
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


  Future<bool> getOderDetails({int? requestId}) async {
    EasyLoading.show();
    repo.get<AdvertiserOrderDetailsResponse>(
        path: 'requests/$requestId',
        fromJson: (json) => AdvertiserOrderDetailsResponse.fromJson(json),
        json: {"token": "Bearer  $token"},
        onSuccess: (res) {
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }
          update();
          print("my reason# ${res.data}");
          myOderDetails.data = res.data;
          update();
          return true;

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
          return false;
        });

    return false;
  }


  void fetchOderDetails({int? requestId}) async {
    EasyLoading.show();
     String url ='https://advertiser.cefour.com/api/v1/requests/$requestId';
    try {
      final dio.Response response = await _apiService.dioClient.get(url,);
      final data = AdvertiserOrderDetailsResponse.fromJson(response.data);

      if (EasyLoading.isShow) {
        EasyLoading.dismiss();
      }
      update();
      print("my reason# ${data.data}");
      myOderDetails.data = data.data;
      update();
      Logger().i(response!.data);

    } on dio.DioError catch (error) {
      if (EasyLoading.isShow) {
        EasyLoading.dismiss();
      }
      Get.snackbar(
        "خطأ",
        error.message.toString(),
        icon: const Icon(Icons.person, color: Colors.red),
        backgroundColor: Colors.yellow,
        snackPosition: SnackPosition.BOTTOM,);
    }
  }


}
