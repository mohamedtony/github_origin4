import 'package:advertisers/app_core/network/models/Country.dart';
import 'package:advertisers/features/advertising_story_details/VideoController.dart';
import 'package:advertisers/features/advertising_story_details/Story.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
//=========================================================================================

//                         By Mohamed T. Hammad

//=========================================================================================
class HomeNavController extends GetxController with GetSingleTickerProviderStateMixin {
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

  var pageController = PageController().obs;
  var animateController;
  var videoController = VideoController().obs;
  RxList stories =  [].obs;
  //RxList<Country> countriesForLocationSheet = <Country>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    animateController = AnimationController(vsync: this).obs;
  }

}