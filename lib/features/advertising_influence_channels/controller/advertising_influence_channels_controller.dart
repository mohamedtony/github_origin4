import 'package:advertisers/app_core/network/models/ChannelData.dart';
import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/responses/ChannelStatusResponse.dart';
import 'package:advertisers/app_core/network/responses/ChannelsResponse.dart';
import 'package:advertisers/app_core/network/responses/TypeOfChannelResponse.dart';
import 'package:advertisers/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';


class AdvertisingInfluenceChannelsController extends GetxController{
  late Repository repo ;
  var  advertisingChannels2=ChannelData().obs;
  //var icon=Padding(padding: EdgeInsets.all(0),).obs;
 var currentIndex2=0.obs;
  var channels=<ChannelData>[].obs;
  var status=0.obs;
  var type=''.obs;
  var basicChannels=[].obs;
  //var checkList = [].obs;
  var channelId=0.obs;
 // var toggleId=0.obs;
 //  void addRemoveCheckList(id){
 //    if(checkList!.contains(id)){
 //      checkList!.remove(id);
 //    }else{
 //      checkList!.add(id);
 //    }
 //   // update();
 //  }


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
  channelToggleStatusView({required int viewId,required int index}){

    EasyLoading.show();


    repo.get<ChannelStatusResponse>(
        path: 'profile/channels/$viewId/status',
        fromJson: (json) => ChannelStatusResponse.fromJson(json),
        json: {"token":"Bearer  $token"},
        onSuccess: (res) {
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }

          channels[index].status=res.data?.status??0;
update();
         print('>>>>>>>>>>> $index ${channels[index].status}');

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


    repo.get<TypeOfChannelResponse>(
        path: 'profile/channels/$toggleId/type',
        fromJson: (json) => TypeOfChannelResponse.fromJson(json),
        json: {"token":"Bearer  $token"},
        onSuccess: (res) {
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }
          type.value=res.data?.type??'ads';
          update();
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
  deleteChannel({required int channelId}){

    EasyLoading.show();


    repo.get<ChannelsResponse>(
        path: 'profile/channels/$channelId/delete',
        fromJson: (json) => ChannelsResponse.fromJson(json),
        json: {"token":"Bearer  $token"},
        onSuccess: (res) {
          channels.removeWhere((element) =>channelId==element.id);
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
    // icon.value=advertisingChannels2.value.status==1 ? Padding(
    //   padding: const EdgeInsets.all(5.0),
    //   child: Icon(Icons.remove_red_eye_outlined,color: Color(0xff5aa1d0),),
    // ):Padding(
    //     padding: const EdgeInsets.all(5.0),
    //     child: Image.asset("images/icon_eye_off.png",height: 25,width:25,//Icon(Icons.remove_red_eye,color: Color(0xff5aa1d0),
    //     ));
    super.onInit();
  }






  @override
  void onClose() {

    super.onClose();
  }
}


