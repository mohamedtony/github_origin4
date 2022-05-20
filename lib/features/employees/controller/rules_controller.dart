import 'dart:io';

import 'package:advertisers/app_core/network/models/Employee.dart';
import 'package:advertisers/app_core/network/models/Operation.dart';
import 'package:advertisers/app_core/network/models/ReasonDataModel.dart';
import 'package:advertisers/app_core/network/models/RequestModel.dart';
import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/requests/AddEmployeeRequest.dart';
import 'package:advertisers/app_core/network/requests/AddRulesRequest.dart';
import 'package:advertisers/app_core/network/requests/SetRulesRequest.dart';
import 'package:advertisers/app_core/network/responses/AddEmployeeResponse.dart';
import 'package:advertisers/app_core/network/responses/GetRulesResponse.dart';
import 'package:advertisers/app_core/network/responses/ListEmployeesModelResponse.dart';
import 'package:advertisers/app_core/network/responses/ListOperationsResponse.dart';
import 'package:advertisers/app_core/network/responses/MyRequestsResponse.dart';
import 'package:advertisers/app_core/network/responses/RegisterClientUserResponse.dart';
import 'package:advertisers/app_core/network/responses/RejectRequestResponse.dart';
import 'package:advertisers/app_core/network/responses/ShowEmployeeDetailsResponse%20.dart';
import 'package:advertisers/app_core/network/responses/StopOrActivateResponse%20.dart';
import 'package:advertisers/features/employees/controller/employees_controller.dart';
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
import 'package:url_launcher/url_launcher.dart';

class RulesController extends GetxController  {

  var profileImage = ''.obs;
  var noImage='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScPr_e8yD_adDE0sUA6xJykV7Vuwyc0xQoun4XfAANTKGYdq2m99kHFf-Hc_XpY0YVnug&usqp=CAU';
  ShowEmployeeDetailsResponse showEmployeeDetails=ShowEmployeeDetailsResponse();
  List<bool> addAllRules = <bool>[].obs;
  var employeeId=0.obs;
  var isEdit=true.obs;
  List<int> roles= [];
  AddRulesRequest ruleRequest=AddRulesRequest();

  final ApiService _apiService = Get.put(ApiService());

  RxList<Rules> myEmployeeRules = <Rules>[].obs;
  late Repository repo;
  List<Operation> actions=[];
  List<int> actionsIds=[];
  List<String> actionsDate=[];
  List<String> actionsTime=[];
  ScrollController scrollController = ScrollController();  @override
  void onInit() {
    token =storage.read("token");
    repo=Repository();
    employeeId.value= Get.put(EmployeesController()).employeeId.value;
    print("employeeId.value in init #${employeeId.value}");
    getRules2(id: employeeId.value);
    super.onInit();
  }

  /// get employee rules
  void getRules2({int? id}) async {
  print("employees/${id}/roles");
    EasyLoading.show();
    repo.get<GetRulesResponse>(
        path: 'employees/$id/roles',
        fromJson: (json) => GetRulesResponse.fromJson(json),
        json: {"token": "Bearer $token"},//"Bearer  $token"},
        onSuccess: (res) {
          Logger().d(res.rules.toString());
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }

          if (res.status == 200  ) {
            Logger().d(res.rules.toString());
            myEmployeeRules.value = res.rules!;
          }
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


  /// set employee rules
  void setRules ({int? id}) async {
    EasyLoading.show();
    Map<String, dynamic> mymap = {
      "token":  "Bearer " + token,
      "roles[]": roles,
    };

    repo.postWithImageMultipart<AddEmployeeResponse>(
        path: 'employees/$id/roles',
        fromJson: (json) => AddEmployeeResponse.fromJson(json),
        json: mymap,
        onSuccess: (res) async {
          Logger().i(res.message!.toString());
          // if (res.message != null) {
          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //     content: Text('تم إنشاء طلبك بنجاح !', style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 17,
          //         fontFamily: 'Arabic-Regular'),),
          //   ));
          // }
              if(res.status==200){
              if (EasyLoading.isShow) {
              EasyLoading.dismiss();
              }
              getRules2(id: id);
              Get.snackbar("55حسنا",
              "تم اضافه صلاحيات الموظف بنجاح",
              icon: const Icon(Icons.check, color: Colors.green),
              backgroundColor: Colors.yellow,
              snackPosition: SnackPosition.TOP,);
              update();

              }else{
              if (EasyLoading.isShow) {
              EasyLoading.dismiss();
              }
              Get.snackbar(
              " خطأ ${res.status}",
              res.message.toString(),
              icon: const Icon(Icons.person, color: Colors.red),
              backgroundColor: Colors.yellow,
              snackPosition: SnackPosition.BOTTOM,);
              }
              update();
         },
        onError: (err, res) {
          Get.snackbar(
            " خطأ ${res.status}",
            res.message.toString(),
            icon: const Icon(Icons.person, color: Colors.red),
            backgroundColor: Colors.yellow,
            snackPosition: SnackPosition.BOTTOM,);
          Logger().i(err);
        });
  }

  void AddRules({int? id}) async {
    EasyLoading.show();
    //dio.FormData formData = dio.FormData.fromMap(request!.toJson());
    String url ='https://advertiser.cefour.com/api/v1/employees/$id/roles';
    print("URL+++> $url");
    try {
      final dio.Response response = await _apiService.dioClient.post(
        url,
        data: {
        "roles": "$roles",
       },

      );
      final res = AddEmployeeResponse.fromJson(response.data);
      Logger().i(response.data);

      if(res.status==200){
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }

        //getRules2(id: id);
        Get.snackbar("55حسنا",
          "تم اضافه صلاحيات الموظف بنجاح",
          icon: const Icon(Icons.check, color: Colors.green),
          backgroundColor: Colors.yellow,
          snackPosition: SnackPosition.TOP,);
        update();


      }else{
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }
        Get.snackbar(
          " خطأ ${res.status}",
          res.message.toString(),
          icon: const Icon(Icons.person, color: Colors.red),
          backgroundColor: Colors.yellow,
          snackPosition: SnackPosition.BOTTOM,);
      }
      update();

    } on dio.DioError catch (error) {
      if (EasyLoading.isShow) {
        EasyLoading.dismiss();
      }
      Get.snackbar(
        " خطأ",
        error.type.toString(),
        icon: const Icon(Icons.person, color: Colors.red),
        backgroundColor: Colors.yellow,
        snackPosition: SnackPosition.BOTTOM,);
      if (error.response?.statusCode == 401 ||
          error.response?.statusCode == 422) {
        // Error occurred while fetching data

      } else if (error.error is SocketException) {

      } else {

      }
    }
  }

  void setRules2({int? id}) async {
    EasyLoading.show();
    dio.Response response;
    try {
      response = await Dio().post(
         "https://advertiser.cefour.com/api/v1/employees/$id/roles",
        data: {
          "roles": "[18,19]",
        },
        options: Options(
          headers: {
            // 'Content-Type': 'application/json',
            // 'Accept-Type': 'application/json',
            "Authorization": "Bearer $token",
            "Accept": "application/json",
          },
          contentType: Headers.formUrlEncodedContentType,
          receiveTimeout: 15000,
          sendTimeout: 10000,
        ),
      );

      if(response.statusCode==200){
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }

        //getRules2(id: id);
        Get.snackbar("55حسنا",
          "تم اضافه صلاحيات الموظف بنجاح",
          icon: const Icon(Icons.check, color: Colors.green),
          backgroundColor: Colors.yellow,
          snackPosition: SnackPosition.TOP,);
           update();


      }else{
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }
        Get.snackbar(
          "66 خطأ  ",
          response.data.toString(),
          icon: const Icon(Icons.person, color: Colors.red),
          backgroundColor: Colors.yellow,
          snackPosition: SnackPosition.BOTTOM,);
      }
      update();


    } on DioError catch (e) {
      if (EasyLoading.isShow) {
        EasyLoading.dismiss();
      }
      Get.snackbar(
        "77 خطأ",
        e.message.toString(),
        icon: const Icon(Icons.person, color: Colors.red),
        backgroundColor: Colors.yellow,
        snackPosition: SnackPosition.BOTTOM,);
    }


  }






  @override
  void onClose() {

     super.onClose();
  }

}




