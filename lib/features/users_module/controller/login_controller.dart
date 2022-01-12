


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


  var countryCode='+966'.obs;
  var latitude=0.0.obs;
  var longitude=0.0.obs;
  var password='';
  var phone='';
  // var latitudeController=''.obs;
  // var longitudeController=''.obs;
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
  String? validatePassword(String password){
    if (password.length<8){
      return 'الباسورد لا يقل عن 8 حروف او ارقام';
    }
    return null;
  }


  void checkLogin(){
    final isValid=loginClientFormKey1.currentState!.validate();
    if(!isValid){
     // Get.toNamed('/home');
      return;
    }
    loginClientFormKey1.currentState!.save();
    loginClient();

  }
  void loginClient(){
    EasyLoading.show();
    Repository repo=Repository();
    repo.post<LoginClientResponse>(path: 'auth/login',fromJson:(json) => LoginClientResponse.fromJson(json),
        json:LoginClientRequest(phone: countryCode.value+phoneController.text,password: passwordController.text),onSuccess:(res) {
      storage.write("data",res.data!.toJson());
      if(EasyLoading.isShow){
        EasyLoading.dismiss();
      }
      //account.model=AccountModel.fromJson(res.account!.toJson());
          Get.toNamed("/Home");
        },onError: (err){
          if(EasyLoading.isShow){
            EasyLoading.dismiss();
          }
          Get.snackbar(
            "خطأ",
            err.toString(),
            icon: const Icon(Icons.person, color: Colors.red),
            backgroundColor: Colors.yellow,
            snackPosition: SnackPosition.BOTTOM,);

        }
    );

  }
  @override
  void onClose() {
    passwordController.dispose();
    phoneController.dispose();

    super.onClose();
  }
}