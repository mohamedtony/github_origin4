


import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/responses/LoginClientResponse.dart';
import 'package:advertisers/features/users_module/app_colors.dart';
import 'package:dio/dio.dart' as dio;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../main.dart';


class NewPasswordController extends GetxController{
  GlobalKey<FormState> newPasswordFormKey=GlobalKey<FormState>(debugLabel: 'newPasswordFormKey');
  late TextEditingController newPasswordController;
  late TextEditingController reEnterNewPasswordController;
  late TextEditingController phoneController;


  var password='';
  var phone='';
  var reEnterPassword='';

  //Repository repo=Repository();
  @override
  void onInit() {
    //repo.postWithImageMultipart({})
    newPasswordController=TextEditingController();
    reEnterNewPasswordController=TextEditingController();
    phoneController=TextEditingController();



    super.onInit();
  }
  // String? validatePhone(String phone){
  //   if (phone.length<8){
  //     return 'رقم الهاتف لا يقل 8 رقم';
  //   }
  //   return null;
  // }
  String? validateNewPassword(String val){
    if (val.length<8){
      return 'كلمة المرور لا تقل عن 8 حروف او ارقام';
    }
    return null;
  }
  String? validateReEnterNewPassword(String val){
    if (val!=newPasswordController.text){
      return 'كلمتا المرور غير متطابقتان ';
    }
    return null;
  }
  void checkLogin() async {
    final isValid = newPasswordFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    newPasswordFormKey.currentState!.save();
    forgetPassword();
    // print(
    //     '>>>>>>>>>>>>>>>>>>>>${countryCode.value.toString() + int.parse(phone).toString()}');
    // await verifyPhone();
    // Get.toNamed(
    //     '/verificationCodePage?phone=${countryCode.value.toString() + int.parse(phone).toString()}');
    // loginClient();
    // Get.toNamed('/verificationCodePage');
  }
  void forgetPassword(){
    EasyLoading.show();
    Repository repo=Repository();
    repo.postWithImageMultipart<LoginClientResponse>(path: 'auth/change-password',fromJson:(json) => LoginClientResponse.fromJson(json),
        json:{"phone": Get
            .parameters['phone'].toString(),"password": newPasswordController.text
          ,"fcm_token": token,},onSuccess:(res) {

          if(EasyLoading.isShow){
            EasyLoading.dismiss();
          }
          //account.model=AccountModel.fromJson(res.account!.toJson());
          Get.offAllNamed("/loginPage");
        },onError: (err,res){



          if(EasyLoading.isShow){
            EasyLoading.dismiss();
          }
          Get.snackbar(
            "خطأ",
           'رقم الهاتف غير مسجل من قبل',
            icon: const Icon(Icons.person, color: Colors.red),
            backgroundColor: Colors.yellow,
            snackPosition: SnackPosition.BOTTOM,);
        });

  }


  @override
  void onClose() {

    newPasswordController.dispose();

    super.onClose();
  }
}