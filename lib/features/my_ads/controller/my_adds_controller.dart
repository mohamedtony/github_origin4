import 'dart:io';

import 'package:advertisers/app_core/network/models/ReasonDataModel.dart';
import 'package:advertisers/app_core/network/models/ReasonModel.dart';
import 'package:advertisers/app_core/network/models/RequestModel.dart';
import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/responses/GetCancelReasonsResponse.dart';
import 'package:advertisers/app_core/network/responses/MyRequestsResponse.dart';
import 'package:advertisers/app_core/network/responses/RegisterClientUserResponse.dart';
import 'package:advertisers/app_core/network/responses/RejectRequestResponse.dart';
import 'package:advertisers/app_core/network/responses/RepostAdsResponse.dart';
import 'package:advertisers/app_core/network/responses/ShowAddsListResponse.dart';
import 'package:advertisers/app_core/network/responses/ShowEmployeeDetailsResponse%20.dart';
import 'package:advertisers/app_core/network/responses/ShowOnAppResponse.dart';
import 'package:advertisers/features/wallet_module/Response/wallet_card_toggle_response.dart';
import 'package:advertisers/main.dart';
import 'package:advertisers/shared/networking/api_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:logger/logger.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:dio/dio.dart' as dio;
class MyAddsController extends GetxController /*with StateMixin<ShowAddsListResponse>*/{

  var addsList=<AddModel>[].obs;
  var addsListIds=<int>[].obs;
  var currentIndex=0.obs;
  var reasons=<ReasonModel>[].obs;
  var reasonDataModel=ReasonDataModel().obs;
   final _verticalGroupValue=''.obs;
 // late ValueNotifier<String> _verticalGroupValue;
  // var myRequestAsClient
   List<int>? checkListShare = [];
   var registerClientUserResponse=RegisterClientUserResponse().obs;
   TextEditingController reasonController=TextEditingController();
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



  final ApiService _apiService = Get.put(ApiService());

  GlobalKey<FormState> searchFormKey=GlobalKey<FormState>();
  late TextEditingController searchController;
  var search='';
 late Repository repo;
 late String token;
  @override
  void onInit() {
    // passIndex;
    repo=Repository();
    token =storage.read("token");
    searchController=TextEditingController();
    //getRequestsData();
  //  fetchAdsList(pageZero: false);
    getAdsData();
    super.onInit();
  }
  String? validatePhone(String phone){
    if (phone.isEmpty){
      return 'حقل الادخال فارغ';
    }
    return null;
  }
  ScrollController scrollController = ScrollController();

  void loadMore()async{
    scrollController?.addListener(() async {
      if (scrollController?.position.maxScrollExtent ==
          scrollController?.position.pixels) {
       // fetchAdsList(pageZero: false);
        getAdsData(isRefresh: true);
      }
    });
  }

  void checkSearch(){
    final isValid=searchFormKey.currentState!.validate();
    if(!isValid){
      return;
    }
    searchFormKey.currentState!.save();
  }


  int currentPage = 1;

  late int totalPages=0;
  int page = 0;
  final RefreshController refreshController =
  RefreshController(initialRefresh: true);

  Future<bool> getRequestsData({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
    } else {
      if (currentPage >= totalPages) {
        refreshController.loadNoData();
        return false;
      }
    }
    EasyLoading.show();
    repo.get<ShowAddsListResponse>(
        path: 'ads',
        fromJson: (json) => ShowAddsListResponse.fromJson(json),
         json: {"token": "Bearer $token"},
        onSuccess: (res) {
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }

          Logger().i(res.data);
          if (isRefresh) {
            addsList.value = res.data??[];
              }else{
            addsList.addAll(res.data??[]);
              }
              currentPage++;
              totalPages = res.pagination?.total??0;

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


  void getAdsData({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
    } else {
      if (currentPage >= totalPages) {
        refreshController.loadNoData();
      }
    }
    EasyLoading.show();
    repo.get<ShowAddsListResponse>(
        path: 'myads',
        fromJson: (json) => ShowAddsListResponse.fromJson(json),
        json: {"token": "Bearer $token"},
        onSuccess: (res) {
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }


          Logger().i(res.data);
          // res.data!.forEach((request) {
          //   if(!addsList.contains(request.id)){
          //     addsList.add(request);
          //     addsListIds.add(request.id!);
          //   }
          // });

          if (isRefresh) {
            addsList.value = res.data??[];
          }else{
            addsList.value.addAll(res.data??[]);
          }

          currentPage++;
          totalPages = res.pagination?.total??0;

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


  void deleteAnAds({int? id}) async {
    EasyLoading.show();
    repo.delete<ShowOnAppResponse>(
        path: 'ads/$id',
        fromJson: (json) => ShowOnAppResponse.fromJson(json),
        json: {"token": "Bearer $token"},
        onSuccess: (res) async{
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }

          Logger().i(res.data);
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }

          if(res.status==200){
            if (EasyLoading.isShow) {
              EasyLoading.dismiss();
            }

            Get.snackbar("حسنا",
              "تم حذف الاعلان بنجاح",
              icon: const Icon(Icons.check, color: Colors.green),
              backgroundColor: Colors.yellow,
              snackPosition: SnackPosition.TOP,);

            //fetchAdsList();
            getAdsData(isRefresh: true);
            update();

          }else{
            if (EasyLoading.isShow) {
              EasyLoading.dismiss();
            }
            Get.snackbar(
              "خطأ",
              res.message.toString(),
              icon: const Icon(Icons.person, color: Colors.red),
              backgroundColor: Colors.yellow,
              snackPosition: SnackPosition.BOTTOM,);
          }

          getAdsData(isRefresh: true);
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


  /// show ads On App
  void showOnApp({int? id}) async {
    EasyLoading.show();
    repo.get<ShowOnAppResponse>(
        path: 'ads/$id/show_app',
        fromJson: (json) => ShowOnAppResponse.fromJson(json),
        json: {"token": "Bearer $token"},
        onSuccess: (res) async{
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }

          Logger().i(res.data);
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }

          if(res.data!.show==0){
            Get.snackbar("حسنا",
              "تم تنشيط عرض المنصة",
              icon: const Icon(Icons.check, color: Colors.green),
              backgroundColor: Colors.yellow,
              snackPosition: SnackPosition.TOP,);
          }else if(res.data!.show==1){
            Get.snackbar("حسنا",
              "تم ايقاف عرض المنصة",
              icon: const Icon(Icons.check, color: Colors.green),
              backgroundColor: Colors.yellow,
              snackPosition: SnackPosition.TOP,);
          }
          update();
         // fetchAdsList(pageZero: false);
          getAdsData(isRefresh: true);
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


  /// show ads On profile
  void showOnProfile({int? id}) async {
    EasyLoading.show();
    repo.get<ShowOnAppResponse>(
        path: 'ads/$id/show_profile',
        fromJson: (json) => ShowOnAppResponse.fromJson(json),
        json: {"token": "Bearer $token"},
        onSuccess: (res) async{
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }

          Logger().i(res.data);
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }

          if(res.data!.show==0){
            Get.snackbar("حسنا",
              "تم تنشيط عرض البروفايل",
              icon: const Icon(Icons.check, color: Colors.green),
              backgroundColor: Colors.yellow,
              snackPosition: SnackPosition.TOP,);
          }else if(res.data!.show==1){
            Get.snackbar("حسنا",
              "تم ايقاف عرض البروفايل",
              icon: const Icon(Icons.check, color: Colors.green),
              backgroundColor: Colors.yellow,
              snackPosition: SnackPosition.TOP,);
          }
          //fetchAdsList(pageZero: false);
          getAdsData(isRefresh: true);
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


  /// repost ads
  void repostAds({int? id}) async {
    EasyLoading.show();

    repo.get<RepostAdsResponse>(
        path: 'ads/$id/repost',
        fromJson: (json) => RepostAdsResponse.fromJson(json),
        json: {"token": "Bearer $token"},
        onSuccess: (res) async{
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }

          Logger().i(res.data);
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }

          if(res.status ==200){
            Get.snackbar("حسنا",
              "${res.message}",
              icon: const Icon(Icons.check, color: Colors.green),
              backgroundColor: Colors.yellow,
              snackPosition: SnackPosition.TOP,);
          }else  {
            Get.snackbar("حسنا",
              "${res.message}",
              icon: const Icon(Icons.check, color: Colors.green),
              backgroundColor: Colors.yellow,
              snackPosition: SnackPosition.TOP,);
          }
         // fetchAdsList(pageZero: false);
          getAdsData(isRefresh: true);
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


  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}


class UpperTabItem {
  int? id;
  String? title;
  UpperTabItem({
    this.id,
    this.title
});
}

List<UpperTabItem>? upperTabItems = [
  UpperTabItem(
      id: 0,
      title: "طلباتي"
  ),
  UpperTabItem(
      id: 1,
      title: "أرشيف طلباتي"
  ),
];


