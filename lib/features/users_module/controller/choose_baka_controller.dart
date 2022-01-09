import 'package:advertisers/main.dart';
import 'package:advertisers/shared/network/models/SubscriptionBaka.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
class ChooseBakaController extends GetxController{

  RxList<SubscriptionBaka> subscriptionBaka = <SubscriptionBaka>[].obs;

  @override
  void onInit() {

    client!.getSubscription().then((value){
      if(value.data!=null){
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
}