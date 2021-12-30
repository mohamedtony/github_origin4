import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdvertiseListController extends GetxController with GetSingleTickerProviderStateMixin {
  var isOpend = false;
  var position = -1;
  var tabIndex = 1.obs;

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
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: 3);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}