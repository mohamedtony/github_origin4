import 'package:advertisers/app_core/network/models/SubscriptionBaka.dart';
import 'package:advertisers/main.dart';
//import 'package:advertisers/shared/network/models/SubscriptionBaka.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ChooseBakaController extends GetxController{

  RxList<SubscriptionBaka> subscriptionBaka = <SubscriptionBaka>[].obs;
  var indexClicked=-1;
  var selectedBakaId = -1;

  @override
  void onInit() {

/*    client!.login(MLoginRequest(phone: "966524281063",password: "12345678",fcm_token: "kkkkkkkk")).then((value){
      print("mUserName"+value.message!);
      if(value.data!=null&&value.status==200){
        print("mUserName"+ value.data!.username!.toString());
      }
    });*/

/*    client!.login(LoginClientRequest(phone: "966524281063",password: "12345678"*//*,fcm_token: "kkkkkkkk"*//*)).then((value){
      print("mUserName"+value.message!);
      if(value.data!=null&&value.status==200){
        Logger().i(value.data?.toJson());
      }
    });*/

    client!.getSubscription().then((value){
      if(value.data!=null&&value.status==200){
        subscriptionBaka.value = value.data!;
        print(value.data![0].name);
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeIndex(int index,int bakaId) {
    print("inIndex"+indexClicked.toString());
    if(indexClicked==index){
      indexClicked=-1;
      selectedBakaId = -1;
      update();
      return;
    }

    indexClicked=index;
    selectedBakaId = bakaId;
    update();
  }

  void changeBakaID(int id) {
    selectedBakaId = id;
  }

}