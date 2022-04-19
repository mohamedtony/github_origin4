import 'dart:io';

import 'package:advertisers/features/wallet_module/Response/charge_response.dart';
import 'package:advertisers/features/wallet_module/request/charge_request.dart';
import 'package:advertisers/shared/networking/api_provider.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class ChargeController extends GetxController with StateMixin<ChargeResponse> {

  TextEditingController amountController = TextEditingController();


  int paymentId = -1;
  void passPaymentIndex(newIndex) {
    paymentId = newIndex;
    update(['ChargeCard']);
  }

  final ApiService _apiService = Get.put(ApiService());

  @override
  void onInit() {
    super.onInit();

    getChargeData();
  }

  void getChargeData() async {
    try {
      final dio.Response response = await _apiService.dioClient.get(
        'https://advertiser.cefour.com/api/v1/wallet/charge',
      );
      final data = ChargeResponse.fromJson(response.data);
      // Get.snackbar(
      //   "${data.message}",
      //   "",
      //   snackPosition: SnackPosition.BOTTOM,
      // );
      change(data, status: RxStatus.success());
      amountController.clear();
      Logger().i(response.data);
    } on dio.DioError catch (error) {
      if (error.response?.statusCode == 401 ||
          error.response?.statusCode == 422) {
        // Error occurred while fetching data
        change(null,
            status: RxStatus.error('حدث خطأ ما ${error.response?.statusCode}'));
      } else if (error.error is SocketException) {
        change(null,
            status: RxStatus.error(
                'لا يوجد اتصال بالانترنت ${error.response?.statusCode}'));
      } else {
        String errorDescription = 'حدث خطأ ما حاول في وقت لاحق';
        change(null, status: RxStatus.error(errorDescription));
      }
    }
  }

  chargeWallet({required ChargeRequest request}) async {
    final dio.FormData formData = dio.FormData.fromMap(request.toJson());
    try {
      final dio.Response response = await _apiService.dioClient.post(
        'https://advertiser.cefour.com/api/v1/wallet/charge',
        data: formData,
      );
      final data = ChargeResponse.fromJson(response.data);
      getChargeData();
      // change(data, status: RxStatus.success());
      Get.snackbar(
        "${data.message}",
        "",
        snackPosition: SnackPosition.BOTTOM,
      );
      Logger().i(response.data);
    } on dio.DioError catch (error) {
      Get.snackbar(
        "خطأ",
        "حدث خطأ ما حاول في وقت لاحق",
        snackPosition: SnackPosition.BOTTOM,
      );
      if (error.response?.statusCode == 401 ||
          error.response?.statusCode == 422) {
        // Error occurred while fetching data
        // change(null,
        //     status: RxStatus.error('حدث خطأ ما ${error.response?.statusCode}'));
      } else if (error.error is SocketException) {
        // change(null,
        //     status: RxStatus.error(
        //         'لا يوجد اتصال بالانترنت ${error.response?.statusCode}'));
      } else {
        String errorDescription = 'حدث خطأ ما حاول في وقت لاحق';
        // change(null, status: RxStatus.error(errorDescription));
      }
    }
  }
}
