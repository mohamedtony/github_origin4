import 'package:advertisers/features/wallet_module/controllers/charge_controller.dart';
import 'package:advertisers/features/wallet_module/controllers/points_controller.dart';
import 'package:advertisers/features/wallet_module/controllers/process_controller.dart';
import 'package:advertisers/features/wallet_module/controllers/withdraw_controller.dart';
import 'package:advertisers/features/wallet_module/widgets/wallet_intro/controller/wallet_intro_controller.dart';
import 'package:advertisers/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:advertisers/app_core/network/models/User.dart';


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
  User? userData = User.fromJson(GetStorage().read("data"));

  @override
  void onInit() {
    // GetStorage.init();
    // storage=GetStorage();
    userData;
    Get.put(ChargeController());
    Get.put(PointsController());
    Get.put(ProcessesController());
    Get.put(WithdrawController());
    // Get.put(WalletIntroController());
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
