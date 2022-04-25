import 'package:advertisers/app_core/network/models/ListChatModel.dart';
import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/responses/ListChatResponse.dart';
import 'package:advertisers/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ChatController extends GetxController {

var listChat=<ListChatModel>[].obs;
late String token;
late Repository repo;
final RefreshController refreshController =
RefreshController(initialRefresh: true);
  @override
  void onInit() {
    repo=Repository();
    token = storage.read("token");

    //getChatList();

    super.onInit();
  }
var currentIndex=0.obs;
int currentPage = 1;

late int totalPages=0;

Future<bool> getChatList({bool isRefresh = false}) async {
if (isRefresh) {
currentPage = 1;
} else {
if (currentPage >= totalPages) {
refreshController.loadNoData();
return false;
}
}
    EasyLoading.show();

    try {
      repo.get<ListChatResponse>(
          path: 'chat',
          fromJson: (json) => ListChatResponse.fromJson(json),
          json: {"token": "Bearer  $token"},
          onSuccess: (res) {
            if (EasyLoading.isShow) {
              EasyLoading.dismiss();
            }
            listChat.value = res.data!.reversed.toList();

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
          });
    } catch (e) {
      Get.snackbar(
        "خطأ",
        "حدث خطأ ما",
        icon: const Icon(Icons.person, color: Colors.red),
        backgroundColor: Colors.yellow,
        snackPosition: SnackPosition.BOTTOM,);
      return false;
    }
return false;
  }

}
