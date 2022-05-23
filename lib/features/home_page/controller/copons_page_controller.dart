import 'dart:async';

import 'package:advertisers/app_core/network/models/CoponModelResponse.dart';
import 'package:advertisers/app_core/network/models/GetCouponsFilterModel.dart';
import 'package:advertisers/app_core/network/models/SelectedNotSelectedFilterAdsType.dart';
import 'package:advertisers/app_core/network/requests/GetAdvertisersCoponsRequest.dart';
import 'package:advertisers/app_core/network/responses/CoponsResponse.dart';
import 'package:advertisers/main.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:logger/logger.dart';
//=========================================================================================

//                         By Mohamed T. Hammad

//=========================================================================================
class CoponsPageController extends GetxController {
  var isOpend = false;
  var position = -1;
  List<CoponModelResponse>? coponsResponse;
  late String myToken;

  int lastPage = -1;

  var isLoading = true.obs;
  var isEmpty = false.obs;
  var getAdsFilterForm = GetCouponsFilterModel().obs;

  RxList<SelectedNotSelectedFilterAdsType> advertisersTopRated = <SelectedNotSelectedFilterAdsType>[].obs;
  var isLoadingGetAdvertisersFromModel = true.obs;
  RxList<dynamic> selectedUserLocations = <dynamic>[].obs;
  var isFilterSavedClicked = false.obs;
  var isAreaEnabled = true.obs;
  var isCountryEnabled = true.obs;
  var selectedType = ''.obs;
  late TextEditingController searchAdvertiserController;
  final PagingController<int, CoponModelResponse> pagingController = PagingController(firstPageKey: 1);
  GetAdvertisersCoponsRequest getMyRequestsModelRequest = GetAdvertisersCoponsRequest(page: 1);
  Future<List<CoponModelResponse>> getCopons(
      {/*String brandId, String catgegoryId,*/ int? pageKey}) async {
    String myToken = await storage.read("token");
    Logger().i(getMyRequestsModelRequest!.toJson());
    getMyRequestsModelRequest!.page = pageKey;
    CoponsResponse response = await client!.getAppCopons(getMyRequestsModelRequest.toJson(),"Bearer " + myToken);
    final completer = Completer<List<CoponModelResponse>>();
    List<CoponModelResponse> notifications = [];
    if(response.data!=null && response.data!.isNotEmpty) {
      notifications = response.data!;
    }
    if(response.pagination?.last_page!=null){
      lastPage = response.pagination!.last_page!;
    }
    completer.complete(notifications);
    return completer.future;
    // return topSellingList;
  }

  Future<void> fetchPage(int pageKey) async {
    myToken = await storage.read("token");
    print("hhhhhhhhhhhhhhhhhhhhhhhhpageKey= "+pageKey.toString());
    print("hhhhhhhhhhhhhhhhhhhhhhhh="+myToken);
    try {
      List<CoponModelResponse> newItems = await getCopons(pageKey: pageKey);

     // bool isLastPage = newItems.isEmpty;
      if (lastPage==pageKey) {
       // print("isLast = " + isLastPage.toString());
        pagingController.appendLastPage(newItems);
        // pagingController. = "tony";
      } else {
        //final nextPageKey = pageKey + newItems.length;
        int nextPageKey = ++pageKey;
        print("nextPageKey=" + nextPageKey.toString());
        pagingController.appendPage(newItems, nextPageKey);
      }
      // print("first=" + newItems.first.Code.toString());
      //print("last=" + newItems.last.Code.toString());


    } catch (error) {
      pagingController.error = error;
    }
  }

  // Call this when the user pull down the screen
  Future<void> loadDataForCopos() async {
   // pagingController.refresh();
    getMyRequestsModelRequest = GetAdvertisersCoponsRequest(page: 1);
    pagingController.itemList=[];
    fetchPage(1);
  }
  Future<void> getCoponsFilterForm(BuildContext context) async {
    print("here");
    String myToken = await storage.read("token");
    client!.getCoupounsShopsFilterForm("Bearer " + myToken).then((value) {
      if (value.status == 200 && value.data != null) {
        getAdsFilterForm.value = value.data!;
        getAdsFilterForm.value.stores?.insert(0,'اختر متجر');
        advertisersTopRated.value = [];
        isLoadingGetAdvertisersFromModel.value = false;
        getAdsFilterForm.value.filters?.entries.forEach((element) {
          advertisersTopRated.add(
              SelectedNotSelectedFilterAdsType(
                name: element.value,
                key: element.key,
              ));
        });
      } else {
        isLoadingGetAdvertisersFromModel.value = false;
      }
    });
  }
  @override
  Future<void> onInit() async {
    // TODO: implement onInit
     myToken = await storage.read("token");
 /*   client!.getAppCopons("Bearer "+myToken).then((value) {
      print("token");
      //Logger().i(value.data?.toJson());
      if(value.data!=null&&value.status==200){
        // Get.back();
        Logger().i(value.data.toString());
        print("token111");
        coponsResponse = value.data!;
        update();
      }
    });*/
     searchAdvertiserController = TextEditingController();

    super.onInit();

    print("token");


  }
  void changeStatus(bool isOpend,int position, int id) {
    this.isOpend = isOpend;
    this.position = position;
   /* if(isOpend){
      client!.seenCopon(id,"Bearer "+myToken).then((value) {
        print("token");
        Logger().i(value.status.toString());
        if(value.status==200){
          // Get.back();
          print("copon seen ${id}");
          Logger().i(value.data.toString());
        }
      });
    }*/
    update();
  }

  void likeCopon(int? id) {
    client!.likeCopon(id!,"Bearer "+myToken).then((value) {
      print("token");
      Logger().i(value.status.toString());
      if(value.status==200){
        // Get.back();
        print("token liked");
        Logger().i(value.data.toString());
      }
    });
  }

  void disLike(int? id) {
    client!.dislikeCopon(id!,"Bearer "+myToken).then((value) {
      print("token");
      Logger().i(value.status.toString());
      if(value.status==200){
        // Get.back();
        print("token disliked");
        Logger().i(value.data.toString());
      }
    });
  }

  void shareLink(int? id) {
    client!.shareCopon(id!,"Bearer "+myToken).then((value) {
      print("token");
      Logger().i(value.status.toString());
      if(value.status==200){
        // Get.back();
        print("token shared");
        Logger().i(value.data.toString());
      }
    });
  }

  void useCopon(int? id) {
    client!.useCopon(id!,"Bearer "+myToken!).then((value) {
      print("token");
      Logger().i(value.status.toString());
      if(value.status==200){
        // Get.back();
        print("token used");
        Logger().i(value.data.toString());
      }
    });
  }

  onDateClickedSaved(BuildContext context) {
    isFilterSavedClicked.value = true;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "تم حفظ البيانات بنجاح !",
          style: TextStyle(
              color: Colors.white, fontSize: 17, fontFamily: 'Arabic-Regular'),
        )));
    Get.back();
    isLoading.value = true;
    List<String>? sortByStrings = [];
    advertisersTopRated.forEach((element) {
      if (element.isSelected.isTrue) {
        sortByStrings.add(element.key!);
      }
    });

    Logger().i(GetAdvertisersCoponsRequest(
      filters: sortByStrings.isNotEmpty ? sortByStrings.join(",") : null,
      store_name: selectedType.value!="اختر متجر"?selectedType.value:null,
        users: searchAdvertiserController.text.isNotEmpty
            ? searchAdvertiserController.text
            : null
    )
        .toJson());
    getMyRequestsModelRequest = GetAdvertisersCoponsRequest(

        filters: sortByStrings.isNotEmpty ? sortByStrings.join(",") : null,
        store_name: selectedType.value!="اختر متجر"?selectedType.value:null,
        users: searchAdvertiserController.text.isNotEmpty
            ? searchAdvertiserController.text
            : null);
    pagingController.refresh();
  }

  void showToast(msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 14.0,
    );
  }

  void onReturnClicked(BuildContext context) {
    isFilterSavedClicked.value = false;
    selectedType.value = '';
    advertisersTopRated.value.forEach((element) {
      element.isSelected.value = false;
    });
    selectedUserLocations.value = [];
    searchAdvertiserController.text = '';
        getMyRequestsModelRequest = GetAdvertisersCoponsRequest(page: 1);
    pagingController.refresh();
  }

}