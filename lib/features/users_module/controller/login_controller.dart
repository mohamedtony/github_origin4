


import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/requests/login_client_request.dart';
import 'package:advertisers/app_core/network/responses/LoginClientResponse.dart';
import 'package:advertisers/app_core/network/responses/LoginClientResponse2.dart';
import 'package:advertisers/app_core/network/responses/RegisterClientUserResponse.dart';
import 'package:advertisers/features/users_module/app_colors.dart';
import 'package:advertisers/main.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:phone_number/phone_number.dart';


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

   //========= validate phone with country code =============
   var regionCode = 'SA'.obs;
   var isValidPhone = false.obs;
   var   e164 =''.obs;

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
      return 'كلمة المرور لا تقل عن 8 حروف او ارقام';
    }else if(passwordMess.isNotEmpty){
      return passwordMess.value;
    }
    return null;
  }


  void checkLogin(BuildContext context){
     isValid.value=loginClientFormKey1.currentState!.validate();
    if (!isValid.value||errorRegister.value==true) {
      return;
    }
    loginClientFormKey1.currentState!.save();
    loginClient(context);

  }
   Future<void> checkValidPhoneWithCountry() async {
     try {
       final parsed = await PhoneNumberUtil().parse(phoneController.text, regionCode: regionCode.value);
       e164.value = parsed.e164;
       isValidPhone.value = true;
     } catch (e) {
       isValidPhone.value = false;
     }
   }
  Future<void> loginClient(BuildContext context) async {
    await checkValidPhoneWithCountry();
    if (!isValidPhone.value) {
      showMyToast("رقم الجوال وكود الدولة غير متطابقين !",true,context);
      return;
    }
    EasyLoading.show();
    Repository repo=Repository();
    repo.postWithImageMultipart<LoginClientResponse2>(path: 'auth/login',fromJson:(json) => LoginClientResponse2.fromJson(json),
        json:{"phone": countryCode.value.replaceFirst('+','',0)+int.parse(phoneController.text??'0').toString(),"password": passwordController.text
          ,"fcm_token": token,},onSuccess:(res) {
      print('mToken'+res.data!.token!);
      storage.write("token", res.data!.token);
      storage.write("data",res.data!.toJson());
      storage.write("id", res.data!.id);
      if(res.data!.owners!=null&&res.data!.owners!.isNotEmpty){
        storage.write("ownerid", res.data!.owners![0].userId);
        storage.write("accountype", res.data!.role);
        print("controller.ownerId ${res.data!.owners![0].userId} = ${storage.read("ownerid")}");
      }

      if(EasyLoading.isShow){
        EasyLoading.dismiss();
      }

     //account.model=AccountModel.fromJson(res.account!.toJson());
         Get.offAllNamed('/Home');
        },onError: (err,res){
          errorRegister.value=true;
          isValid.value=false;

          phoneMess.value=res.data!.phone??'';
         // passwordMess.value=res.data!.password??'';


          checkLogin(context);
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

   void showMyToast(String msg,bool error,BuildContext context) {
  /*   Fluttertoast.showToast(
         msg: msg,
         toastLength: Toast.LENGTH_LONG,
         gravity: ToastGravity.BOTTOM,
         timeInSecForIosWeb: 1,
         backgroundColor: error?Colors.red:Colors.grey,
         textColor: Colors.white,
         //fontFamily: 'Arabic-Regular',
         fontSize: 16.0);*/
     FocusManager.instance.primaryFocus?.unfocus();

     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content:  Text(msg,style: TextStyle(color: Colors.white,fontSize: 17,fontFamily: 'Arabic-Regular'),
      ),
      backgroundColor: error?Colors.red:Colors.grey,
    ));
   }
  @override
  void onClose() {
    passwordController.dispose();
    phoneController.dispose();

    super.onClose();
  }
}