import 'package:advertisers/app_core/network/models/ReasonDataModel.dart';
import 'package:advertisers/app_core/network/models/RequestModel.dart';
import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/responses/MyRequestsResponse.dart';
import 'package:advertisers/app_core/network/responses/RefuseOrderReasonResponse.dart';
import 'package:advertisers/app_core/network/responses/RegisterClientUserResponse.dart';
import 'package:advertisers/app_core/network/responses/RejectRequestResponse.dart';
import 'package:advertisers/main.dart';
import 'package:advertisers/shared/networking/api_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';

import 'dart:io';
class ReasonRejectingAdvertisementController extends GetxController{

  var reasonDataModel=ReasonDataModel().obs;
  late Repository repo;
  late String token;
  @override
  void onInit() {
    // passIndex;
    myRefuseReason=RefuseOrderReasonResponse();
    repo=Repository();
    token =storage.read("token");
    //searchController=TextEditingController();
   // getRefuseReason();
    //getRejectRequestData();
    super.onInit();
  }
  String? validatePhone(String phone){
    if (phone.isEmpty){
      return 'حقل الادخال فارغ';
    }
    return null;
  }




 late int requestId;


  final ApiService _apiService = Get.put(ApiService());
  int currentPage = 1;

  late int totalPages=0;
  late RefuseOrderReasonResponse myRefuseReason;
  //List<RequestModel> myRequests = [];

  final RefreshController refreshController =
  RefreshController(initialRefresh: true);


  void getRefuseReason({int? requestId}) async {
    EasyLoading.show();

    try {
      final dio.Response response = await _apiService.dioClient.post(
        'https://advertiser.cefour.com/api/v1/requests/$requestId/reject',

      );
      final data = RefuseOrderReasonResponse.fromJson(response.data);
      if (EasyLoading.isShow) {
        EasyLoading.dismiss();
      }

        print("my reason# ${data.data}");
        myRefuseReason.data = data.data;
        update();

      Get.snackbar("${data.message}", "", snackPosition: SnackPosition.BOTTOM,);
      update();
      Logger().i(response!.data);
    } on dio.DioError catch (error) {

      if (EasyLoading.isShow) {
        EasyLoading.dismiss();
      }
      Get.snackbar(
        "خطأ",
        error.toString(),
        icon: const Icon(Icons.person, color: Colors.red),
        backgroundColor: Colors.yellow,
        snackPosition: SnackPosition.BOTTOM,);
    }
  }


  @override
  void onClose() {
    //searchController.dispose();
    super.onClose();
  }
}






