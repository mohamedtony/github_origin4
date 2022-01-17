import 'package:advertisers/app_core/network/models/Area.dart';
import 'package:advertisers/app_core/network/models/ClientProfileModel.dart';
import 'package:advertisers/app_core/network/models/Country.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:advertisers/main.dart';
import 'package:advertisers/shared/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class ClientSettingPageController extends GetxController  {
  var isOpend = false;
  var position = -1;
  var tabIndex = 1.obs;
  TextEditingController? kayanNameController,accountNameEdit,accountOwner,phoneController,emailController,accountRegisteredNumController;
  var flag = false.obs;

  var clientProfileModel = ClientProfileModel().obs;
  RxList<Country> countries = <Country>[].obs;
  RxList<Area> areas = <Area>[].obs;
  var country = Country().obs;
  var area = Area().obs;
// switches the value between true/false
 // flag.toggle();

  @override
  void onInit() {
    // TODO: implement onInit
    kayanNameController = TextEditingController(text: 'الراشد للاوانى الفخارية');
    accountNameEdit= TextEditingController(text: '# El rashid');
    accountOwner= TextEditingController(text: 'محمد تونى حماد');
    phoneController = TextEditingController(text: '01111046148');
    emailController = TextEditingController(text: 'mohamedtony349@yahoo.com');
    accountRegisteredNumController  = TextEditingController();
    super.onInit();
  }

  void changeIndex(int position) {
    this.tabIndex.value = position;

  }
  @override
  void onReady() {
    // TODO: implement onReady
     Get.dialog(
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
     );

    client!.getMyProfile("Bearer  40|UrWNjwnaUs6pK4RjcNztJpB6kK97LlnbKzCEeTpd").then((value) {
      Logger().i(value.data?.toJson());
      if(value.data!=null&&value.status==200){
        Get.back();
        clientProfileModel.value = value.data!;
        kayanNameController?.text = "tony";
        if(clientProfileModel.value.account_name!=null) {
          accountNameEdit?.text = clientProfileModel.value.account_name!;
        }
        if(clientProfileModel.value.account_name!=null) {
          accountNameEdit?.text = clientProfileModel.value.account_name!;
        }
        if(clientProfileModel.value.phone!=null) {
          phoneController?.text = clientProfileModel.value.phone!;
        }
        if(clientProfileModel.value.email!=null) {
          emailController?.text = clientProfileModel.value.email!;
        }
        if(clientProfileModel.value.personal_id!=null) {
          accountRegisteredNumController?.text = clientProfileModel.value.personal_id!;
        }

        client!.getCountries().then((value){
          if(value.data!=null){
            countries.value = value.data!;
            countries.value.forEach((element) {
              Logger().i(element.toJson());
            });
            Country? countryIn = countries.firstWhereOrNull((element) => element.id==clientProfileModel.value.country_id);
            if(countryIn!=null){
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
            }else{
               countryIn = countries.value[1];
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

  void changeStatus(bool isOpend,int position) {
    this.isOpend = isOpend;
    this.position = position;
    update();
  }

  late TabController controller;

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