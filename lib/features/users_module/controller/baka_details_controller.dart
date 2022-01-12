import 'package:advertisers/main.dart';
import 'package:advertisers/shared/network/models/SubscriptionDetail.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
class BakaDetailsController extends GetxController{
  GlobalKey<FormState> pakaDetailsFormKey=GlobalKey<FormState>( );

  late TextEditingController pakaTimeController;



  var phone='';
  var logoPath=''.obs;
  var imageBase641=''.obs;
  var subscriptionBakaDetail = SubscriptionDetail();
  //Repository repo=Repository();
  RxList<String> items=<String>[].obs;
  @override
  void onInit() {
    //repo.postWithImageMultipart({})

    pakaTimeController=TextEditingController();

    client!.getSubscriptionDetails(1).then((value){
      if(value.data!=null&&value.status==200){
        //subscriptionBaka.value = value.data!;
        //print("BakaDetails"+ value.data!.settings![0].name!);
        subscriptionBakaDetail = value.data!;
        subscriptionBakaDetail.settings?.forEach((element) {
          if(element!=null && element.name!=null) {
            print("ininininininini");
            items.value.add(element.name!);
          }
        });
        update();
      }
    });
    super.onInit();
  }
  String? validateDropDown(String timeStr){
    if (timeStr.length<3){
      return 'يجب اختيار مدة الاشتراك';
    }
    return null;
  }


  void checkLogin(){
    final isValid=pakaDetailsFormKey.currentState!.validate();
    if(!isValid){
      return;
    }
    pakaDetailsFormKey.currentState!.save();
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
  @override
  void onClose() {

    pakaTimeController.dispose();

    super.onClose();
  }
}