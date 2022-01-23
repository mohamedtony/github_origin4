import 'package:advertisers/app_core/network/models/AdvancedOptionsModel.dart';
import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/responses/GetAdvancedOptionsResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';


class AdvancedOptionsController extends GetxController{

late Repository repo;
  List<int>? checkList = [];
var advancedOptionsData=[].obs;
  void addRemoveCheckList(id){
    if(checkList!.contains(id)){
      checkList!.remove(id);
    }else{
      checkList!.add(id);
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

  @override
  void onInit() {
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


    repo.get<GetAdvancedOptionsResponse>(
        path: 'profile/settings',
        fromJson: (json) => GetAdvancedOptionsResponse.fromJson(json),
        json: {"token": "Bearer  156|EQUdZIpAmMfekHG0ZO1GQpkAdCtglYF9xj8vNo36"},
        onSuccess: (res) {
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }
        //  advancedOptionsData.value = res.data!;
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


