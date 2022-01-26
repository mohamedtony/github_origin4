import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:advertisers/features/users_module/controller/baka_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class LoadingDownloadingDailog {
  final BakaDetailsController _chooseBakaController = Get.find();
  void showLoading(context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            height: 100.0,
            child: new Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              textDirection: TextDirection.rtl,
              children: [
                SpinKitThreeBounce(color: Colors.blue, size: 25,),
                Obx(()=> Text(" جارى التحميل "+_chooseBakaController.progress.value ,style: TextStyle(color: AppColors.advertiseNameColor,fontSize: 24.0,fontFamily: 'Arabic-Regular',fontWeight: FontWeight.w400),)
              ),
              ],
            ),
          ),
        );
      },
    );
  }
}
