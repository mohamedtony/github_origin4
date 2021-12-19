


import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class LoginController extends GetxController{
  GlobalKey<FormState> loginClientFormKey=GlobalKey<FormState>();
  late TextEditingController passwordController;
  late TextEditingController phoneController;
  late TextEditingController latitudeController;
  late TextEditingController longitudeController;

  var countryCode='sa'.obs;
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
    latitudeController=TextEditingController();
    longitudeController=TextEditingController();


    super.onInit();
  }
  String? validatePhone(String phone){
    if (phone.length<11||phone.length>11){
      return 'رقم الهاتف لا يقل ولا يزيد عن 11 رقم';
    }
    return null;
  }
  String? validatePassword(String password){
    if (password.length<8||password.length>8){
      return 'الباسورد لا يقل ولا يزيد عن 8 حروف او ارقام';
    }
    return null;
  }


  void checkLogin(){
    final isValid=loginClientFormKey.currentState!.validate();
    if(!isValid){
      return;
    }
    loginClientFormKey.currentState!.save();
   // loginClient();
  }
  // void loginClient(){
  //   repo.post<LoginSalonResponse>(path: '/loginClient',fromJson:(json) => LoginSalonResponse.fromJson(json),
  //       json:LoginSalonRequest(phone: phoneController.text,password: passwordController.text),onSuccess:(res) {
  //         account.model=AccountModel.fromJson(res.account!.toJson());
  //         Get.toNamed("/homeClientPage");
  //       },onError: (err){
  //
  //       }
  //   );
  //
  // }
  @override
  void onClose() {
    passwordController.dispose();
    phoneController.dispose();
    latitudeController.dispose();
    longitudeController.dispose();
    super.onClose();
  }
}