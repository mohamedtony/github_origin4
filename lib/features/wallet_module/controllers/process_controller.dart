import 'dart:io';

import 'package:advertisers/features/wallet_module/Response/charge_response.dart';
import 'package:advertisers/features/wallet_module/Response/history_response.dart';
import 'package:advertisers/features/wallet_module/Response/points_response.dart';
import 'package:advertisers/features/wallet_module/request/points_request.dart';
import 'package:advertisers/shared/networking/api_provider.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class ProcessesController extends GetxController with StateMixin<HistoryResponse> {
  final ApiService _apiService = Get.put(ApiService());

  ScrollController scrollController = ScrollController();
  int page = 0;

  List <History> historyItems = [];
  List<int> historyItemsIds=[];

  @override
  void onInit() {
    super.onInit();
    loadMore();
    getProcessesData();
  }

  void loadMore()async{
    scrollController?.addListener(() async {
      if (scrollController?.position.maxScrollExtent ==
          scrollController?.position.pixels) {
        getProcessesData();
      }
    });
  }

  void getProcessesData() async {
    page++;
    try {
      final dio.Response response = await _apiService.dioClient.get(
        'https://advertiser.cefour.com/api/v1/wallet/history?page=$page',
      );
      final data = HistoryResponse.fromJson(response.data);

      for (var request in data!.data!.history!) {
        if(!historyItemsIds.contains(request.id)){
          historyItems.add(request);
          historyItemsIds.add(request.id!);
        }
      }
      change(data, status: RxStatus.success());
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

}
