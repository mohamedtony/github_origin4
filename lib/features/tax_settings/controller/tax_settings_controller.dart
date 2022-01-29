import 'package:advertisers/app_core/network/models/TaxSettingsModel.dart';
import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/responses/TaxSettingsResponse.dart';
import 'package:advertisers/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';


class TaxSettingsController extends GetxController{
   late TextEditingController taxNumberController;
   late Repository repo;
   List<int>? checkList = [];

   void addRemoveCheckList(id){
     if(checkList!.contains(id)){
       checkList!.remove(id);
     }else{
       checkList!.add(id);
     }
     update();
   }
  var taxs=TaxSettingsModel().obs;

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
    // passIndex;
    repo=Repository();
    getTaxSettings();
    searchController=TextEditingController();
    taxNumberController=TextEditingController();

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
   getTaxSettings(){

     EasyLoading.show();


     repo.get<TaxSettingsResponse>(
         path: 'profile/taxs',
         fromJson: (json) => TaxSettingsResponse.fromJson(json),
         json: {"token":"Bearer  $token"},
         onSuccess: (res) {
           if (EasyLoading.isShow) {
             EasyLoading.dismiss();
           }
           taxs.value=res.data!;
           isChecked=res.data?.tax_enable==0?false:true;
           taxNumberController.text=res.data!.tax_number.toString();
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
   postTaxSettings(){

     EasyLoading.show();


     repo.postWithImageMultipart<TaxSettingsResponse>(
         path: 'profile/taxs',
         fromJson: (json) => TaxSettingsResponse.fromJson(json),
         json: {"token":"Bearer  $token",
           "tax_enable":isChecked,
            "tax_number": taxNumberController.text
         },
         onSuccess: (res) {
           if (EasyLoading.isShow) {
             EasyLoading.dismiss();
           }
           Get.snackbar(
             "نجاح",
             res.message.toString(),
             icon: const Icon(Icons.person, color: Colors.red),
             backgroundColor: Colors.yellow,
             snackPosition: SnackPosition.BOTTOM,);

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


