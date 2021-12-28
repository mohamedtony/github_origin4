


import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class RegisterNewCompanyUserController extends GetxController{
  GlobalKey<FormState> registerNewCompanyUserControllerKeyForm1=GlobalKey<FormState>(debugLabel: 'registerNewCompanyUserControllerKeyForm');

  late TextEditingController phoneController;
  late TextEditingController companyNameController;
  late TextEditingController accountNameController;
  late TextEditingController accountAdminNameController;
  late TextEditingController emailController;
  late TextEditingController recordIDController;
  late TextEditingController passwordController;



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

    phoneController=TextEditingController();
    companyNameController=TextEditingController();
    accountNameController=TextEditingController();
    emailController=TextEditingController();
    accountAdminNameController=TextEditingController();
    passwordController=TextEditingController();
    recordIDController=TextEditingController();



    super.onInit();
  }
  String? validatePhone(String phone){
    if (phone.length<8){
      return 'رقم الهاتف لا يقل 8 رقم';
    }
    return null;
  }


  void checkLogin(){
    final isValid=registerNewCompanyUserControllerKeyForm1.currentState!.validate();
    if(!isValid){
      return;
    }
    registerNewCompanyUserControllerKeyForm1.currentState!.save();
    // loginClient();
    Get.toNamed('/verificationCodePage');
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

    phoneController.dispose();

    super.onClose();
  }
}