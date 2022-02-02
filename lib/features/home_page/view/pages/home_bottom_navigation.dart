import 'dart:ui';
import 'package:advertisers/features/advertiser_settings_page/widgets/location_range_sheet.dart';
import 'package:advertisers/features/chat/view/pages/chat_recent_page.dart';
import 'package:advertisers/features/find_advertise_page/filter_order_advertisers_sheet.dart';
import 'package:advertisers/features/home_page/controller/home_navigation_controller.dart';
import 'package:advertisers/features/home_page/view/pages/add_ad_page.dart';
import 'package:advertisers/features/home_page/view/pages/favorite_page.dart';
import 'package:advertisers/features/home_page/view/pages/home_tabs_page.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:advertisers/features/request_advertise_module/view/widgets/address_bottom_sheet.dart';
import 'package:advertisers/features/request_advertise_module/view/widgets/advertising_channels_sheet.dart';
import 'package:advertisers/features/request_advertise_module/view/widgets/attatchements_sheet.dart';
import 'package:advertisers/features/request_advertise_module/view/widgets/discount_coupon_sheet.dart';
import 'package:advertisers/features/request_advertise_module/view/widgets/notice_sheet.dart';
import 'package:advertisers/features/request_advertise_module/view/widgets/urls_bottom_sheet.dart';
import 'package:advertisers/features/wallet_module/wallet_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class Home extends StatelessWidget {
    Home({Key? key}) : super(key: key);
 // final HomeNavController _loginController=Get.put(HomeNavController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeNavController>(
      init: HomeNavController(),
      builder: (controller)=>DefaultTabController(
        length: 5,
        child: Scaffold(
          key: controller.scaffoldKey,
          bottomNavigationBar: Material(
            child: TabBar(
                unselectedLabelColor: AppColors.unseletabColor,
                indicatorSize: TabBarIndicatorSize.tab,
                padding: EdgeInsets.only(left: 6.0,right: 6.0,top: 6.0,bottom: 4.0),
                /*indicatorColor: AppColors.indicatorColor,
                        indicatorWeight: 4.0,*/
                indicator: BoxDecoration(

                    borderRadius: BorderRadius.circular(4.0),
                    color: AppColors.tabColor),
                labelPadding:
                const EdgeInsets.only(left: 8.0, right: 8.0),
                indicatorPadding: const EdgeInsets.only(top:-2.0),


                //isScrollable: true,
                /*indicator: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.redAccent, Colors.orangeAccent]),
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.redAccent),*/
                tabs: [
                  Container(
                    child: Tab(
                      height: 50.0,
                      iconMargin: EdgeInsets.zero,
                      icon: ImageIcon(AssetImage(
                'images/home_icon.png',),size: 20,),
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: Text("الرئيسية",),
                        ),
                      ),
                    ),
                    /*decoration: BoxDecoration(
                              *//* gradient: LinearGradient(
                                    colors: [Colors.redAccent, Colors.orangeAccent]),*//*
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(6.0),
                                    topRight: Radius.circular(6.0)),
                                color: AppColors.tabColor),*/
                  ),
                  Container(
                    child: Tab(
                      height: 50.0,
                      iconMargin: EdgeInsets.zero,
                      icon: ImageIcon(AssetImage(
                        'images/heart_outline.png',),size: 20,),
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: Text("المفضلة",),
                        ),
                      ),
                    ),
                    /*decoration: BoxDecoration(
                              *//* gradient: LinearGradient(
                                    colors: [Colors.redAccent, Colors.orangeAccent]),*//*
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(6.0),
                                    topRight: Radius.circular(6.0)),
                                color: AppColors.tabColor),*/
                  ),
                  Container(
                    child: Tab(
                      height: 50.0,
                      iconMargin: EdgeInsets.zero,
                      icon:  Icon(Icons.add_circle_outline,size: 24.0,),
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: Text("إعلان",),
                        ),
                      ),
                    ),
                    /*decoration: BoxDecoration(
                              *//* gradient: LinearGradient(
                                    colors: [Colors.redAccent, Colors.orangeAccent]),*//*
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(6.0),
                                    topRight: Radius.circular(6.0)),
                                color: AppColors.tabColor),*/
                  ),
                  Container(
                    child: Tab(
                      height: 50.0,
                      iconMargin: EdgeInsets.zero,
                      icon: ImageIcon(AssetImage(
                        'images/chat_icon.png',),size: 20,),
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: Text("الشات",),
                        ),
                      ),
                    ),
                    /*decoration: BoxDecoration(
                              *//* gradient: LinearGradient(
                                    colors: [Colors.redAccent, Colors.orangeAccent]),*//*
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(6.0),
                                    topRight: Radius.circular(6.0)),
                                color: AppColors.tabColor),*/
                  ),
                  Container(
                    child: Tab(
                      height: 50.0,
                      iconMargin: EdgeInsets.zero,
                      icon: ImageIcon(AssetImage(
                        'images/wallet_home.png',),size: 20,),
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: Text("المحفظة",),
                        ),
                      ),
                    ),
                    /*decoration: BoxDecoration(
                              *//* gradient: LinearGradient(
                                    colors: [Colors.redAccent, Colors.orangeAccent]),*//*
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(6.0),
                                    topRight: Radius.circular(6.0)),
                                color: AppColors.tabColor),*/
                  ),
                ]),


          /*bottomNavigationBar: Material(
            child: BottomNavigationBar(
              onTap: controller.changeTabIndex,
              currentIndex: controller.tabIndex,
              backgroundColor: AppColors.bgTabColor,
              // fixedColor: Colors.red,
              //selectedItemColor: AppColors.selectedLabelColor,
              selectedItemColor: AppColors.tabColor,
              //unselectedItemColor: AppColors.unSelectedLabelColor,
              unselectedItemColor: AppColors.unseletabColor,
              // selectedLabelStyle: TextStyle(color: AppColors.indicatorColor),
              type: BottomNavigationBarType.fixed,

              selectedIconTheme:  IconThemeData(color: AppColors.tabColor, size: 25, opacity: .8),
              unselectedIconTheme:
              IconThemeData(color: AppColors.unseletabColor, size: 25, opacity: .8),
              items: [
                BottomNavigationBarItem(
                  icon: Container(
                    color: Colors.green,
                    child: ImageIcon(AssetImage(
            'images/home_icon.png')),
                  ),
                 // activeIcon: new Icon(Icons.filter_list_alt),
                  label: 'الرئيسية',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(
                      'images/heart_outline.png')),
                  label: 'المفضلة',
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.add_circle_outline,),
                    label: 'إعلان',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(
                      'images/chat_icon.png')),
                  label: 'الشات',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(
                      'images/wallet_home.png')),
                  label: 'المحفظة',
                )
              ],
            ),*/
          ),
          body: TabBarView(
              children: [
                /*Navigator(
                  key: controller.navigatorKey,
                  onGenerateRoute: (routeSettings) {
                    return MaterialPageRoute(
                      builder: (context) => HomePage(),
                    );
                  },
                ),*/
                HomePage(
                  onSheetClicke: (x){
                    print('tonyClicked:$x');
                    showBottomSheetForRequest(context,x);
                  },
                ),
                FavoritePage(),
                AddAdsPage(),
                ChatRecentPage(),
                WalletPage(),
              ]),
        ),
      ),
    );
  }
    void showBottomSheetForRequest(BuildContext context,int bottomNumber){
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(10.0),
              topRight: const Radius.circular(10.0)),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
            //maxChildSize: 0.8,
            //minChildSize: 100.0,

            initialChildSize: bottomNumber==6?0.84:0.67,
            expand: false,
            builder: (context, scrollController) {
              if(bottomNumber==2) {
                return AdvertisingChannelsPage(
                  scrollController: scrollController
                );
               /* return LocationRangeBottomSheet(
                    scrollController: scrollController);
*/
              }else if(bottomNumber==3){
                return AttatchementPage(
                    scrollController: scrollController);
              }else if(bottomNumber==4){
                return UrlsPage(
                    scrollController: scrollController);
              }else if(bottomNumber==5){
                return AddressBottomSheet(
                    scrollController: scrollController);
              }else if(bottomNumber==6){
                return DiscountCouponSheet(
                    scrollController: scrollController);
              }else if(bottomNumber==7){
                return NoticeSheet(
                    scrollController: scrollController);
              }else{
                return FilterOrderAdvertisersSheet(
                    scrollController: scrollController);
              }
            },
          );
        },
      );
      /*showMaterialModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
       // expand: true,
        isDismissible: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(10.0),
              topRight: const Radius.circular(10.0)),
        ),
       // clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (context) => BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: DraggableScrollableSheet(
            //maxChildSize: 0.8,
            //minChildSize: 100.0,

            initialChildSize: 0.67,
            expand: false,
            builder: (context, scrollController) {
              return AttatchementPage(
                  scrollController: scrollController);
            },
          )
        ),
      );*/

/*      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        isDismissible: true,
        //barrierColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(10.0),
              topRight: const Radius.circular(10.0)),
        ),
        //clipBehavior: Clip.antiAliasWithSaveLayer,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (context) =>  BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: DraggableScrollableSheet(
            //maxChildSize: 0.8,
            //minChildSize: 100.0,
            initialChildSize: 0.67,
           // expand: true,
            builder: (context, scrollController) {
              return ActivitiesBottomSheet(
                  scrollController: scrollController);
            },
          )),
      );*/

     /* showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(10.0),
              topRight: const Radius.circular(10.0)),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
            //maxChildSize: 0.8,
            //minChildSize: 100.0,

            initialChildSize: 0.67,
            expand: false,
            builder: (context, scrollController) {
              return ActivitiesBottomSheet(
                  scrollController: scrollController);
            },
          );
        },
      );*/
    }
}
