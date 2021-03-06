import 'package:advertisers/features/advertiser_list_page/list_page.dart';
import 'package:advertisers/features/advertising_story_details/Dragabble/advretising_story_details_page.dart';
import 'package:advertisers/features/advertising_story_details/Dragabble/overlay_handler.dart';
import 'package:advertisers/features/advertising_story_details/Dragabble/overlay_service.dart';
import 'package:advertisers/features/advertising_story_details/VideoController.dart';
import 'package:advertisers/features/client_setting_page/client_setting_page.dart';
import 'package:advertisers/features/home_page/controller/home_navigation_controller.dart';
import 'package:advertisers/features/home_page/view/pages/advertisers_person_page.dart';
import 'package:advertisers/features/home_page/view/pages/advertising_page.dart';
import 'package:advertisers/features/home_page/view/pages/copons_page.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:advertisers/features/request_advertise_module/view/widgets/attatchements_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
//=========================================================================================

//                         By Mohamed T. Hammad

//=========================================================================================
class HomePage extends StatelessWidget {
  HomePage({Key? key,this.onSheetClicke,this.onAdveriseItemClicked}) : super(key: key);
  Function(int x)? onSheetClicke;
  Function(int x)? onAdveriseItemClicked;
  final HomeNavController _loginController = Get.put(HomeNavController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeNavController>(
        init: HomeNavController(),
        builder: (controller) => Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(75.0),
            child: AppBar(
              leading: InkWell(
                onTap: (){
                  Get.toNamed("/ListPage");
                },
                child: Container(

                  margin: EdgeInsets.only(right: 10.0),
                  child: SvgPicture.asset(
                    'images/DrawerIcon.svg',
                    color: Colors.white,
                  ),
                ),
              ),
              leadingWidth: 56.0,
              title: Container(
                height: 40.0,
                // alignment: Alignment.center,
                child: TextField(
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      prefixIcon: Container(
                        padding: EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          'images/search_icon.svg',
                        ),
                      ),
                      suffixIcon: InkWell(
                        onTap: (){
                          print("currentIndex=${_loginController.tabController.index}");
                          if(_loginController.tabController.index==0){
                            onSheetClicke!(10);
                          }else if(_loginController.tabController.index==1){
                            onSheetClicke!(11);
                          }else{
                            onSheetClicke!(12);
                          }

                        },
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: SvgPicture.asset(
                            'images/filter_icon.svg',
                          ),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(70.0),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      //hintText: "Type in your text",
                      fillColor: Colors.white70),
                ),
              ),
              actions: [
                InkWell(
                  onTap: (){
                    Get.toNamed('/NotificationsScreen');
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 20.0, right: 10.0),
                    child: SvgPicture.asset(
                      'images/notification_icon.svg',
                      //color: Colors.white,
                    ),
                  ),
                ),
              ],
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [AppColors.beginColor, AppColors.endColor],
                  ),
                ),
              ),
              elevation: 2,
            //  bottom: ,
            ),
          ),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Card(
                elevation: 4.0,
                color: AppColors.bgTabColor,
                margin: EdgeInsets.only(bottom: 6.0),
                shadowColor: Colors.grey[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
                child: TabBar(
                    unselectedLabelColor: AppColors.tabColor,
                    indicatorSize: TabBarIndicatorSize.tab,
                    padding: EdgeInsets.only(
                        left: 14.0, right: 14.0, top: 6.0, bottom: 4.0),
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        color: AppColors.tabColor),
                    labelPadding:
                        const EdgeInsets.only(left: 4.0, right: 4.0),
                    indicatorPadding: const EdgeInsets.all(0),
                     controller: _loginController.tabController,
                     onTap: (index){
                      print("indexxxx=${index}");
                      _loginController.tabController.index = index;
                     },
                    tabs: [
                      Tab(
                        height: 30.0,
                        iconMargin: EdgeInsets.zero,
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            child: Text(
                              'ads'.tr,
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        height: 30.0,
                        iconMargin: EdgeInsets.zero,
                        child: Container(
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              child: Text(
                                'advertisers'.tr,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        height: 30.0,
                        iconMargin: EdgeInsets.zero,
                        child: Container(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'coupons'.tr,
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
              Expanded(
                child: TabBarView(
                    controller: _loginController.tabController,
                    children: [
                  /*Navigator(
                    key: controller.navigatorKey,
                    onGenerateRoute: (routeSettings) {
                      return MaterialPageRoute(
                        builder: (context) => AdvertisingPage(
                          onSheetClicked: (x){
                            this.onSheetClicke!(x);
                          },
                          onAdveriseItemClicked: (x){
                            print("ItemClicked=$x");
                           // _addVideoWithTitleOverlay(context);
                            this.onAdveriseItemClicked!(x);
                          },
                        ),
                      );
                    },
                  ),*/
                      AdvertisingPage(
                        onSheetClicked: (x){
                          this.onSheetClicke!(x);
                        },
                        onAdveriseItemClicked: (x){
                          print("ItemClicked=$x");
                          // _addVideoWithTitleOverlay(context);
                          this.onAdveriseItemClicked!(x);
                        },
                      ),
                  // RequestAdvertisePage(),
                  AdvertisersPage(),
                  /*CoponsPage(),*/
                  CoponsPage(),
                ]),
              ),
            ],
          ),
        ));

  }

}
