
import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/responses/NotificationsResponse.dart';
import 'package:advertisers/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
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
  var notifications=[].obs;

  @override
  void onInit() {
   token =storage.read('token');
   getNotifications();
    super.onInit();
  }
  Future<void> getNotifications() async {

    EasyLoading.show();
    Repository repo=Repository();
    repo.get<NotificationsResponse>(path: 'notifications',fromJson:(json) => NotificationsResponse.fromJson(json),
        json:{"token":"Bearer $token",},onSuccess:(res) {

          if(EasyLoading.isShow){
            EasyLoading.dismiss();
          }
        notifications.value=res.data??[];
update();
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
        });

  }

  void read(int index) {
    notifications[index].read = true;
    update();
  }

  void remove(int index) {
    notifications.removeAt(index);
    update();
  }

  void pin(int index) {
    notifications[index].pinned = !notifications[index].pinned;
    notifications.sort((a, b) {
      if (b.pinned) {
        return 1;
      } else {
        return -1;
      }
    });
    update();
  }

  bool checked = false;
  void termsCheckBox(bool value) {
    checked = value;
    update();
  }

}