import 'package:advertisers/app_core/network/models/RequestModel.dart';
import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/responses/MyRequestsResponse.dart';
import 'package:advertisers/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MyOrdersController extends GetxController{

  var myRequestsAsClient=<RequestModel>[].obs;
  // var myRequestAsClient
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
    getRequestsData();
    super.onInit();
  }
  String? validatePhone(String phone){
    if (phone.isEmpty){
      return 'حقل الادخال فارغ';
    }
    return null;
  }



  void checkSearch(){
    final isValid=searchFormKey.currentState!.validate();
    if(!isValid){
      return;
    }
    searchFormKey.currentState!.save();
    // loginClient();
  }


  int currentPage = 1;

  late int totalPages=0;

  //List<RequestModel> myRequests = [];

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
    repo.get<MyRequestsResponse>(
        path: 'myrequests',
        fromJson: (json) => MyRequestsResponse.fromJson(json),
        json: {"token": "Bearer 767|ASU4Q35lP3HPA2IDbwbe7ZOAwJycP7ci1geR0icv"},//"Bearer  $token"},
        onSuccess: (res) {
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }

          if (isRefresh) {
            myRequestsAsClient.value = res.data?.requests??[];
              }else{
            myRequestsAsClient.addAll(res.data?.requests??[]);
              }

              currentPage++;

              totalPages = res.data?.pagination?.total??0;

             // print(response.body);
              //setState(() {});
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

    // final Uri uri = Uri.parse(
    //     "https://api.instantwebtools.net/v1/passenger?page=$currentPage&size=10");
    //
    // final response = await http.get(uri);
    //
    // if (response.statusCode == 200) {
    //   final result = passengersDataFromJson(response.body);
    //
    //   if (isRefresh) {
    //     passengers = result.data;
    //   }else{
    //     passengers.addAll(result.data);
    //   }
    //
    //   currentPage++;
    //
    //   totalPages = result.totalPages;
    //
    //   print(response.body);
    //   setState(() {});
    //   return true;
    // } else {
    //   return false;
    // }
    return false;
  }

  // getMyRequestsAsClient() {
  //   EasyLoading.show();
  //   repo.get<MyRequestsResponse>(
  //       path: 'myrequests',
  //       fromJson: (json) => MyRequestsResponse.fromJson(json),
  //       json: {"token": "Bearer  $token"},
  //       onSuccess: (res) {
  //         if (EasyLoading.isShow) {
  //           EasyLoading.dismiss();
  //         }
  //         myRequestsAsClient.value = res.data?.requests??[];
  //
  //
  //       },
  //       onError: (err, res) {
  //         if (EasyLoading.isShow) {
  //           EasyLoading.dismiss();
  //         }
  //         Get.snackbar(
  //           "خطأ",
  //           res.message.toString(),
  //           icon: const Icon(Icons.person, color: Colors.red),
  //           backgroundColor: Colors.yellow,
  //           snackPosition: SnackPosition.BOTTOM,);
  //       });
  // }
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


