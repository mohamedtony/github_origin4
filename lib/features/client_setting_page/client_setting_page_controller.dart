import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:advertisers/app_core/network/models/Area.dart';
import 'package:advertisers/app_core/network/models/ClientProfileModel.dart';
import 'package:advertisers/app_core/network/models/Country.dart';
import 'package:advertisers/app_core/network/models/RegionCodesModel.dart';
import 'package:advertisers/app_core/network/models/RegionCodesModelList.dart';
import 'package:advertisers/app_core/network/requests/UpdateProfileRequest.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:advertisers/main.dart';
import 'package:advertisers/shared/loading_dialog.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:phone_number/phone_number.dart';
//=========================================================================================

//                         By Mohamed T. Hammad

//=========================================================================================
class ClientSettingPageController extends GetxController  {
  var isOpend = false;
  var position = -1;
  var tabIndex = 1.obs;
  TextEditingController? kayanNameController,accountNameEdit,accountOwner,phoneController,emailController,personalIdController,userNameController,sglNumberController,pinCodeController;
  var flag = false.obs;
  var isEnabled=false.obs;

  var clientProfileModel = ClientProfileModel().obs;
  RxList<Country> countries = <Country>[].obs;
  RxList<Area> areas = <Area>[].obs;
  var country = Country().obs;
  var area = Area().obs;
  var smsOTP = ''.obs;
  var publicSmsOtp = ''.obs;
  var verificationId = ''.obs;
  var countryCode ='SA'.obs;
  var phone = '';
  var email = '';
// switches the value between true/false
 // flag.toggle();
  var isChat = false.obs;
  var isNotification = false.obs;
   late XFile xFile ;
   File? imageFile;
   var imagePath = ''.obs;
  var accountType = ''.obs;
  var isLoadingLocation = true.obs;
  var isValidPhone = false.obs;
  var isPhoneVerified = false.obs;
  var   e164 =''.obs;
  String? myToken;
  @override
  Future<void> onInit() async {
   // EasyLoading.show(status: 'انتظر');
    // TODO: implement onInit
    userNameController = TextEditingController();
    kayanNameController = TextEditingController();
    accountNameEdit= TextEditingController();
    accountOwner= TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    sglNumberController= TextEditingController();
    pinCodeController = TextEditingController();
    personalIdController  = TextEditingController();
    if((Get.parameters['from'].toString())=="advertiserPage") {
      isEnabled.value=true;
    }
    myToken  = await storage.read("token");
    super.onInit();
  }

  void changeIndex(int position) {
    this.tabIndex.value = position;

  }
  Future<void> initPlatformState() async {
    try {
        final parsed = await PhoneNumberUtil().parse(phoneController!.text, regionCode: countryCode.value);
        e164.value = parsed.e164;
        isValidPhone.value = true;
    } catch (e) {
      isValidPhone.value = false;
    }
  }
  Future<void> firstCheckCode() async {
    try {
      final parsed = await PhoneNumberUtil().parse("+"+phoneController!.text);
      readJson(parsed.countryCode);
     // e164.value = parsed.e164;
    //  isValidPhone.value = true;
    } catch (e) {
      //setState(() {
    //  isValidPhone.value = false;
      print("mPhone= "+ ' parsed.e164');
      //});
    }
    // if (!mounted) return;
  }
  Future<void> readJson(String countryCodeString) async {
    final String response = await rootBundle.loadString('assets/region_codes.json');
    final data = await json.decode(response);

    for (final n in data) {
      //print("jsonCountryCode= "+n['code']+" "+countryCode);
     if(n["dial_code"] == "+"+countryCodeString){
       print("jsonCountryCode= "+n['code']);
       countryCode.value = n['code'];
     }
    }
/*   final countryRegion = data?.firstWhereOrNull((element) =>
    element["dial_code"] == countryCode
   );

    print("jsonCountryCode= "+countryRegion['code']);*/
    // ...
  }
  @override
  Future<void> onReady() async {
    // TODO: implement onReady
/*     Get.dialog(
         Dialog(
           child: Container(
             height: 100.0,
             child: new Column(
               mainAxisSize: MainAxisSize.min,
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 SpinKitThreeBounce(color: Colors.blue, size: 40,),
                 new Text("من فضلك انتظر ....!",style: TextStyle(color: AppColors.advertiseNameColor,fontSize: 24.0,fontFamily: 'Arabic-Regular',fontWeight: FontWeight.w400),
                 ),
               ],
             ),
           ),
         )
     );*/
    EasyLoading.show();
    client!.getMyProfile("Bearer "+myToken!).then((value) {
      Logger().i(value.data?.toJson());
      if(value.data!=null&&value.status==200){
       // Get.back();
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }
        clientProfileModel.value = value.data!;
        //kayanNameController?.text = "tony";
        if(clientProfileModel.value.company_name!=null) {
          kayanNameController?.text = clientProfileModel.value.company_name!;
        }
        if(clientProfileModel.value.username!=null) {
          userNameController?.text = clientProfileModel.value.username!;
        }
        if(clientProfileModel.value.account_name!=null) {
          accountNameEdit?.text = clientProfileModel.value.account_name!;
        }
        if(clientProfileModel.value.manager_name !=null) {
          accountOwner?.text = clientProfileModel.value.manager_name!;
        }
        if(clientProfileModel.value.phone!=null) {
          phoneController?.text = clientProfileModel.value.phone!;
          phone = clientProfileModel.value.phone!;
          firstCheckCode();
        }
        if(clientProfileModel.value.email!=null) {
          emailController?.text = clientProfileModel.value.email!;
          email = clientProfileModel.value.email!;
        }
        if(clientProfileModel.value.personal_id!=null) {
          personalIdController?.text = clientProfileModel.value.personal_id!;
        }
        if(clientProfileModel.value.sgl!=null) {
          sglNumberController?.text = clientProfileModel.value.sgl!;
        }
        if(clientProfileModel.value.chat!=null){
          isChat.value = clientProfileModel.value.chat!;
        }else{
          isChat.value = false;
        }
        if(clientProfileModel.value.notifiable!=null){
          isNotification.value = clientProfileModel.value.notifiable!;
        }else{
          isNotification.value = false;
        }
        if(clientProfileModel.value.type !=null)
          accountType.value = clientProfileModel.value.type!;

        /*if(clientProfileModel.value.r!=null){
          isChat.value = clientProfileModel.value.chat!;
        }else{
          isChat.value = false;
        }
*/
        client!.getCountries().then((value){
          isLoadingLocation.value = false;
          if(value.data!=null){
            countries.value = value.data!;
            countries.removeWhere((element) => element.type=="country_category");
            countries.forEach((element) {
              Logger().i(element.toJson());
            });
            countries.insert(0, Country(id: -1,name: 'الدولة'));
            Country? countryIn = countries.firstWhereOrNull((element) => element.id==clientProfileModel.value.country_id);
            if(countryIn!=null){
              country.value = countryIn;
              if(countryIn.areas!=null) {
                areas.value = countryIn.areas!;
                areas.insert(0, Area(id: -1,name: 'المدينة'));
                Area? areaIn = countryIn.areas?.firstWhereOrNull((
                    element) => element.id == clientProfileModel.value.area_id);

                if(areaIn!=null){
                  print("areaIn"+areaIn.name!);
                  area.value = areaIn;
                }else{
                  area.value = countryIn.areas![1];
                }
              }
            }else{
               countryIn = countries.value[2];
               country.value = countryIn;
              if(countryIn.areas!=null) {
                areas.value = countryIn.areas!;
                Area? areaIn = countryIn.areas?.firstWhereOrNull((
                    element) => element.id == clientProfileModel.value.area_id);

                if(areaIn!=null){
                  print("areaIn"+areaIn.name!);
                  area.value = areaIn;
                }else{
                  area.value = countryIn.areas![1];
                }
              }
            }
          }
        });
      }
    });

    super.onReady();
  }
  void changeEdit(){

    if(isEnabled.value){
      isEnabled.value = false;
    }else{
      isEnabled.value = true;
    }
    print("EditEdit"+isEnabled.value.toString());
  }
  Timer? timer;
var isEmailVerified = false.obs;
  verifyEmail(BuildContext context) async {
    if(email==emailController!.text){
      showMyToast(" تم تأكيد الايميل من قبل !", false, context);
      return;
    }

    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController!.text.trim(),
          password: "SuperSecretPassword!"
      );
      //if(FirebaseAuth.instance.currentUser!=null) {
        print("kkkkkkkkkkkkkkk");
        isEmailVerified.value = FirebaseAuth.instance.currentUser!.emailVerified;
        if(isEmailVerified.isFalse){
          sendEmailVerification();
          Get.toNamed(
              '/VerificationEmailPage?route=profile&email=${/*countryCode.value.toString() + */emailController!.text}')?.then((value) {
                timer?.cancel();
          });
          timer = Timer.periodic(Duration(seconds: 3), (timer) async {
            await FirebaseAuth.instance.currentUser?.reload();
            isEmailVerified.value = FirebaseAuth.instance.currentUser!.emailVerified;
            if(isEmailVerified.isTrue){
             timer.cancel();
             showMyToast("تم تأكيد الايميل بنجاح !", false, context);
             Get.back();
            }
          });
        }
    //  }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }else if(e.code=="email-already-in-use"){
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController!.text.trim(),
            password: "SuperSecretPassword!"
        );
        isEmailVerified.value = FirebaseAuth.instance.currentUser!.emailVerified;
        if(isEmailVerified.isTrue){
          showMyToast("تم تأكيد الايميل من قبل !", false, context);
        }
      }
      print("mError"+e.code);
    }
  }
  Future<void> sendEmailVerification() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      await user?.sendEmailVerification();
    }catch(e){
      print(e);
    }
  }

  Future<void> verifyPhone(BuildContext context) async {
    await initPlatformState();
    if("+"+phone==e164.value){
      showMyToast(" تم تأكيد رقم الجوال من قبل !", false, context);
      return;
    }
    print("hhhhhhhhhhhhhhhhhhhhhhhhhhh");
    EasyLoading.show(status:'انتظر');

    final PhoneCodeSent smsOTPSent = (String verId, [int? forceCodeResend]) {
      if(EasyLoading.isShow){
        EasyLoading.dismiss();
      }
      verificationId.value = verId;
      Get.toNamed(
          '/VerificationCodeProfilePage?verificationId=${verificationId.value}&&route=profile&phone=${/*countryCode.value.toString() + */e164.value}');
      // smsOTPDialog(context).then((value) {
      //   print('sign in');
      // });
    };
    try {
      print("myPhone= "+ e164.value);
      /*print(
          '>>>>>>>>>>>>>>>>>>>>${countryCode.value.toString() + int.parse(phone).toString()}');*/
      await auth.verifyPhoneNumber(
          phoneNumber: e164.value, // PHONE NUMBER TO SEND OTP
          //autoRetrievedSmsCodeForTesting:"123456",
          codeAutoRetrievalTimeout: (String verId) {
            //Starts the phone number verification process for the given phone number.
            //Either sends an SMS with a 6 digit code to the phone number specified, or sign's the user in and [verificationCompleted] is called.
            verificationId.value = verId;
          },
          codeSent:
          smsOTPSent, // WHEN CODE SENT THEN WE OPEN DIALOG TO ENTER OTP.
          timeout: const Duration(seconds: 120),
          verificationCompleted: (PhoneAuthCredential authCredential) {
          showMyToast("تم التحقق من رقم الجوال ! ", false, context);
            isPhoneVerified.value = true;
            pinCodeController!.text = authCredential.smsCode!;
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
      final PhoneAuthCredential  credential = PhoneAuthProvider.credential(
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
     /* Get.toNamed(
          '/registerAccountType?phone=${countryCode.value.toString() + int.parse(phone).toString()}');*/
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

  void changeStatus(bool isOpend,int position) {
    this.isOpend = isOpend;
    this.position = position;
    update();
  }

  late TabController controller;

  Future<void> showChoiceImageDialog(BuildContext context)
  {
    return showDialog(context: context,builder: (BuildContext context){

      return AlertDialog(
        title: Text("إختر",style: TextStyle(color: Colors.blue),),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Divider(height: 1,color: Colors.blue,),
              ListTile(
                onTap: (){
                  _openGallery(context);
                },
                title: Text("معرض الصور"),
                leading: Icon(Icons.account_box,color: Colors.blue,),
              ),

              Divider(height: 1,color: Colors.blue,),
              ListTile(
                onTap: (){
                  _openCamera(context);
                },
                title: Text("الكاميرا"),
                leading: Icon(Icons.camera,color: Colors.blue,),
              ),
            ],
          ),
        ),);
    });
  }
  void _openGallery(BuildContext context) async{
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(pickedFile!=null){
      xFile = pickedFile;
      imageFile = File(xFile.path);
      imagePath.value =xFile.path;
    }
   /* setState(() {
      imageFile = pickedFile!;
    });*/

    Navigator.pop(context);
  }
  void _openCamera(BuildContext context) async{
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    /* setState(() {
      imageFile = pickedFile!;
    });*/
    if(pickedFile!=null){
      xFile = pickedFile;
      imageFile = File(xFile.path);
      imagePath.value =xFile.path;
    }
    Navigator.pop(context);
  }

  FocusNode nameFocusNode = FocusNode();
  FocusNode kayanNameNode = FocusNode();
  FocusNode accountNameNode = FocusNode();
  FocusNode accountOwnerNode = FocusNode();
  FocusNode userNameNode = FocusNode();
  FocusNode phoneControllerNode = FocusNode();
  FocusNode emailControllerNode = FocusNode();
  FocusNode sglNumberNode = FocusNode();
  FocusNode personalIdNode = FocusNode();
  bool isNumericUsingRegularExpression(String string) {
    final numericRegex =
    RegExp(r'^-?(([0-9]*)|(([0-9]*)))$');

    return numericRegex.hasMatch(string);
  }
  bool isValidEmailUsingRegularExpression(String string) {
    final numericRegex =
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    return numericRegex.hasMatch(string);
  }


  void saveButtonClicked(context) async{
 /*   await client!.updateMyProfile(UpdateProfileRequest(username: "MohamedEltony",account_name: " Eltony",email: "mohamedtony349@yahoo.com",phone: "201111046148",country_id: 4,area_id: 9,role: 'user',type: 'client',personal_id: "5666660609"),"application/json",file: File(imagePath.value) ).then((value) {
      print("myHere"+value.status.toString());
      print("myHere"+value.message.toString());
      Logger().i(value.data!.toJson());
      //if()
    });*/
    await initPlatformState();
    print("phone=$phone+m");
    print("phone=${e164.value}+m");
    if(phone.startsWith("+")){
      print("yesssss");
      phone.replaceFirst("+", "");
    }
    if (accountType.value=="client" && userNameController!.text.isEmpty) {
      showMyToast("من فضلك ادخل الاسم !",true,context);
      userNameNode.requestFocus();
      return;
    }else if (accountType.value=="company" && kayanNameController!.text.isEmpty) {
      showMyToast("من فضلك ادخل اسم الكيان !",true,context);
      kayanNameNode.requestFocus();
      return;
    }else if (accountNameEdit!.text.isEmpty) {
      showMyToast("من فضلك ادخل اسم الحساب !",true,context);
      accountNameNode.requestFocus();
      return;
    }else if (accountType.value=="company" && accountOwner!.text.isEmpty) {
      showMyToast("من فضلك ادخل اسم صاحب الحساب !",true,context);
      accountOwnerNode.requestFocus();
      return;
    }
    if (accountType.value=="company" && userNameController!.text.isEmpty) {
      showMyToast("من فضلك ادخل الاسم !",true,context);
      userNameNode.requestFocus();
      return;
    } else if (phoneController!.text.isEmpty) {
      showMyToast("من فضلك ادخل رقم الجوال !",true,context);
      phoneControllerNode.requestFocus();
      return;
    }else if (!isNumericUsingRegularExpression(phoneController!.text)) {
      showMyToast("من فضلك ادخل رقم الجوال بشكل صحيح!",true,context);
      phoneControllerNode.requestFocus();
      return;
    } else if (!isValidPhone.value) {
      showMyToast("رقم الجوال وكود الدولة غير متطابقين !",true,context);
      phoneControllerNode.requestFocus();
      return;
    }else if (identical(("+"+phone).trim(),(e164.value.trim())) && isPhoneVerified.isFalse) {
      showMyToast("يرجى التحقق من رقم الجوال اولا !",true,context);
      //phoneControllerNode.requestFocus();
      return;
    }else if (emailController!.text.isEmpty) {
      showMyToast("من فضلك ادخل الايميل الالكترونى !",true,context);
      emailControllerNode.requestFocus();
      return;
    }else if (!isValidEmailUsingRegularExpression(emailController!.text)) {
      showMyToast("من فضلك ادخل الايميل الالكترونى بشكل صحيح !",true,context);
      emailControllerNode.requestFocus();
      return;
    }else if (email!=emailController!.text && isEmailVerified.isFalse) {
      showMyToast("يرجى التحقق من الايميل اولا !",true,context);
      //emailControllerNode.requestFocus();
      return;
    } else if (accountType.value=="company" && sglNumberController!.text.isEmpty) {
      showMyToast("من فضلك ادخل رقم السجل !",true,context);
      sglNumberNode.requestFocus();
      return;
    }else if (accountType.value=="company" && !isNumericUsingRegularExpression(sglNumberController!.text)) {
      showMyToast("من فضلك ادخل رقم السجل بشكل صحيح !",true,context);
      sglNumberNode.requestFocus();
      return;
    } else if (accountType.value=="client" && personalIdController!.text.isEmpty) {
      showMyToast("من فضلك ادخل رقم الهوية !",true,context);
      personalIdNode.requestFocus();
      return;
    }else if (accountType.value=="client" && !isNumericUsingRegularExpression(personalIdController!.text)) {
      showMyToast("من فضلك ادخل رقم الهوية بشكل صحيح !",true,context);
      personalIdNode.requestFocus();
      return;
    } else if (country.value.id==null || country.value.id==-1) {
      showMyToast("من فضلك ادخل الدولة!",true,context);
      //personalIdNode.requestFocus();
      return;
    } else if (area.value.id==null || area.value.id==-1) {
      showMyToast("من فضلك ادخل المنطقة !",true,context);
     // personalIdNode.requestFocus();
      return;
    }else{
      print("hereeee1");
      LoadingDailog().showLoading(context);
      if(accountType.value=="client"){
        await client!.updateMyProfile("application/json","Bearer "+myToken!,username: userNameController!.text,account_name: accountNameEdit!.text,phone: e164.value.replaceFirst("+", ""),email: emailController!.text,type: accountType.value,role: clientProfileModel.value.role,personal_id: personalIdController!.text.isEmpty?null: personalIdController!.text,area_id: area.value.id,country_id: country.value.id,isChat: isChat.value?1:0,isNotification:isNotification.value?1:0,file: imageFile).then((value){
          print("myHere"+value.status.toString());
          print("myHere"+value.message.toString());
          phone = e164.value;
          email = emailController!.text;
          Logger().i(value.data!.toJson());
          Navigator.of(context).pop();
          if(value.message!=null) {
            showMyToast(value.message!, false, context);
          }
        });
      }else{
        print("accountType.value"+accountType.value);

        await client!.updateMyProfile("application/json","Bearer "+myToken!,company_name: kayanNameController!.text,account_name: accountNameEdit!.text,manager_name: accountOwner!.text,phone: e164.value.replaceFirst("+", ""),email: emailController!.text.trim(),type: accountType.value,role: clientProfileModel.value.role,sgl: sglNumberController!.text.isEmpty?null:sglNumberController!.text,area_id: area.value.id,country_id: country.value.id,isChat:  isChat.value?1:0,isNotification:isNotification.value?1:0,file: imageFile).then((value){
          print("myHere"+value.status.toString());
          print("myHere"+value.message.toString());
          phone = e164.value;
          email = emailController!.text.trim();
          Logger().i(value.data!.toJson());
          Navigator.of(context).pop();
          if(value.message!=null) {
            showMyToast(value.message!, false, context);
          }
        });
      }
      FocusManager.instance.primaryFocus?.unfocus();
    }

  }

  void showMyToast(String msg,bool error,BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content:  Text(msg,style: TextStyle(color: AppColors.white,fontSize: 17,fontFamily: 'Arabic-Regular'),
      ),
      backgroundColor: error?Colors.red:Colors.grey,
    ));
    /*Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: error?Colors.red:Colors.grey,
        textColor: Colors.white,
       //fontFamily: 'Arabic-Regular',
        fontSize: 16.0);*/
  }
  @override
  void onClose() {
    // TODO: implement onClose
    timer?.cancel();
     nameFocusNode.dispose();
     kayanNameNode.dispose();
     accountNameNode.dispose();
     accountOwnerNode.dispose();
     userNameNode.dispose();
     phoneControllerNode.dispose();
     emailControllerNode.dispose();
     sglNumberNode.dispose();
     personalIdNode.dispose();

    super.onClose();
  }

  @override
  // TODO: implement onDelete
  InternalFinalCallback<void> get onDelete => super.onDelete;



}