import 'dart:math';

import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/requests/AddReplyOnCommentRequest.dart';
import 'package:advertisers/app_core/network/responses/AddEmployeeResponse.dart';
import 'package:advertisers/app_core/network/responses/AdvertiserOrderDetailsResponse.dart';
import 'package:advertisers/app_core/network/responses/ShowAdsDetailsResponse.dart';
import 'package:advertisers/app_core/network/requests/AddCommentRequest.dart';
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

  var showCommentField=false.obs;
  late AdvertiserOrderDetailsResponse myOderDetails;
  var noImage='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScPr_e8yD_adDE0sUA6xJykV7Vuwyc0xQoun4XfAANTKGYdq2m99kHFf-Hc_XpY0YVnug&usqp=CAU';

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

  var addCommentController=TextEditingController().obs;

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

  /// add comment
  void addCommentOnAds({AddCommentRequest? request,int? id }) async {
    EasyLoading.show();
    dio.FormData formData = dio.FormData.fromMap(request!.toJson());
    String url ='https://advertiser.cefour.com/api/v1/ads/$id/comment';
    Logger().i(request);
    print("URL+++> $url");
    try {
      final dio.Response response = await _apiService.dioClient.post(
        url,
        data: formData,
      );
      final data = AddEmployeeResponse.fromJson(response.data);
      Logger().i(response.data);

      if(data.status==200){
        showCommentField.value=false;
        addCommentController.value.clear();
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }
        Get.snackbar("حسنا",
          "تم اضافة التعليق بنجاح",
          icon: const Icon(Icons.check, color: Colors.green),
          backgroundColor: Colors.yellow,
          snackPosition: SnackPosition.TOP,);
        update();

      }else{
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }
        Get.snackbar(
          "خطأ",
          data.message.toString(),
          icon: const Icon(Icons.person, color: Colors.red),
          backgroundColor: Colors.yellow,
          snackPosition: SnackPosition.BOTTOM,);
      }

    } on dio.DioError catch (error) {
      Get.snackbar(
        "خطأ",
        error.message.toString(),
        icon: const Icon(Icons.person, color: Colors.red),
        backgroundColor: Colors.yellow,
        snackPosition: SnackPosition.BOTTOM,);
    }
  }

  void checkForAddingComment(int? clientId,int? commentId,String text){

    AddCommentRequest request=AddCommentRequest();
    request.comment= text;
    request.clientId=clientId;
    addCommentOnAds(request: request,id: commentId,);

  }

}
