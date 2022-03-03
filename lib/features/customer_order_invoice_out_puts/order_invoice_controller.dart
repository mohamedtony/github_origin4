import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/responses/advertising_requests_response.dart';
import 'package:advertisers/app_core/network/responses/customer_order_invoice_outputs_response.dart';
import 'package:advertisers/features/advertiser_details/controller/advertiser_details_controller.dart';
import 'package:advertisers/shared/networking/api_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'dart:io';


import 'package:logger/logger.dart';

class OrderInvoiceController extends GetxController with StateMixin<CustomerOrderInvoiceOutPutsResponse> {
  dynamic argumentData = Get.arguments;



  late String token;
  late Repository repo;

  final ApiService _apiService = Get.put(ApiService());




  @override
  void onInit() {
    repo=Repository();
    // fetchInvoiceData();

    super.onInit();
    // print(argumentData[0]['user_data']);
  }





  /// With Dio
  void fetchInvoiceData({int? requestId}) async {
    String url ='https://advertiser.cefour.com/api/v1/requests/$requestId/bill';
    print("XXXURLXXX+++> $url");
    try {

      final dio.Response response = await _apiService.dioClient.get(
        url,
      );

      final data = CustomerOrderInvoiceOutPutsResponse.fromJson(response.data);




      change(data, status: RxStatus.success());
      Logger().i(response!.data);
    } on dio.DioError catch (error) {
      if (error.response?.statusCode == 401 ||
          error.response?.statusCode == 422) {
        // Error occurred while fetching data
        change(null,
            status: RxStatus.error(
                'حدث خطأ ما ${error.response?.statusCode}'));
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
  Advertiser? user;


  @override
  onReady(){
    super.onReady();

    user = Get.arguments;

    update();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

