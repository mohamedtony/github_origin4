import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class LoadingDailog {
  void showLoading(context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
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
        );
      },
    );
  }
}
