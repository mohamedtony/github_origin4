import 'dart:convert';
import 'dart:io';

import 'package:advertisers/app_core/network/models/FromUserModel.dart';
import 'package:advertisers/app_core/network/models/ListChatModel.dart';
import 'package:advertisers/app_core/network/models/MessageChatModel.dart';
import 'package:advertisers/app_core/network/models/ToUserModel.dart';
import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/responses/ListChatResponse.dart';
import 'package:advertisers/app_core/network/responses/SendMessageResponse.dart';
import 'package:advertisers/app_core/network/responses/StarMessageResponse.dart';
import 'package:advertisers/app_core/network/responses/UploadFileResponse.dart';
import 'package:advertisers/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:dio/dio.dart' as dio;
class ChatMessagesController extends GetxController {

  var messagesChat=<ListChatModel>[].obs;
  static dio.MultipartFile? photo;
  var tapped=false.obs;
  var replied=false.obs;
  var chatIndex = 0.obs;
  var repliedIndex=0.obs;
  var savedFile = File(' ').obs;
  var file =File(' ').obs;
  var imageBase641 = ''.obs;
  var  isStar=0.obs;
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

  Future<bool> getMessagesList({bool isRefresh = false,required String room}) async {
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
          path: 'chat/$room',
          fromJson: (json) => ListChatResponse.fromJson(json),
          json: {"token": "Bearer  $token"},
          onSuccess: (res) {
            if (EasyLoading.isShow) {
              EasyLoading.dismiss();
            }
            messagesChat.value = res.data!.reversed.toList();

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
      if (EasyLoading.isShow) {
        EasyLoading.dismiss();
      }
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

 void uploadFile({required dio.MultipartFile file,required String room,required String type}) async {

    EasyLoading.show();

    try {
      repo.postWithImageMultipart<UploadFileResponse>(
          path: 'chat/upload_file',
          fromJson: (json) => UploadFileResponse.fromJson(json),
          json: {"token": "Bearer  $token",
            "room":room,"file":file,"type":type},
          onSuccess: (res) {
            if (EasyLoading.isShow) {
              EasyLoading.dismiss();
            }
            FromUserModel fromUserModel=FromUserModel.fromJson(jsonDecode(Get.parameters["from_user"]??''));
            ToUserModel toUserModel=ToUserModel.fromJson(jsonDecode(Get.parameters["to_user"]??''));
            //ToUserModel toUserModel=json.decode(Get.parameters["to_user"]??"");
            sendMessage(MessageChatModel(room: room,message: res.data?.link??' ',type: type,
                from_user_id: fromUserModel.id,
                to_user_id: toUserModel.id.toString()));
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
      if (EasyLoading.isShow) {
        EasyLoading.dismiss();
      }
      Get.snackbar(
        "خطأ",
        "حدث خطأ ما",
        icon: const Icon(Icons.person, color: Colors.red),
        backgroundColor: Colors.yellow,
        snackPosition: SnackPosition.BOTTOM,);

    }

  }

  void sendMessage(MessageChatModel message) async {

    EasyLoading.show();

    try {
      repo.postWithImageMultipart<SendMessageResponse>(
          path: 'send_message',
          fromJson: (json) => SendMessageResponse.fromJson(json),
          json: {"token": "Bearer  $token","message":message.message,"type":message.type,
            "to_user_id":message.to_user_id,"from_user_id":message.from_user_id},
          onSuccess: (res) {
            if (EasyLoading.isShow) {
              EasyLoading.dismiss();
            }
            //messagesChat.value = res.data!;

            //update();

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
      if (EasyLoading.isShow) {
        EasyLoading.dismiss();
      }
      Get.snackbar(
        "خطأ",
        "حدث خطأ ما",
        icon: const Icon(Icons.person, color: Colors.red),
        backgroundColor: Colors.yellow,
        snackPosition: SnackPosition.BOTTOM,);

    }

  }

  void starMessage(int messageId) async {

    EasyLoading.show();

    try {
      repo.get<StarMessageResponse>(
          path: 'chat/$messageId/star',
          fromJson: (json) => StarMessageResponse.fromJson(json),
          json: {"token": "Bearer  $token",},
          onSuccess: (res) {
            if (EasyLoading.isShow) {
              EasyLoading.dismiss();
            }
            isStar.value = res.data!.starred??0;
            update();
            print('HHHHHHHHHHHHHHHHHH${res.data!.starred??0}');
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
      if (EasyLoading.isShow) {
        EasyLoading.dismiss();
      }
      Get.snackbar(
        "خطأ",
        "حدث خطأ ما",
        icon: const Icon(Icons.person, color: Colors.red),
        backgroundColor: Colors.yellow,
        snackPosition: SnackPosition.BOTTOM,);

    }

  }

  void deleteMessage(int messageId) async {

    EasyLoading.show();

    try {
      repo.delete<StarMessageResponse>(
          path: 'chat/$messageId/delete',
          fromJson: (json) => StarMessageResponse.fromJson(json),
          json: {"token": "Bearer  $token",},
          onSuccess: (res) {
            if (EasyLoading.isShow) {
              EasyLoading.dismiss();
            }
           // isStar.value = res.data!.starred??0;
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
      if (EasyLoading.isShow) {
        EasyLoading.dismiss();
      }
      Get.snackbar(
        "خطأ",
        "حدث خطأ ما",
        icon: const Icon(Icons.person, color: Colors.red),
        backgroundColor: Colors.yellow,
        snackPosition: SnackPosition.BOTTOM,);

    }

  }
}
