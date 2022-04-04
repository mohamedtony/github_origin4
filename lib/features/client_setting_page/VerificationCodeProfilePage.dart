import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/responses/CheckPhoneResponse.dart';
import 'package:advertisers/features/client_setting_page/client_setting_page_controller.dart';
import 'package:advertisers/features/users_module/app_colors.dart';
import 'package:advertisers/features/users_module/view/usedWidgets/advertisers_button.dart';
import 'package:advertisers/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationCodeProfilePage extends StatelessWidget {
  //VerificationCodeProfilePage({Key? key}) : super(key: key);
  late String smsOTP;
  ClientSettingPageController controller = Get.find();

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
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
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
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: Padding(
                    padding: EdgeInsets.all(16.0.w),
                    child: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text('verifyPhone'.tr + ' ' +
                          Get.parameters['phone'].toString(),
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
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: Padding(
                      padding: EdgeInsets.all(16.0.w),
                      child: Align(
                        alignment: AlignmentDirectional.center,
                        child: Text('pleaseEnterCode'.tr + ' ' + Get
                            .parameters['phone'].toString(),
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
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
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
                    obscureText: false,
                    controller: controller.pinCodeController,
                    animationType: AnimationType.none,

                    // obscuringCharacter: '#',
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
                    onSubmitted: (v) {
                      print("vv= " + v);
                    },
                    onChanged: (value) {
                      /* if(Get.parameters['route'].toString()=='registerPhone'){
                        Get.find<ClientSettingPageController>().smsOTP.value = value;
                      }
                      else if(Get.parameters['route'].toString()=='forgetPasswordForPhone'){
                        Get.find<ForgetPasswordForPhoneController>().smsOTP.value = value;}
                      ///this is sended to database
                      Get.find<RegisterPhoneController>().publicSmsOtp.value=value;*/
                      Get
                          .find<ClientSettingPageController>()
                          .smsOTP
                          .value = value;
                      Get
                          .find<ClientSettingPageController>()
                          .publicSmsOtp
                          .value = value;
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
                      saveCode(context);
                      //      print(Get
                      //          .parameters['route'].toString()  );
                      //      print(auth.currentUser);
                      // ///
                      //      if (Get
                      //          .parameters['route'].toString()=='registerPhone') {
                      //
                      //        Get.toNamed('/registerAccountType?phone=${Get
                      //            .parameters['phone'].toString()}');
                      //
                      //      }else if(Get
                      //          .parameters['route'].toString()=='forgetPasswordForPhone'){
                      //
                      //        Get.toNamed('/newPasswordPage?phone=${Get
                      //            .parameters['phone'].toString()}');
                      //
                      //      }
                      //      ///
                      //
                      //      // if (auth.currentUser != null&&Get
                      //      //     .parameters['route'].toString()=='registerPhone') {
                      //      //
                      //      //   Get.toNamed('/registerAccountType?phone=${Get
                      //      //       .parameters['phone'].toString()}');
                      //      //
                      //      // }else if(auth.currentUser != null&&Get
                      //      //     .parameters['route'].toString()=='forgetPasswordForPhone'){
                      //      //
                      //      //   Get.toNamed('/newPasswordPage?phone=${Get
                      //      //       .parameters['phone'].toString()}');
                      //      //
                      //      // }
                      //      // else if(auth.currentUser == null&&Get
                      //      //     .parameters['route'].toString()=='registerPhone'){
                      //      //   Get.find<RegisterPhoneController>().signIn();
                      //      // }else if(auth.currentUser == null&&Get
                      //      //     .parameters['route'].toString()=='forgetPasswordForPhone'){
                      //      //   Get.find<ForgetPasswordForPhoneController>().signIn();
                      //      // }
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
                      onPressed: () async {
                        await verifyPhone();
                      },
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

  String verificationId = '';

  Future<void> verifyPhone() async {
    EasyLoading.show(status: 'انتظر');
    final PhoneCodeSent smsOTPSent = (String verId, [int? forceCodeResend]) {
      if (EasyLoading.isShow) {
        EasyLoading.dismiss();
      }
      verificationId = verId;
      // Get.toNamed(
      //     '/verificationCodePage?route=forgetPasswordForPhone&phone=${countryCode.value.toString() + int.parse(phone).toString()}');
      // smsOTPDialog(context).then((value) {
      //   print('sign in');
      // });
    };
    try {
      // print(
      //     '>>>>>>>>>>>>>>>>>>>>${countryCode.value.toString() + int.parse(phone).toString()}');
      await auth.verifyPhoneNumber(
          phoneNumber: Get
              .parameters['phone'].toString(),
          // PHONE NUMBER TO SEND OTP
          codeAutoRetrievalTimeout: (String verId) {
            //Starts the phone number verification process for the given phone number.
            //Either sends an SMS with a 6 digit code to the phone number specified, or sign's the user in and [verificationCompleted] is called.
            verificationId = verId;
          },
          codeSent:
          smsOTPSent,
          // WHEN CODE SENT THEN WE OPEN DIALOG TO ENTER OTP.
          timeout: const Duration(seconds: 60),
          verificationCompleted: (AuthCredential phoneAuthCredential) {
            print(phoneAuthCredential);
          },
          verificationFailed: (exception) {
            Get.snackbar(
              "حدث خطأ",
              exception.message.toString(),
              icon: const Icon(Icons.person, color: AppColors.whiteColor),
              backgroundColor: Colors.red,
              snackPosition: SnackPosition.BOTTOM,
            );
          });
    } on Exception catch (_, e) {
      if (EasyLoading.isShow) {
        EasyLoading.dismiss();
      }
      Get.snackbar(
        "حدث خطأ",
        e.toString(),
        icon: const Icon(Icons.person, color: AppColors.whiteColor),
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> saveCode(BuildContext context) async {
    // Create a PhoneAuthCredential with the code
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: Get.parameters['verificationId'].toString(),
          smsCode: controller.pinCodeController!.text);
      await auth.signInWithCredential(credential).then((value) {
        print("bbbbbb");
        controller.showMyToast("تم التحقق من رقم الجوال بنجاح! ", false, context);
        controller.isPhoneVerified.value = true;
        Get.back();
        //controller.pinCodeController!.text = authCredential.smsCode!;
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else if (e.code == "invalid-verification-code") {
        controller.showMyToast(
            "من فضلك ادخل كود التحقق المرسل إلى الجوال !", true, context);
      }
      print("mError" + e.code);
    }
  }
}
