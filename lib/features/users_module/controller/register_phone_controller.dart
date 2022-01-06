import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:advertisers/main.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:dio/dio.dart' as dio;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPhoneController extends GetxController {
  GlobalKey<FormState> registerPhoneFormKey = GlobalKey<FormState>();

  late TextEditingController phoneController;

  var countryCode = '+966'.obs;
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  var password = '';
  var phone = '';

  var smsOTP = ''.obs;
  var verificationId = '';
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

  void checkLogin() async {
    final isValid = registerPhoneFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    registerPhoneFormKey.currentState!.save();
    print(
        '>>>>>>>>>>>>>>>>>>>>${countryCode.value.toString() + int.parse(phone).toString()}');
   /// await verifyPhone();
    Get.toNamed(
        '/verificationCodePage?phone=${countryCode.value.toString() + int.parse(phone).toString()}');
    // loginClient();
    // Get.toNamed('/verificationCodePage');
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
    final PhoneCodeSent smsOTPSent = (String verId, [int? forceCodeResend]) {
      verificationId = verId;
      Get.toNamed(
          '/verificationCodePage?phone=${countryCode.value.toString() + int.parse(phone).toString()}');
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
              icon: const Icon(Icons.person, color: AppColors.white),
              backgroundColor: Colors.red,
              snackPosition: SnackPosition.BOTTOM,
            );
          });
    } on Exception catch (_, e) {
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
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsOTP.value,
      );
      final UserCredential user = await auth.signInWithCredential(credential);
      final User currentUser = await auth.currentUser!;
      assert(user.user?.uid == currentUser.uid);
      Get.toNamed(
          '/registerAccountType?phone=${countryCode.value.toString() + int.parse(phone).toString()}');
      // Navigator.of(context).pop();
      // Navigator.of(context).pushReplacementNamed('/homepage');
    } catch (e) {
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
