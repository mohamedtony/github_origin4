import 'package:advertisers/wallet_module/wallet_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui';
import 'package:advertisers/users_module/controller/login_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'dart:math' as math;


class AppbarIntroWidget extends StatelessWidget {
  AppbarIntroWidget({Key? key}) : super(key: key);
  final WalletController _walletController=Get.put(WalletController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.only(
          top: MediaQuery.of(context).padding.top
      ),
      child:   Padding(
        padding: const EdgeInsets.only(
            top: 20.0,
            bottom: 10.0
        ),
        child:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){

                },
                child: SvgPicture.asset(
                  "images/back_button.svg",
                  height: 38,
                  matchTextDirection: true,
                ),
              ),
              SizedBox(
                width: 25,
              ),

              SizedBox(
                width: 25,
              ),

              InkWell(
                onTap: (){

                },
                // Get.locale?.languageCode == const Locale('en').languageCode
                child:  Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(
                      Get.locale?.languageCode == const Locale('en').languageCode  ? 0 : math.pi),
                  child: Image.asset(
                    "images/Nav.png",
                    // height: ,
                    // color: AppStyle.blueTextButton,
                  ),
                ),
                  // Transform(
                  //     alignment: Alignment.center,
                  //     transform: Matrix4.rotationY(
                  //         prefs.appLanguage == 'en' ? 0 : math.pi),
                  //     child: prefixIcon),
              ),

            ],
          ),
        ),
      ),
      decoration:  BoxDecoration(
          gradient:  const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff6fd3de),
                Color(0xff486ac7),
              ]
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[500]!,
              blurRadius: 20.0,
              spreadRadius: 1.0,
            )
          ]
      ),
    );
  }
}
