import 'package:advertisers/features/users_module/controller/choose_baka_controller.dart';
import 'package:advertisers/main.dart';
import 'package:advertisers/shared/network/models/CreateSubscriptionModel.dart';
import 'package:advertisers/shared/network/models/PeriodModel.dart';
import 'package:advertisers/shared/network/models/SubscriptionDetail.dart';
import 'package:advertisers/shared/network/requests/CreateSubscriptionRequest.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
class BakaDetailsController extends GetxController{
  GlobalKey<FormState> pakaDetailsFormKey=GlobalKey<FormState>( );

  late TextEditingController pakaTimeController;
  final ChooseBakaController _chooseBakaController = Get.find();



  var phone='';
  var logoPath=''.obs;
  var imageBase641=''.obs;
  SubscriptionDetail? subscriptionBakaDetail;
  CreateSubscriptionModel? createSubscriptionModel;
  //Repository repo=Repository();
  RxList<String> items=<String>[].obs;
  var periodId=-1;
  double priceAfterDiscount =-1;
  var paymentMethod = ''.obs;
  //final paymentIndex=-1.obs;
  final paymentIndex = Rxn<int>(-1);
  @override
  void onInit() {
    //repo.postWithImageMultipart({})

    pakaTimeController=TextEditingController();

    client!.createSubscriptions(CreateSubscriptionRequest(execute: 0,payment_method: "STC",period_id: _chooseBakaController.selectedBakaId), "Bearer  40|UrWNjwnaUs6pK4RjcNztJpB6kK97LlnbKzCEeTpd").then((value) {
      if(value.data!=null&&value.status==200){
        //subscriptionBakaDetail = value.data!;
        print("mTotal: "+value.data!.total!.toString());
        // if(value.data.total!=null){
        priceAfterDiscount =value.data!.total!;
        createSubscriptionModel=value.data;
        update();
        //}
      }
    });
    client!.getSubscriptionDetails(_chooseBakaController.selectedBakaId).then((value){
      if(value.data!=null&&value.status==200){
        //subscriptionBaka.value = value.data!;
        //print("BakaDetails"+ value.data!.settings![0].name!);
        subscriptionBakaDetail = value.data!;
        subscriptionBakaDetail?.settings?.forEach((element) {
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
   // _chooseBakaController.changeBakaID(-1);
    super.onClose();
  }

  void changePeriod(int id) {
    periodId = id;
    client!.createSubscriptions(CreateSubscriptionRequest(execute: 0,payment_method: "STC",period_id: id), "Bearer  40|UrWNjwnaUs6pK4RjcNztJpB6kK97LlnbKzCEeTpd").then((value) {
      if(value.data!=null&&value.status==200){
        //subscriptionBakaDetail = value.data!;
        print("mTotal: "+value.data!.total!.toString());
       // if(value.data.total!=null){
          priceAfterDiscount =value.data!.total!;
          update();
        //}
      }
    });
/*    if(subscriptionBakaDetail.periods!=null) {
      PeriodModel periodModel = subscriptionBakaDetail.periods!.firstWhere((element) => element.id == id);
      if(periodModel!=null){
        priceAfterDiscount = periodModel.price_after_discount!;
        update();
      }
    }*/
  }

  void changePayMethod(String payMethod, int index) {
    paymentMethod.value = payMethod;
   // someNumber.value
    paymentIndex.value = index;

  }
}