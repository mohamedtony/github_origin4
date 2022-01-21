import 'package:advertisers/app_core/network/models/ChannelData.dart';
import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/responses/ChannelsResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';


class AdvertisingInfluenceChannelsController extends GetxController{
var channels=[].obs;
  var checkList = [].obs;
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
      Repository repo = Repository();

      repo.get<ChannelsResponse>(
          path: 'profile/channels',
          fromJson: (json) => ChannelsResponse.fromJson(json),
          json: {"token":"Bearer  40|UrWNjwnaUs6pK4RjcNztJpB6kK97LlnbKzCEeTpd"},
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
  // bool isCheckedSee = false;
  // void changeCheckedSee(){
  //   if(isCheckedSee == false){
  //     isCheckedSee = true;
  //   }else{
  //     isCheckedSee = false;
  //   }
  //   update();
  // }


  @override
  void onInit() {
    // passIndex;
    getChannels();
    super.onInit();
  }






  @override
  void onClose() {

    super.onClose();
  }
}


