import 'package:advertisers/app_core/network/models/ClientProfileModel.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:advertisers/main.dart';
import 'package:advertisers/shared/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class AdvertiseListController extends GetxController with GetSingleTickerProviderStateMixin {
  var isOpend = false;
  var position = -1;
  var tabIndex = 0.obs;

  var roleType = ''.obs;
  var clientProfileModel = ClientProfileModel().obs;
  void changeIndex(int position) {
    this.tabIndex.value = position;

  }

  void changeStatus(bool isOpend,int position) {
    this.isOpend = isOpend;
    this.position = position;
    update();
  }

   late TabController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: 3);//Bearer 172|bArU5eQ7MZSTtD4CKY2Wwtvn2onzJlVrG643Vob6

  }
  @override
  void onReady() {
    // TODO: implement onReady
    Get.dialog(
        Dialog(
          child: Container(
            height: 100.0,
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SpinKitThreeBounce(color: Colors.blue, size: 40,),
                new Text("من فضلك انتظر ....!",style: TextStyle(color: AppColors.advertiseNameColor,fontSize: 24.0,fontFamily: 'Arabic-Regular',fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        )
    );
    client!.getMyProfile("Bearer  40|UrWNjwnaUs6pK4RjcNztJpB6kK97LlnbKzCEeTpd").then((value) {
      Logger().i(value.data?.toJson());
      if(value.data!=null&&value.status==200){
        Get.back();
        if(value.data!=null) {
          clientProfileModel.value = value.data!;
        }
      }
    });
    super.onReady();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}