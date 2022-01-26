import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class ActivitiesSheetController extends GetxController{


  List<int>? checkList = [];
  var realImages =[].obs;
  void addItem(String s){
    if(!realImages.contains(s)){
      realImages.add(s);
    }

  }
  void removeItem(int id){
    /*if(!realImages.h(s)){
      realImages.add(s);
    }*/
    int index = realImages.indexWhere((element) => element==id);
    realImages.removeAt(index);
  }
  void addRemoveCheckList(id){
    if(checkList!.contains(id)){
      checkList!.remove(id);
    }else{
      checkList!.add(id);
    }
    update();
  }


  bool isChecked = true;
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
    // passIndex;
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

  @override
  void onClose() {
    searchController.dispose();

    super.onClose();
  }
}


