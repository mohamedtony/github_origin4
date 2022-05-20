
import 'package:advertisers/app_core/network/models/NotificationsModel.dart';
import 'package:advertisers/app_core/network/models/StarNotificationModel.dart';
import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/responses/GeneralResponse.dart';
import 'package:advertisers/app_core/network/responses/NotificationsResponse.dart';
import 'package:advertisers/app_core/network/responses/StarMessageResponse.dart';
import 'package:advertisers/app_core/network/responses/StarNotificationResponse.dart';
import 'package:advertisers/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
enum NotificationType {
  platform,
  orders,
  hiring,
  wallet,
  payment,
  chat,
  comments,
  settings,
  ads,
  coupons,
  support,
  reports,
  accounts,
  subscriptions
}
class NotificationsController extends GetxController {
  late String token;
  var notifications=<NotificationsModel>[].obs;

  @override
  void onInit() {
   token =storage.read('token');
   getNotifications();
    super.onInit();
  }
  var selectedIndex=0.obs;
  int currentPage = 1;

  late int totalPages=0;

  //List<RequestModel> myRequests = [];

  final RefreshController refreshController =
  RefreshController(initialRefresh: true);
   getNotifications({bool isRefresh = false}) async {
     if (isRefresh) {
       currentPage = 1;
     } else {
       if (currentPage >= totalPages) {
         refreshController.loadNoData();
         return false;
       }
     }
    EasyLoading.show();
    Repository repo=Repository();
    repo.get<NotificationsResponse>(path: 'notifications',fromJson:(json) => NotificationsResponse.fromJson(json),
        json:{"token":"Bearer $token",},onSuccess:(res) {

          if(EasyLoading.isShow){
            EasyLoading.dismiss();
          }
        notifications.value=res.data??[];
update();
return true;
        },onError: (err,res){

          if(EasyLoading.isShow){
            EasyLoading.dismiss();
          }
          Get.snackbar(
            "خطأ",
            err.toString(),
            icon: const Icon(Icons.person, color: Colors.red),
            backgroundColor: Colors.yellow,
            snackPosition: SnackPosition.BOTTOM,);
          return true;
        });
     return true;
  }

  // void read(int index) {
  //   notifications[index].read = true;
  //   update();
  // }
  //
  void remove(int index) {
    notifications.removeAt(index);
    update();
  }
  //
  // void pin(int index) {
  //   notifications[index].pinned = !notifications[index].pinned;
  //   notifications.sort((a, b) {
  //     if (b.pinned) {
  //       return 1;
  //     } else {
  //       return -1;
  //     }
  //   });
  //   update();
  // }

  bool checked = false;
  void termsCheckBox(bool value) {
    checked = value;
    update();
  }

  void starMessage({required int notificationId}) {
    EasyLoading.show();
    Repository repo = Repository();

    repo.get<StarMessageResponse>(
        path: 'notifications/$notificationId/star',
        fromJson: (json) => StarMessageResponse.fromJson(json),
        json: {
          "token": "Bearer $token",

        },
        onSuccess: (res) {
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }
          notifications[selectedIndex.value].starred=res.data?.starred??0;
          update();
        },
        onError: (err, res) {

          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }
          Get.snackbar(
            "خطأ",
            err.toString(),
            icon: const Icon(Icons.person, color: Colors.red),
            backgroundColor: Colors.yellow,
            snackPosition: SnackPosition.BOTTOM,);
        });
  }
}