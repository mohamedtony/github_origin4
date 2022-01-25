


import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/requests/login_client_request.dart';
import 'package:advertisers/app_core/network/responses/LoginClientResponse.dart';
import 'package:advertisers/app_core/network/responses/RegisterClientUserResponse.dart';
import 'package:advertisers/main.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';


class LoginController extends GetxController{
   GlobalKey<FormState> loginClientFormKey1=GlobalKey<FormState>(debugLabel:'loginClientFormKey1' );
  late TextEditingController passwordController;
  late TextEditingController phoneController;

   var isValid=false.obs;
   var errorRegister=false.obs;
  var countryCode='+966'.obs;
  var latitude=0.0.obs;
  var longitude=0.0.obs;
  var password='';
  var phone='';
  // var latitudeController=''.obs;
  // var longitudeController=''.obs;
  var logoPath=''.obs;
  var imageBase641=''.obs;
  ////////////////////
   var phoneMess = ''.obs;
   var passwordMess = ''.obs;
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
    }else if(phoneMess.isNotEmpty){
      return phoneMess.value;
    }
    return null;
  }
  String? validatePassword(String password){
    if (password.length<8){
      return 'الباسورد لا يقل عن 8 حروف او ارقام';
    }else if(passwordMess.isNotEmpty){
      return passwordMess.value;
    }
    return null;
  }


  void checkLogin(){
     isValid.value=loginClientFormKey1.currentState!.validate();
    if (!isValid.value||errorRegister.value==true) {
      return;
    }
    loginClientFormKey1.currentState!.save();
    loginClient();

  }
  void loginClient(){
    EasyLoading.show();
    Repository repo=Repository();
    repo.postWithImageMultipart<LoginClientResponse>(path: 'auth/login',fromJson:(json) => LoginClientResponse.fromJson(json),
        json:{"phone": countryCode.value.replaceFirst('+','',0)+int.parse(phoneController.text??'0').toString(),"password": passwordController.text
          ,"fcm_token": token,},onSuccess:(res) {
      storage.write("data",res.data!.toJson());
      if(EasyLoading.isShow){
        EasyLoading.dismiss();
      }

     //account.model=AccountModel.fromJson(res.account!.toJson());
          Get.toNamed("/Home");
        },onError: (err,res){
          errorRegister.value=true;
          isValid.value=false;

          phoneMess.value=res.data!.phone??'';
          passwordMess.value=res.data!.password??'';


          checkLogin();
          if(EasyLoading.isShow){
            EasyLoading.dismiss();
          }
          Get.snackbar(
            "خطأ",
            err.toString(),
            icon: const Icon(Icons.person, color: Colors.red),
            backgroundColor: Colors.yellow,
            snackPosition: SnackPosition.BOTTOM,);
        });

  }
  @override
  void onClose() {
    passwordController.dispose();
    phoneController.dispose();

    super.onClose();
  }
}