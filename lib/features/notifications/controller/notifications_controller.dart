
import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/responses/NotificationsResponse.dart';
import 'package:advertisers/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

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
        json:{"token":token,},onSuccess:(res) {

          if(EasyLoading.isShow){
            EasyLoading.dismiss();
          }
        notifications.value=res.data??[];

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

}