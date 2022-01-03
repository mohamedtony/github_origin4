import 'package:advertisers/features/request_advertise_module/view/widgets/advertising_channels_sheet.dart';
import 'package:advertisers/features/request_advertise_module/view/widgets/attatchements_sheet.dart';
import 'package:advertisers/features/request_advertise_module/view/widgets/urls_bottom_sheet.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
class HomeNavController extends GetxController {
  var tabIndex = 0;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  Future<bool> onWillPop() async {
    return !await navigatorKey.currentState!.maybePop();
  }

}