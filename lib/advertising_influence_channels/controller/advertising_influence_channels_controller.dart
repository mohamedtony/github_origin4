import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class AdvertisingInfluenceChannelsController extends GetxController{

  List<int>? checkList = [];
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


  @override
  void onInit() {
    // passIndex;
    super.onInit();
  }






  @override
  void onClose() {

    super.onClose();
  }
}


