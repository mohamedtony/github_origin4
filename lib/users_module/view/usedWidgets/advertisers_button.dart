import 'package:advertisers/users_module/app_colors.dart';
import 'package:advertisers/users_module/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class AdvertisersButton extends StatelessWidget {

  late final String text;
  late final Color? backgroundColor,textColor;
  late final Callback onPressed;
  late final double? width;
  AdvertisersButton({this.width,this.textColor,this.backgroundColor,required this.text,required this.onPressed,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 45.h,
      width:width ==null?237.w:width,
      alignment: Alignment.center,
      decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: backgroundColor==null?AppColors.blueAccentColor:backgroundColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.buttonGreyShadowColor.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 6,
              offset:const Offset(0, 3),
            )
          ]
        //gradient: LinearGradient(begin:Alignment.topCenter ,end:Alignment.bottomCenter , colors:const [AppColors.firstBrownColor,AppColors.secondBrownColor])
      ),

      child: TextButton(onPressed:onPressed, child: Text( text,style: TextStyle(fontSize: 15.sp,fontFamily: 'Arabic-Regular'),),style: ButtonStyle(
          foregroundColor:MaterialStateProperty.all(textColor==null?AppColors.whiteColor:AppColors.verifyTextColor),
          shape:MaterialStateProperty.all(const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10),
          ))) ),),
    );
  }
}
