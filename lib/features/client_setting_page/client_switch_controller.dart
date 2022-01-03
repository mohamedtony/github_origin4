import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientSwitchController extends GetxController  {
  var isOpend = false;
  var position = -1;
  var tabIndex = 1.obs;
  TextEditingController? kayanNameController,accountNameEdit,accountOwner,phoneController,emailController;
  var flag = false.obs;

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
    super.onInit();
  }

  void changeIndex(int position) {
    this.tabIndex.value = position;

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