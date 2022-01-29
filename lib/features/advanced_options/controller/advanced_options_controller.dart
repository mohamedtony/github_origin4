import 'package:advertisers/app_core/network/models/AdvancedOptionsModel.dart';
import 'package:advertisers/app_core/network/models/SettingAdvertiserModel.dart';
import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/responses/GetAdvancedOptionsResponse.dart';
import 'package:advertisers/app_core/network/responses/SettingsAdvertiserProfileResponse.dart';
import 'package:advertisers/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';


class AdvancedOptionsController extends GetxController{

late Repository repo;
  List<String>? checkList = [];
  RxList<SettingAdvertiserModel> allListRequest=<SettingAdvertiserModel>[].obs;
var advancedOptionsData=[].obs;
  void addRemoveCheckList(id){
    if(checkList!.contains(id)){
      checkList!.remove(id);
      allListRequest.forEach((e){
        if(e.key==id) {
          e.value = 0;
        }
      });
    }else{
      checkList!.add(id);
      allListRequest.forEach((e){
        if(e.key==id) {
           e.value = 1;
        }
      });
    }
    update();
  }


  bool isChecked = false;
  void changeChecked(){
    if(isChecked == false){
      isChecked = true;
    }else{
      isChecked = false;
    }
    update();
  }




  GlobalKey<FormState> searchFormKey=GlobalKey<FormState>();
  late TextEditingController searchController;
  var search='';
  late String token;
  @override
  void onInit() {
    token =storage.read("token");
    repo=Repository();
    // passIndex;
    getSettings();

    searchController=TextEditingController();
    super.onInit();
  }
  String? validatePhone(String phone){
    if (phone.isEmpty){
      return 'حقل الادخال فارغ';
    }
    return null;
  }



  void checkSearch(){
    final isValid=searchFormKey.currentState!.validate();
    if(!isValid){
      return;
    }
    searchFormKey.currentState!.save();
    // loginClient();
  }

  getSettings() {
    EasyLoading.show();


    repo.get<SettingsAdvertiserProfileResponse>(
        path: 'profile/settings',
        fromJson: (json) => SettingsAdvertiserProfileResponse.fromJson(json),
        json: {"token": "Bearer  $token"},
        onSuccess: (res) {
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }
          advancedOptionsData.value = res.data!;
          allListRequest.value=res.data! ;
          update();
        },
        onError: (err, res) {
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }
          Get.snackbar(
            "خطأ",
            res.message.toString(),
            icon: const Icon(Icons.person, color: Colors.red),
            backgroundColor: Colors.yellow,
            snackPosition: SnackPosition.BOTTOM,);
        });
  }
  setSettings() {
  EasyLoading.show();

  Map<String,dynamic>map=Map.fromIterable(allListRequest.value, key: (e) => e.key, value: (e) => e.value);
  print(map);
  map.assign("token", "Bearer  $token");
  repo.postWithImageMultipart<SettingsAdvertiserProfileResponse>(
      path: 'profile/settings',
      fromJson: (json) => SettingsAdvertiserProfileResponse.fromJson(json),
      json:map         //{"token": "Bearer  156|EQUdZIpAmMfekHG0ZO1GQpkAdCtglYF9xj8vNo36",

      ,
      onSuccess: (res) {
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }

      },
      onError: (err, res) {
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }
        Get.snackbar(
          "خطأ",
          res.message.toString(),
          icon: const Icon(Icons.person, color: Colors.red),
          backgroundColor: Colors.yellow,
          snackPosition: SnackPosition.BOTTOM,);
      });
}
  @override
  void onClose() {
    searchController.dispose();

    super.onClose();
  }
}


