import 'package:advertisers/features/users_module/controller/register_phone_controller.dart';
import 'package:advertisers/features/users_module/view/usedWidgets/advertisers_button.dart';
import 'package:advertisers/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../app_colors.dart';

class VerificationCodePage extends StatelessWidget {
  VerificationCodePage({Key? key}) : super(key: key);
  late String smsOTP;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.verifyFayrouzyFirst.withOpacity(.99),
      body: SafeArea(
        child: Container(
          height: 812.0.h,
          width: 375.0.w,
          decoration: BoxDecoration(
            color: AppColors.verifyFayrouzyFirst,
            gradient: LinearGradient(
                colors: [
                  AppColors.verifyFayrouzyFirst.withOpacity(.99),
                  AppColors.verifyBlueSecond.withOpacity(.99),
                  AppColors.verifyGreenThird
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [-.7, 20.5, .5]),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(end: 32.8.w),
                      child: Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: SvgPicture.asset('images/arrow_back.svg',
                            height: 47.h, fit: BoxFit.fitHeight),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.all(16.0.w),
                    child: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text('verifyPhone'.tr+' '+Get.parameters['phone'].toString(),
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'elmessiri-regular')),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 13.0.w),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.all(16.0.w),
                      child: Align(
                        alignment: AlignmentDirectional.center,
                        child: Text('pleaseEnterCode'.tr+' '+Get.parameters['phone'].toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Arabic-Regular')),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.all(16.0.w),
                    child: Align(
                      alignment: AlignmentDirectional.center,
                      child: Text('changePhone'.tr,
                          style: TextStyle(
                              fontSize: 17.sp,
                              color: AppColors.changePhoneTextColor,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.86.w),
                  child: PinCodeTextField(
                    length: 6,
                    obscureText: true,
                    animationType: AnimationType.none,
                    obscuringCharacter: '#',
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.circle,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 47.28.h,
                      fieldWidth: 47.28.w,
                      inactiveFillColor: AppColors.verifyBackgroundPin,
                      // fieldOuterPadding: EdgeInsets.symmetric(horizontal: 20.w),
                      activeFillColor: AppColors.verifyBackgroundPin,
                    ),
                    animationDuration: Duration(milliseconds: 300),
                    backgroundColor: AppColors.transparentColor,
                    enableActiveFill: true,
                    // errorAnimationController: errorController,
                    // controller: textEditingController,
                    onCompleted: (v) {
                      print("Completed");
                    },
                    onChanged: (value) {
                      Get.find<RegisterPhoneController>().smsOTP.value = value;
                      print(value);
                      // setState(() {
                      //   currentText = value;
                      // });
                    },
                    beforeTextPaste: (text) {
                      print("Allowing to paste $text");
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                    appContext: context,
                  ),
                ),
                SizedBox(
                  height: 25.29.h,
                ),
                AdvertisersButton(
                    text: 'verify'.tr,
                    onPressed: () {
                      if (auth.currentUser != null&&Get
                          .parameters['phone'].toString()=='registerPhone') {

                        Get.toNamed('/registerAccountType?phone=${Get
                            .parameters['phone'].toString()}');

                      }else if(auth.currentUser != null&&Get
                          .parameters['phone'].toString()=='forgetPasswordForPhone'){

                        Get.toNamed('/forgetPasswordForPhone?phone=${Get
                            .parameters['phone'].toString()}');

                      } else {
                        Get.find<RegisterPhoneController>().signIn();
                      }
                    },
                    backgroundColor: AppColors.verifyButtonColor,
                    textColor: AppColors.verifyTextColor),
                SizedBox(
                  height: 44.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AdvertisersButton(
                      text: 'codeNotSend'.tr,
                      onPressed: () {},
                      backgroundColor: AppColors.verifyButtonColor,
                      textColor: AppColors.verifyTextColor,
                      width: 279.w),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
