import 'dart:async';

import 'package:advertisers/app_core/network/models/CoponModelResponse.dart';
import 'package:advertisers/app_core/network/responses/CoponsResponse.dart';
import 'package:advertisers/main.dart';
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

  final PagingController<int, CoponModelResponse> pagingController = PagingController(firstPageKey: 1);

  Future<List<CoponModelResponse>> getCopons(
      {/*String brandId, String catgegoryId,*/ int? pageKey}) async {
    String myToken = await storage.read("token");

    CoponsResponse response = await client!.getAppCopons(pageKey,"Bearer " + myToken);
    final completer = Completer<List<CoponModelResponse>>();
    List<CoponModelResponse> notifications = [];
    if(response.data!=null && response.data!.isNotEmpty) {
      notifications = response.data!;
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

      bool isLastPage = newItems.isEmpty;
      if (isLastPage) {
        print("isLast = " + isLastPage.toString());
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
    pagingController.refresh();
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
}