import 'package:advertisers/features/advertising_story_details/Dragabble/overlay_handler.dart';
import 'package:advertisers/features/advertising_story_details/VideoController.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
//=========================================================================================

//                         By Mohamed T. Hammad

//=========================================================================================
class HomeNavController extends GetxController with GetTickerProviderStateMixin {
  var tabIndex = 0;
  var isSmall = false.obs;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }



  var pageController = PageController().obs;
  var animateController;
  var videoController = VideoController().obs;
  RxList stories =  [].obs;
  //RxList<Country> countriesForLocationSheet = <Country>[].obs;
  late TabController tabController;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    animateController = AnimationController(vsync: this).obs;
    tabController = TabController(length: 3, vsync: this);
  }

}