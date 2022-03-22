import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class WalletController extends GetxController {
  int tabId = 0;
  void passIndex(newIndex) {
    tabId = newIndex;
    update();
  }

  int paymentId = 0;
  void passPaymentIndex(newIndex) {
    paymentId = newIndex;
    update();
  }
  // passIndex(newIndex) => tabId = newIndex;

  increment() => tabId++;

  GlobalKey<FormState> searchFormKey = GlobalKey<FormState>();
  late TextEditingController searchController;
  var search = '';

  @override
  void onInit() {
    // passIndex;
    searchController = TextEditingController();
    super.onInit();
  }

  String? validatePhone(String phone) {
    if (phone.isEmpty) {
      return 'حقل الادخال فارغ';
    }
    return null;
  }

  void checkSearch() {
    final isValid = searchFormKey.currentState!.validate();
    if (!isValid) {
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

class UpperTabItem {
  int? id;
  String? title;
  UpperTabItem({this.title, this.id});
}

List<UpperTabItem>? upperTabItems = [
  UpperTabItem(id: 0, title: "العمليات"),
  UpperTabItem(id: 1, title: "الشحن"),
  UpperTabItem(id: 2, title: "السحب"),
  UpperTabItem(id: 3, title: "النقاط"),
];

class PointsItem {
  dynamic value;
  String? title, name;

  PointsItem({this.title, this.value, this.name});
}

List<PointsItem>? pointsItems = [
  PointsItem(title: "عدد النقاط", name: "نقطة", value: 13000),
  PointsItem(title: "عدد النقاط", name: "نقطة", value: 13000),
  PointsItem(title: "عدد النقاط", name: "نقطة", value: 13000),
];
