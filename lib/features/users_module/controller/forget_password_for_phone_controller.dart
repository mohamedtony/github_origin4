


import 'package:advertisers/features/users_module/app_colors.dart';
import 'package:dio/dio.dart' as dio;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../main.dart';


class ForgetPasswordForPhoneController extends GetxController{
  GlobalKey<FormState> forgetPasswordForPhoneFormKey=GlobalKey<FormState>(debugLabel: 'forgetPasswordForPhoneFormKey');
  late TextEditingController passwordController;
  late TextEditingController phoneController;

  var smsOTP = ''.obs;
  var verificationId = '';
  var errorMessage = '';
  var countryCode='sa'.obs;
  var latitude=0.0.obs;
  var longitude=0.0.obs;
  var password='';
  var phone='';
  var logoPath=''.obs;
  var imageBase641=''.obs;
  //Repository repo=Repository();
  @override
  void onInit() {
    //repo.postWithImageMultipart({})
    passwordController=TextEditingController();
    phoneController=TextEditingController();



    super.onInit();
  }
  String? validatePhone(String phone){
    if (phone.length<8){
      return 'رقم الهاتف لا يقل 8 رقم';
    }
    return null;
  }


  void checkLogin() async {
    final isValid = forgetPasswordForPhoneFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    forgetPasswordForPhoneFormKey.currentState!.save();
    print(
        '>>>>>>>>>>>>>>>>>>>>${countryCode.value.toString() + int.parse(phone).toString()}');
    await verifyPhone();
    // Get.toNamed(
    //     '/verificationCodePage?phone=${countryCode.value.toString() + int.parse(phone).toString()}');
    // loginClient();
    // Get.toNamed('/verificationCodePage');
  }

  Future<void> verifyPhone() async {
    EasyLoading.show(status:'انتظر');
    final PhoneCodeSent smsOTPSent = (String verId, [int? forceCodeResend]) {
      if(EasyLoading.isShow){
        EasyLoading.dismiss();
      }
      verificationId = verId;
      Get.toNamed(
          '/verificationCodePage?route=forgetPasswordForPhone&phone=${countryCode.value.toString() + int.parse(phone).toString()}');
      // smsOTPDialog(context).then((value) {
      //   print('sign in');
      // });
    };
    try {
      print(
          '>>>>>>>>>>>>>>>>>>>>${countryCode.value.toString() + int.parse(phone).toString()}');
      await auth.verifyPhoneNumber(
          phoneNumber: countryCode.value.toString() +
              int.parse(phoneController.text)
                  .toString(), // PHONE NUMBER TO SEND OTP
          codeAutoRetrievalTimeout: (String verId) {
            //Starts the phone number verification process for the given phone number.
            //Either sends an SMS with a 6 digit code to the phone number specified, or sign's the user in and [verificationCompleted] is called.
            verificationId = verId;
          },
          codeSent:
          smsOTPSent, // WHEN CODE SENT THEN WE OPEN DIALOG TO ENTER OTP.
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
      if(EasyLoading.isShow){
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

  signIn() async {
    EasyLoading.show(status:'انتظر');
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsOTP.value,
      );
      final UserCredential user = await auth.signInWithCredential(credential);
      final User currentUser = await auth.currentUser!;
      if(EasyLoading.isShow){
        EasyLoading.dismiss();
      }
      assert(user.user?.uid == currentUser.uid);
      // Get.toNamed(
      //     '/registerAccountType?phone=${countryCode.value.toString() + int.parse(phone).toString()}');
      Get.toNamed(
          '/forgetPasswordForPhone?phone=${countryCode.value.toString() + int.parse(phone).toString()}');

      // Navigator.of(context).pop();
      // Navigator.of(context).pushReplacementNamed('/homepage');
    } catch (e) {
      if(EasyLoading.isShow){
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

  @override
  void onClose() {

    phoneController.dispose();

    super.onClose();
  }
}