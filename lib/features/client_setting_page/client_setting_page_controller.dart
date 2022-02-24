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
  TextEditingController? kayanNameController,accountNameEdit,accountOwner,phoneController,emailController,personalIdController,userNameController,sglNumberController;
  var flag = false.obs;
  var isEnabled=false.obs;

  var clientProfileModel = ClientProfileModel().obs;
  RxList<Country> countries = <Country>[].obs;
  RxList<Area> areas = <Area>[].obs;
  var country = Country().obs;
  var area = Area().obs;
  var smsOTP = ''.obs;
  var verificationId = '';
  var countryCode ='SA'.obs;
  var phone = '';
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
          firstCheckCode();
        }
        if(clientProfileModel.value.email!=null) {
          emailController?.text = clientProfileModel.value.email!;
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
            countries.insert(0, Country(id: -1,name: 'الدولة'));
            countries.forEach((element) {
              Logger().i(element.toJson());
            });
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

  Future<void> verifyPhone() async {
    EasyLoading.show(status:'انتظر');
    final PhoneCodeSent smsOTPSent = (String verId, [int? forceCodeResend]) {
      if(EasyLoading.isShow){
        EasyLoading.dismiss();
      }
     verificationId = verId;
      Get.toNamed(
          '/verificationCodePage?route=registerPhone&phone=${countryCode.value.toString() + int.parse(phoneController!.text).toString()}');
      /*smsOTPDialog(context).then((value) {
        print('sign in');
      });*/
    };
    try {
    /*  print(
          '>>>>>>>>>>>>>>>>>>>>${countryCode.value.toString() + int.parse(phone).toString()}');*/
      await auth.verifyPhoneNumber(
          phoneNumber: countryCode.value.toString() +
              int.parse(phoneController!.text)
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

  void saveButtonClicked(context) async{

 /*   await client!.updateMyProfile(UpdateProfileRequest(username: "MohamedEltony",account_name: " Eltony",email: "mohamedtony349@yahoo.com",phone: "201111046148",country_id: 4,area_id: 9,role: 'user',type: 'client',personal_id: "5666660609"),"application/json",file: File(imagePath.value) ).then((value) {
      print("myHere"+value.status.toString());
      print("myHere"+value.message.toString());
      Logger().i(value.data!.toJson());
      //if()
    });*/
    await initPlatformState();
    if (accountType.value=="client" && userNameController!.text.isEmpty) {
      showMyToast("من فضلك ادخل الاسم !",true,context);
      return;
    }else if (accountType.value=="company" && kayanNameController!.text.isEmpty) {
      showMyToast("من فضلك ادخل اسم الكيان !",true,context);
      return;
    }else if (accountNameEdit!.text.isEmpty) {
      showMyToast("من فضلك ادخل اسم الحساب !",true,context);
      return;
    }else if (accountType.value=="company" && accountOwner!.text.isEmpty) {
      showMyToast("من فضلك ادخل اسم صاحب الحساب !",true,context);
      return;
    }if (accountType.value=="company" && userNameController!.text.isEmpty) {
      showMyToast("من فضلك ادخل الاسم !",true,context);
      return;
    } else if (phoneController!.text.isEmpty) {
      showMyToast("من فضلك ادخل رقم الجوال !",true,context);
      return;
    } else if (!isValidPhone.value) {
      showMyToast("رقم الجوال وكود الدولة غير متطابقين !",true,context);
      return;
    }else if (emailController!.text.isEmpty) {
      showMyToast("من فضلك ادخل الايميل الالكترونى !",true,context);
      return;
    } else if (accountType.value=="company" && sglNumberController!.text.isEmpty) {
      showMyToast("من فضلك ادخل رقم السجل !",true,context);
      return;
    } else if (accountType.value=="client" && personalIdController!.text.isEmpty) {
      showMyToast("من فضلك ادخل رقم الهوية !",true,context);
      return;
    } else{
      print("hereeee1");
      LoadingDailog().showLoading(context);
      if(accountType.value=="client"){
        await client!.updateMyProfile("application/json","Bearer "+myToken!,username: userNameController!.text,account_name: accountNameEdit!.text,phone: e164.value.replaceFirst("+", ""),email: emailController!.text,type: accountType.value,role: clientProfileModel.value.role,personal_id: personalIdController!.text.isEmpty?null: personalIdController!.text,area_id: area.value.id,country_id: country.value.id,isChat: isChat.value?1:0,isNotification:isNotification.value?1:0,file: imageFile).then((value){
          print("myHere"+value.status.toString());
          print("myHere"+value.message.toString());
          Logger().i(value.data!.toJson());
          Navigator.of(context).pop();
          if(value.message!=null) {
            showMyToast(value.message!, false, context);
          }
        });
      }else{
        print("accountType.value"+accountType.value);
        await client!.updateMyProfile("application/json","Bearer "+myToken!,company_name: kayanNameController!.text,account_name: accountNameEdit!.text,manager_name: accountOwner!.text,phone: e164.value.replaceFirst("+", ""),email: emailController!.text,type: accountType.value,role: clientProfileModel.value.role,sgl: sglNumberController!.text.isEmpty?null:sglNumberController!.text,area_id: area.value.id,country_id: country.value.id,isChat:  isChat.value?1:0,isNotification:isNotification.value?1:0,file: imageFile).then((value){
          print("myHere"+value.status.toString());
          print("myHere"+value.message.toString());
          Logger().i(value.data!.toJson());
          Navigator.of(context).pop();
          if(value.message!=null) {
            showMyToast(value.message!, false, context);
          }
        });
      }

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
    phoneController?.dispose();
    super.onClose();
  }
  @override
  // TODO: implement onDelete
  InternalFinalCallback<void> get onDelete => super.onDelete;

}