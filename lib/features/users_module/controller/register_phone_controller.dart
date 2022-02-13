import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/responses/CheckPhoneResponse.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:advertisers/main.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:dio/dio.dart' as dio;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:phone_number/phone_number.dart';

class RegisterPhoneController extends GetxController {
  GlobalKey<FormState> registerPhoneFormKey = GlobalKey<FormState>();

  late TextEditingController phoneController;
  var publicSmsOtp=''.obs;
  var countryCode = '+966'.obs;
  var regionCode = 'SA'.obs;
  var isValidPhone = false.obs;
  var   e164 =''.obs;
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  var password = '';
  var phone = '';
  var smsOTP = ''.obs;
  var verificationId = ''.obs;
  var errorMessage = '';
  //Repository repo=Repository();
  @override
  void onInit() {
    //repo.postWithImageMultipart({})

    phoneController = TextEditingController();

    super.onInit();
  }

  String? validatePhone(String phone) {
    if (phone.length < 8) {
      return 'رقم الهاتف لا يقل 8 رقم';
    }
    return null;
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

  void checkLogin(BuildContext context) async {
    final isValid = registerPhoneFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    registerPhoneFormKey.currentState!.save();
    checkPhone(context);

  }
  Future<void> checkPhone(BuildContext context) async {
    await checkValidPhoneWithCountry();
    if (!isValidPhone.value) {
      showMyToast("رقم الجوال وكود الدولة غير متطابقين !",true,context);
      return;
    }
    EasyLoading.show();
    Repository repo = Repository();

    repo.postWithImageMultipart<CheckPhoneResponse>(
        path: 'auth/check_phone',
        fromJson: (json) => CheckPhoneResponse.fromJson(json),
        json: {
          "phone": countryCode.value.toString().substring(1) + int.parse(phone).toString(),


        },
        onSuccess: (res)async {
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }
          //checkPhoneResponse.value = res;
          if(res.data!=null&&res.data?.exists==true&&res.data?.has_code==true&&res.data?.has_account==true){
            Get.back();
            Get.snackbar(
              "موجود",
              "رقم التليفون مسجل لدينا",
              icon: const Icon(Icons.person, color: Colors.red),
              backgroundColor: Colors.yellow,
              snackPosition: SnackPosition.BOTTOM,);

          }else if(res.data!=null&&res.data?.exists==true&&res.data?.has_code==true&&res.data?.has_account==false){
            // await verifyPhone();
            Get.toNamed('/registerAccountType');
          }else{
           // await verifyPhone();
            Get.toNamed(
                '/verificationCodePage?route=registerPhone&phone=${countryCode.value.toString() + int.parse(phone).toString()}');
          }

        },
        onError: (err, res) {

          if (EasyLoading.isShow) {
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

  /*  Fluttertoast.showToast(
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
      content:  Text(msg,style: TextStyle(color: AppColors.white,fontSize: 17,fontFamily: 'Arabic-Regular'),
      ),
      backgroundColor: error?Colors.red:Colors.grey,
    ));
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
  Future<void> verifyPhone() async {
    EasyLoading.show(status:'انتظر');
    final PhoneCodeSent smsOTPSent = (String verId, [int? forceCodeResend]) {
      if(EasyLoading.isShow){
        EasyLoading.dismiss();
      }
      verificationId.value = verId;
      Get.toNamed(
          '/verificationCodePage?verificationId=${verificationId.value}&&route=registerPhone&phone=${countryCode.value.toString() + int.parse(phone).toString()}');
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
            verificationId.value = verId;
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
              icon: const Icon(Icons.person, color: AppColors.white),
              backgroundColor: Colors.red,
              snackPosition: SnackPosition.BOTTOM,
            );

          }).then((value) {

        print('>>>>>>>>>>>>>>${auth.currentUser}');
      });

    } on Exception catch (_, e) {
      if(EasyLoading.isShow){
        EasyLoading.dismiss();
      }
      Get.snackbar(
        "حدث خطأ",
        e.toString(),
        icon: const Icon(Icons.person, color: AppColors.white),
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  signIn() async {
    EasyLoading.show(status:'انتظر');
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId.value,
        smsCode: smsOTP.value,
      );
      final UserCredential user = await auth.signInWithCredential(credential);
      final User currentUser =  auth.currentUser!;
      if (currentUser != null) {
        await currentUser.reload();
      }
      print('>>>>>>>>>>>>>>$currentUser');
      if(EasyLoading.isShow){
        EasyLoading.dismiss();
      }
      assert(user.user?.uid == currentUser.uid);
      Get.toNamed(
          '/registerAccountType?phone=${countryCode.value.toString() + int.parse(phone).toString()}');
      // Navigator.of(context).pop();
      // Navigator.of(context).pushReplacementNamed('/homepage');
    } catch (e) {
      if(EasyLoading.isShow){
        EasyLoading.dismiss();
      }
      Get.snackbar(
        "حدث خطأ",
        e.toString(),
        icon: const Icon(Icons.person, color: AppColors.white),
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
