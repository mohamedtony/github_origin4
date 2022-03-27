import 'dart:io';

import 'package:advertisers/app_core/network/models/Employee.dart';
import 'package:advertisers/app_core/network/models/Operation.dart';
import 'package:advertisers/app_core/network/models/ReasonDataModel.dart';
import 'package:advertisers/app_core/network/models/RequestModel.dart';
import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/requests/AddEmployeeRequest.dart';
import 'package:advertisers/app_core/network/responses/AddEmployeeResponse.dart';
import 'package:advertisers/app_core/network/responses/ListEmployeesModelResponse.dart';
import 'package:advertisers/app_core/network/responses/ListOperationsResponse.dart';
import 'package:advertisers/app_core/network/responses/MyRequestsResponse.dart';
import 'package:advertisers/app_core/network/responses/RegisterClientUserResponse.dart';
import 'package:advertisers/app_core/network/responses/RejectRequestResponse.dart';
import 'package:advertisers/shared/networking/api_provider.dart';
import 'package:advertisers/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';

class showEmployeeOperationsController extends GetxController with StateMixin<ListOperationsResponse>{

  List<Operation> actions=[];
  List<int> actionsIds=[];
  List<String> actionsDate=[];
  List<String> actionsTime=[];

  late Repository repo;
  @override
  void onInit() {
    // passIndex;
    repo=Repository();
    token =storage.read("token");


    super.onInit();
  }

  final RefreshController refreshController =
  RefreshController(initialRefresh: true);

  void restAll(){

   }

  final ApiService _apiService = Get.put(ApiService());

  /// fetch employee
  void fetchAnEmployeeOperations({int? id}) async {
    EasyLoading.show();
    String url ='https://advertiser.cefour.com/api/v1/employees/$id/actions';
    print("URL+++> $url");
    try {
      final dio.Response response = await _apiService.dioClient.get(
        url,
      );
      final data = ListOperationsResponse.fromJson(response.data);

      Logger().i(response!.data);

      if(data.status==200){
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }



        DateTime tempDate = DateTime.parse("2022-02-07T15:54:07.000000Z");
        String date = DateFormat("yyyy-MM-dd").format(tempDate);

        print("my date # $date");
        final dateTime = DateTime.parse("2022-02-07T15:54:07.000000Z");

        final format = DateFormat('HH:mm a');
        final clockString = format.format(dateTime);

        print("my time # $clockString");

      }
      else{
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

  /// fetchAnEmployeeOperations
  void fetchAnEmployeeOperations2({int? id}) async {
    //pageZero == true? page=1: page++;
    String url ='https://advertiser.cefour.com/api/v1/employees/$id/actions';
    print("URL+++> $url");
    try {
      final dio.Response response = await _apiService.dioClient.get(
        url,
      );
      final data = ListOperationsResponse.fromJson(response.data);
      Logger().i(response.data);
      data.data!.forEach((request) {
        if(!actionsIds.contains(request.id)){
          actions.add(request);
          actionsIds.add(request.id!);
          final dateTime = DateTime.parse(request.actionable!.createdAt!);
          final format = DateFormat('HH:mm a');
          actionsTime.add(format.format(dateTime));
        }
      });

      change(data, status: RxStatus.success());
      // Logger().i(response!.data);
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

  @override
  void onClose() {
     super.onClose();
  }

}




