import 'dart:convert';
import 'dart:io';

import 'package:advertisers/app_core/network/models/FromUserModel.dart';
import 'package:advertisers/app_core/network/models/ListChatModel.dart';
import 'package:advertisers/app_core/network/models/MessageChatModel.dart';
import 'package:advertisers/app_core/network/models/ToUserModel.dart';
import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/requests/MessageChatModelRequest.dart';
import 'package:advertisers/app_core/network/responses/ListChatResponse.dart';
import 'package:advertisers/app_core/network/responses/SendMessageResponse.dart';
import 'package:advertisers/app_core/network/responses/StarMessageResponse.dart';
import 'package:advertisers/app_core/network/responses/UploadFileResponse.dart';
import 'package:advertisers/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:dio/dio.dart' as dio;
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
class ChatMessagesController extends GetxController {
  ItemScrollController itemScrollController=ItemScrollController();
  var messagesChat=<ListChatModel>[].obs;
  static dio.MultipartFile? photo;
  var tapped=false.obs;
  var replied=false.obs;
  var chatIndex = 0.obs;
  var repliedIndex=0.obs;
  var typeOfMessage=''.obs;
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
            SchedulerBinding.instance?.addPostFrameCallback((_) {
              itemScrollController?.scrollTo(
                  index: messagesChat.length - 1,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOutCubic);
              // _scrollController.animateTo(_height * index,
              //     duration: const Duration(seconds: 2), curve: Curves.easeIn);
            });

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

 void uploadFile({required dio.MultipartFile file,required String room,required String type,required ItemScrollController itemScrollController,required int indexOfMessage}) async {

   // EasyLoading.show();

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
            messagesChat[indexOfMessage].uploaded=true;
            FromUserModel fromUserModel=FromUserModel.fromJson(jsonDecode(Get.parameters["from_user"]??''));
            ToUserModel toUserModel=ToUserModel.fromJson(jsonDecode(Get.parameters["to_user"]??''));
            //ToUserModel toUserModel=json.decode(Get.parameters["to_user"]??"");
            int? from,to;
            if(fromUserModel.id.toString()==storage.read("id",).toString()){
              from=fromUserModel.id??0;
              to=toUserModel.id??0;
            }else if(toUserModel.id.toString()==storage.read("id",).toString()){
              from=toUserModel.id??0;
              to=fromUserModel.id??0;
            }
            sendMessage(message:MessageChatModelRequest(room: room,message: res.data?.link??' ',type: type,
                from_user_id: from,
                to_user_id: to.toString()),itemScrollController:itemScrollController);

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

  void sendMessage({required MessageChatModelRequest message,ItemScrollController? itemScrollController, int? indexOfMessage}) async {

    //EasyLoading.show();

    try {
      repo.postWithImageMultipart<SendMessageResponse>(
          path: 'send_message',
          fromJson: (json) => SendMessageResponse.fromJson(json),
          json: {"token": "Bearer  $token","message":message.message,"type":message.type,
            "to_user_id":message.to_user_id,"from_user_id":message.from_user_id,"message_id":message.message_id},
          onSuccess: (res) {
            if (EasyLoading.isShow) {
              EasyLoading.dismiss();
            }
            messagesChat[indexOfMessage??0].uploaded=true;
            //if(itemScrollController!=null){
            // SchedulerBinding.instance?.addPostFrameCallback((_) {
            //   itemScrollController?.scrollTo(
            //       index: messagesChat.length - 1,
            //       duration: const Duration(seconds: 1),
            //       curve: Curves.easeInOutCubic);
            //   // _scrollController.animateTo(_height * index,
            //   //     duration: const Duration(seconds: 2), curve: Curves.easeIn);
            // });}

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
            messagesChat[chatIndex.value].starred =
            isStar.value == 1 ? true : false;
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
