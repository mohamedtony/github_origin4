import 'package:advertisers/app_core/network/models/Employee.dart';
import 'package:advertisers/app_core/network/models/ReasonDataModel.dart';
import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/responses/ListEmployeesModelResponse.dart';
import 'package:advertisers/app_core/network/responses/RegisterClientUserResponse.dart';
import 'package:advertisers/app_core/network/responses/advertising_requests_response.dart';
import 'package:advertisers/features/advertiser_details/controller/advertiser_details_controller.dart';
import 'package:advertisers/main.dart';
import 'package:advertisers/shared/networking/api_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart' hide FormData , Response;
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';

import 'dart:io';


import 'package:logger/logger.dart';

class AdvertisingRequestsController extends GetxController with StateMixin<AdvertisingRequestsResponse> {


  bool? isRepricing = false;

  TextEditingController reasonController=TextEditingController();
  var reasonDataModel=ReasonDataModel().obs;
  var registerClientUserResponse=RegisterClientUserResponse().obs;
  var selectedCities = '0'.obs;

  List <Areas>? areas = [];
  List <int>? areasIds= [];
  List <String>? areasCities= [];

  void addRemoveCity({Areas?area}){
   if(areasIds!.contains(area!.id)){
     areas!.remove(area!);
     areasIds!.remove(area!.id);
     areasCities!.remove(area!.name);
   }else{
     areas!.add(area!);
     areasIds!.add(area!.id!);
     areasCities!.add(area!.name!);
   }
   update();
  }

  var endAdvertisingDate = ''.obs;
  var dateStringTitle = 'اختر تاريخ محدد للطلب أو من - إلى'.obs;

  var dateRange = DateRange(fromDate: "",toDate: "").obs;

  void addDateRange(String? fromDate,toDate){
    dateRange.value = DateRange(fromDate: fromDate,toDate: toDate) ;
    endAdvertisingDate.value = toDate;
  }


  void addendAdvertisingDate(String? endDate){
    endAdvertisingDate.value = endDate!;
  }

  List<String>? sortTypesIds = [];

  void addRemoveSortTypes (String? id){
    if(sortTypesIds!.contains(id)){
      sortTypesIds!.remove(id);
    }else{
      sortTypesIds!.add(id!);
    }
    update();
  }

  void restAll(){
   parentRequests.clear();
    parentRequestsIds.clear();
    selectedCities = '0'.obs;
    areas!.clear();
    searchController.clear();
    areasIds!.clear();
    areasCities!.clear();
    sortTypesIds!.clear();
    endAdvertisingDate = ''.obs;
    dateStringTitle = 'اختر تاريخ محدد للطلب أو من - إلى'.obs;
    dateRange = DateRange(fromDate: "",toDate: "").obs;
    searchCustomerController.clear();
  }

  // late String token;
  // late Repository repo;

  final ApiService _apiService = Get.put(ApiService());

  int page = 0;
  var currentIndex=0.obs;
  List <ParentRequests> parentRequests = [];
  List<int> parentRequestsIds=[];




  List<int>? checkListClickProfile = [];
  void addAndRemoveOtherFromCheckProfile(id){
    checkListShare!.clear();
    checkListFunctions!.clear();
    if(checkListClickProfile!.contains(id)){
      checkListClickProfile!.clear();
    }else{
      checkListClickProfile!.clear();
      checkListClickProfile!.add(id);
      update();
    }

    update();
  }

  List<int>? checkListShare = [];

  void addAndRemoveOtherFromCheckListShare(id){
    if(checkListShare!.contains(id)){
      checkListShare!.clear();
    }else{
      checkListShare!.clear();
      checkListShare!.add(id);
      update();
    }

    update();
  }
  List<int>? checkListFunctions = [];


  void openSingleItemFromCheckListFunctions(id){
    checkListShare!.clear();
    checkListFunctions!.clear();
    checkListFunctions!.add(id);
    update();
  }


  void closeSingleItemFromCheckListFunctions(id){
    checkListShare!.clear();
    checkListFunctions!.clear();
    // checkListFunctions!.add(id);
    update();
  }




  void addAndRemoveOtherFromCheckListFunctions(id){
    if(checkListFunctions!.contains(id)){
      checkListFunctions!.clear();
    }else{
      checkListFunctions!.clear();
      checkListFunctions!.add(id);
      update();
    }
    update();
  }




  int tabId = 1;
  void passIndex(newIndex){
    tabId = newIndex;
    update();
  }





  GlobalKey<FormState> searchFormKey=GlobalKey<FormState>();
  final TextEditingController searchController = TextEditingController();
  final TextEditingController searchCustomerController = TextEditingController();
  var search='';

  ScrollController scrollController = ScrollController();




  @override
  void onInit() {
    restAll();
    loadMore();
    fetchAdvertisingRequests(pageZero: false);
    super.onInit();
  }

  void loadMore()async{
    scrollController?.addListener(() async {
      if (scrollController?.position.maxScrollExtent ==
          scrollController?.position.pixels) {
        fetchAdvertisingRequests(pageZero: false);
      }
    });
  }


  String? validatePhone(String phone){
    if (phone.isEmpty){
      return 'حقل الادخال فارغ';
    }
    return null;
  }


  /// confirmTransferService
  void confirmTransferService({int? requestId}) async {
    try {
      final dio.Response response = await _apiService.dioClient.get(
        'https://advertiser.cefour.com/api/v1/requests/$requestId/transfer/accept',
      );
      final data = AdvertisingRequestsResponse.fromJson(response.data);
      Get.snackbar(
        "${data.message}",
        "",
        snackPosition: SnackPosition.BOTTOM,);
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
  ///
  ///
  /// rejectTransferService
  void rejectTransferService({int? requestId}) async {
    try {
      final dio.Response response = await _apiService.dioClient.get(
        'https://advertiser.cefour.com/api/v1/requests/$requestId/transfer/reject',
      );
      final data = AdvertisingRequestsResponse.fromJson(response.data);
      Get.snackbar(
        "${data.message}",
        "",
        snackPosition: SnackPosition.BOTTOM,);
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
  ///
  ///
  /// advertiserConfirmService
  void advertiserConfirmService({int? requestId}) async {
    try {
      final dio.Response response = await _apiService.dioClient.get(
        'https://advertiser.cefour.com/api/v1/requests/$requestId/advertiser_confirm',
      );
      final data = AdvertisingRequestsResponse.fromJson(response.data);
      Get.snackbar(
        "${data.message}",
        "",
        snackPosition: SnackPosition.BOTTOM,);
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
  ///
  ///
  void rejectRequestService({int? requestId}) async {
    EasyLoading.show();
    FormData formData = FormData.fromMap({
      'reason': reasonController.text,
    });
    try {
      final dio.Response response = await _apiService.dioClient.post(
        'https://advertiser.cefour.com/api/v1/requests/$requestId/reject',
        data: formData,
      );
      final data = AdvertisingRequestsResponse.fromJson(response.data);
      if (EasyLoading.isShow) {
        EasyLoading.dismiss();
      }
      Get.snackbar("${data.message}", "", snackPosition: SnackPosition.BOTTOM,);
      update();
      // change(data, status: RxStatus.success());
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
  ///




  /// fetchAdvertisingRequests
  void fetchAdvertisingRequests({bool? pageZero}) async {
    pageZero == true? page=1: page++;
    String url ='https://advertiser.cefour.com/api/v1/myrequests?page=$page&keyword=${searchController.text}&sort_by=${sortTypesIds!.join(",")}&from_date=${dateRange.value.fromDate??endAdvertisingDate.value}&to_date=${dateRange.value.toDate??""}&advertiser_name=${searchCustomerController.text}&areas=${areasCities!.join(",")}';
    print("XXXURLXXX+++> $url");
    try {
      final dio.Response response = await _apiService.dioClient.get(
        url,
      );
      final data = AdvertisingRequestsResponse.fromJson(response.data);
      data!.data!.parentRequests!.forEach((request) {
        if(!parentRequestsIds.contains(request.id)){
          parentRequests.add(request);
          parentRequestsIds.add(request.id!);
        }
      });

print("parentRequests ==> lenght == > ${parentRequests.length}");
      //..
      // Successfully fetched news data
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


  void checkSearch(){
    final isValid=searchFormKey.currentState!.validate();
    if(!isValid){
      return;
    }
    searchFormKey.currentState!.save();
    // loginClient();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}

