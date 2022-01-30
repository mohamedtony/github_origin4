import 'package:advertisers/app_core/network/models/ChannelData.dart';
import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/responses/ChannelsResponse.dart';
import 'package:advertisers/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';


class AdvertisingInfluenceChannelsController extends GetxController{
  late Repository repo ;
  var channels=[].obs;
  var checkList = [].obs;
 // var toggleId=0.obs;
  void addRemoveCheckList(id){
    if(checkList!.contains(id)){
      checkList!.remove(id);
    }else{
      checkList!.add(id);
    }
   // update();
  }


  bool isChecked = false;
  void changeChecked(){
    if(isChecked == false){
      isChecked = true;
    }else{
      isChecked = false;
    }
   // update();
  }



  List<bool>? checkListSee = [];
  void addRemoveCheckListSee(index){
    if(checkListSee![index] == true){
      checkListSee![index] = false;
    }else{
      checkListSee![index] = true;
    }
    update();
  }

  getChannels(){

      EasyLoading.show();


      repo.get<ChannelsResponse>(
          path: 'profile/channels',
          fromJson: (json) => ChannelsResponse.fromJson(json),
          json: {"token":"Bearer  $token"},
          onSuccess: (res) {
            if (EasyLoading.isShow) {
              EasyLoading.dismiss();
            }
            channels.value=res.data!;
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

  }
  channelToggleStatusView({required int viewId}){

    EasyLoading.show();


    repo.get<ChannelsResponse>(
        path: 'profile/channels/$viewId/status',
        fromJson: (json) => ChannelsResponse.fromJson(json),
        json: {"token":"Bearer  $token"},
        onSuccess: (res) {
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }
          channels.value=res.data!;
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

  }
  channelToggleType({required int toggleId}){

    EasyLoading.show();


    repo.get<ChannelsResponse>(
        path: 'profile/channels/$toggleId/type',
        fromJson: (json) => ChannelsResponse.fromJson(json),
        json: {"token":"Bearer  $token"},
        onSuccess: (res) {
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }
          channels.value=res.data!;
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

  }
  deleteChannel(){

    EasyLoading.show();

   int id=4;
    repo.get<ChannelsResponse>(
        path: 'profile/channels/$id/delete',
        fromJson: (json) => ChannelsResponse.fromJson(json),
        json: {"token":"Bearer  $token"},
        onSuccess: (res) {
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }
          Get.snackbar(
            "نجاح",
            res.message.toString(),
            icon: const Icon(Icons.person, color: Colors.red),
            backgroundColor: Colors.yellow,
            snackPosition: SnackPosition.BOTTOM,);
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

  }
  // bool isCheckedSee = false;
  // void changeCheckedSee(){
  //   if(isCheckedSee == false){
  //     isCheckedSee = true;
  //   }else{
  //     isCheckedSee = false;
  //   }
  //   update();
  // }

 late String token;
  @override
  void onInit() {
    // passIndex;
    token =storage.read("token");
    repo = Repository();
    getChannels();
    super.onInit();
  }






  @override
  void onClose() {

    super.onClose();
  }
}


