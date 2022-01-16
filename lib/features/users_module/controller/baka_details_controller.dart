import 'package:advertisers/features/users_module/controller/choose_baka_controller.dart';
import 'package:advertisers/app_core/network/models/SubscriptionDetail.dart';
import 'package:advertisers/features/users_module/view/cards/advantages_baka_card.dart';
import 'package:advertisers/main.dart';
import 'package:advertisers/shared/network/models/CreateSubscriptionModel.dart';
// import 'package:advertisers/shared/network/models/PeriodModel.dart';
// import 'package:advertisers/shared/network/models/SubscriptionDetail.dart';
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
  Rx<SubscriptionDetail> subscriptionBakaDetail=SubscriptionDetail().obs;
  Rx<CreateSubscriptionModel> createSubscriptionModel=CreateSubscriptionModel().obs;
  //Repository repo=Repository();
  RxList<String> items=<String>[].obs;
  var periodId=-1.obs;
  Rx<double> priceAfterDiscount =  (-0.1).obs;
  var paymentMethod = ''.obs;
  //final paymentIndex=-1.obs;
  final paymentIndex = Rxn<int>(-1);
  @override
  void onInit() {
    //repo.postWithImageMultipart({})

    pakaTimeController=TextEditingController();

    // client!.createSubscriptions(CreateSubscriptionRequest(execute: 0,payment_method: "STC",period_id: _chooseBakaController.selectedBakaId), "Bearer  40|UrWNjwnaUs6pK4RjcNztJpB6kK97LlnbKzCEeTpd").then((value) {
    //   if(value.data!=null&&value.status==200){
    //     //subscriptionBakaDetail = value.data!;
    //     print("mTotal: "+value.data!.total!.toString());
    //     // if(value.data.total!=null){
    //     priceAfterDiscount.value=value.data!.total! ;
    //     createSubscriptionModel.value=value.data! ;
    //  ///   update();
    //     //}
    //   }
    // });
    client!.getSubscriptionDetails(_chooseBakaController.selectedBakaId).then((value){
      if(value.data!=null&&value.status==200){
        //subscriptionBaka.value = value.data!;
        //print("BakaDetails"+ value.data!.settings![0].name!);
        subscriptionBakaDetail.value = value.data! ;
        subscriptionBakaDetail.value.settings?.forEach((element) {
          if(element!=null && element.name!=null) {
            print("ininininininini");
            print(element.name);
            items.add(element.name!);
          }
        });
      ///  update();
        buildItems(items);
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

  var blocOfWidgets=[].obs;
  RxList<Widget> itemsAsWidgets=<Widget>[].obs;
  // List<List<String>> blocOfWidgetst=[];
  // List<String> itemsAsWidgetst=[];

  RxList buildItems(List<String> items){

    // List<List<Widget>> blocOfWidgets=[];
    // List<Widget> itemsAsWidgets=[];

    int counter=0,iterate=(items.length/9).floor();
    for(String text in items){
      print(text);
      itemsAsWidgets.add(AdvantagesBakaCard(//key: UniqueKey(),
        text: text,
      ),);
      print(itemsAsWidgets.length%9);
      if(itemsAsWidgets.length%9==0){

        print(itemsAsWidgets.length);
        blocOfWidgets.add(itemsAsWidgets.toList());
        counter++;
        itemsAsWidgets.clear();
      }else if(blocOfWidgets.isNotEmpty&&itemsAsWidgets.isNotEmpty&&counter>0&&itemsAsWidgets.length<9&&items.length>9&&counter<iterate){

        blocOfWidgets.add(itemsAsWidgets.toList());
        print(itemsAsWidgets.length);
        counter++;
      }else if(blocOfWidgets.isNotEmpty&&itemsAsWidgets.isNotEmpty&&counter==0&&itemsAsWidgets.length<9&&items.length<9){
        blocOfWidgets.add(itemsAsWidgets.toList());
        // return [];
        print(itemsAsWidgets.length);
        //counter++;
      }
      else if(itemsAsWidgets.length==items.length&& counter==0){
        blocOfWidgets.add(itemsAsWidgets.toList());
      }
    }
    print('>>>>>>>>>>>>>>>>>>>>>>>>> ${20%9}');
    return blocOfWidgets;

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

  // void changePeriod(int id) {
  //   periodId = id;
  //   client!.createSubscriptions(CreateSubscriptionRequest(execute: 0,payment_method: "STC",period_id: id), "Bearer  40|UrWNjwnaUs6pK4RjcNztJpB6kK97LlnbKzCEeTpd").then((value) {
  //     if(value.data!=null&&value.status==200){
  //       //subscriptionBakaDetail = value.data!;
  //       print("mTotal: "+value.data!.total!.toString());
  //      // if(value.data.total!=null){
  //         priceAfterDiscount.value =value.data!.total!  ;
  //         ///update();
  //       //}
  //     }
  //   });
/*    if(subscriptionBakaDetail.periods!=null) {
      PeriodModel periodModel = subscriptionBakaDetail.periods!.firstWhere((element) => element.id == id);
      if(periodModel!=null){
        priceAfterDiscount = periodModel.price_after_discount!;
        update();
      }
    }*/
  }

  // void changePayMethod(String payMethod, int index) {
  //   paymentMethod.value = payMethod;
  //  // someNumber.value
  //   paymentIndex.value = index;
  //
  // }
//}