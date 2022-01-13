import 'package:advertisers/app_core/network/models/SubscriptionBaka.dart';
import 'package:advertisers/main.dart';
// import 'package:advertisers/shared/network/models/SubscriptionBaka.dart';
// import 'package:advertisers/shared/network/requests/MLoginRequest.dart';
// import 'package:advertisers/shared/network/requests/login_client_request.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
class ChooseBakaController extends GetxController{

  RxList<SubscriptionBaka> subscriptionBaka = <SubscriptionBaka>[].obs;

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
      if(value.data!=null){
        subscriptionBaka.value = value.data!.cast<SubscriptionBaka>();
        print(value.data![0].name);
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}