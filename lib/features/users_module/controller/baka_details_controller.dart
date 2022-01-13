import 'package:advertisers/app_core/network/models/SubscriptionDetail.dart';
import 'package:advertisers/features/users_module/view/cards/advantages_baka_card.dart';
import 'package:advertisers/main.dart';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
class BakaDetailsController extends GetxController{
  //GlobalKey<FormState> pakaDetailsFormKey=GlobalKey<FormState>( );

  //late TextEditingController pakaTimeController;


  var phone='';
  var logoPath=''.obs;
  var imageBase641=''.obs;
  var subscriptionBakaDetail = SubscriptionDetail();
  //Repository repo=Repository();
  RxList<String> items=<String>[].obs;
  @override
  void onInit() {
    //repo.postWithImageMultipart({})

   /// pakaTimeController=TextEditingController();

    client!.getSubscriptionDetails(1).then((value){
      if(value.data!=null&&value.status==200){
        //subscriptionBaka.value = value.data!;
        //print("BakaDetails"+ value.data!.settings![0].name!);
        subscriptionBakaDetail = value.data! ;
        subscriptionBakaDetail.settings?.forEach((element) {
          if(element!=null && element.name!=null) {
            print("ininininininini");
            items.add(element.name!);
          }
        });
       // update();
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

  dynamic buildItems(List<String> items){

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

  // void checkLogin(){
  //   final isValid=pakaDetailsFormKey.currentState!.validate();
  //   if(!isValid){
  //     return;
  //   }
  //   pakaDetailsFormKey.currentState!.save();
  //   // loginClient();
  //  // Get.toNamed('/verificationCodePage');
  // }
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

   // pakaTimeController.dispose();

    super.onClose();
  }
}