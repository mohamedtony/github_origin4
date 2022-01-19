import 'package:advertisers/app_core/network/models/BlockedUserModel.dart';
import 'package:advertisers/features/request_advertise_module/view/widgets/advertising_channels_sheet.dart';
import 'package:advertisers/features/request_advertise_module/view/widgets/attatchements_sheet.dart';
import 'package:advertisers/features/request_advertise_module/view/widgets/urls_bottom_sheet.dart';
import 'package:advertisers/main.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
class BlockedUsersController extends GetxController {

  var isLoading = true.obs;
  var isEmpty = false.obs;
  RxList<BlockedUserModel> blockedUsers = <BlockedUserModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    client!.getBlockedUsers("Bearer  40|UrWNjwnaUs6pK4RjcNztJpB6kK97LlnbKzCEeTpd").then((value){
      if(value.status==200 && value.data!=null && value.data!.isNotEmpty){
        isLoading.value = false;
        isEmpty.value = false;
        blockedUsers.value = value.data!;
      }else{
        isLoading.value = false;
        isEmpty.value = true;
      }
    });

    super.onInit();
  }

  void removeBlockedUser(int id){
    client!.addRemoveBlackList(id,"Bearer  40|UrWNjwnaUs6pK4RjcNztJpB6kK97LlnbKzCEeTpd").then((value){
      if(value.status==200 && value.data!=null){
        blockedUsers.value.removeWhere((element) => element.id==id);
        if(blockedUsers.value.isEmpty){
          isEmpty.value = true;
        }
      }/*else{
        isLoading.value = false;
        isEmpty.value = true;
      }*/
    });
  }
}