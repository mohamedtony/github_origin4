// import 'package:advertisers/advertiser_list_page/list_page.dart';
// import 'package:advertisers/blocked_users_page/AdvertiseBlockedUserItem.dart';
// import 'package:advertisers/client_setting_page/client_setting_page.dart';
// import 'package:advertisers/home_page/controller/home_navigation_controller.dart';
// import 'package:advertisers/home_page/view/pages/advertisers_person_page.dart';
// import 'package:advertisers/home_page/view/pages/advertising_page.dart';
// import 'package:advertisers/home_page/view/pages/copons_page.dart';
// import 'package:advertisers/home_page/app_colors.dart';
// import 'package:advertisers/home_page/view/widgets/advertiser_person_item.dart';
// import 'package:advertisers/home_page/view/widgets/copon_item.dart';
import 'package:advertisers/features/blocked_users_page/AdvertiseBlockedUserItem.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:advertisers/features/home_page/controller/home_navigation_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BlockedUsersPage extends StatelessWidget {
  BlockedUsersPage({Key? key}) : super(key: key);

  final HomeNavController _loginController = Get.put(HomeNavController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _loginController.onWillPop,
      child: GetBuilder<HomeNavController>(
          init: HomeNavController(),
          builder: (controller) => DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(70.0),
                  child: AppBar(
                    leading: SizedBox(),
                    /*leading: InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => *//*ListPage()*//*ClientSettingPage(),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10.0),
                        child: SvgPicture.asset(
                          'images/DrawerIcon.svg',
                          color: Colors.white,
                        ),
                      ),
                    ),*/
                   // leadingWidth: 56.0,
                    title: Container(
                      height: 38.0,
                      // alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 10.0,right: 10,left: 5),
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
                            suffixIcon: Container(
                              padding: EdgeInsets.all(10.0),
                              child: SvgPicture.asset(
                                'images/filter_icon.svg',
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
                          Get.back();
                        },
                        child: Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 10.0, top: 10.0),
                          child: SvgPicture.asset(
                            "images/back_button.svg",
                            height: 45,
                            width: 45,
                            // matchTextDirection: true,
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
                      color: AppColors.bottomSheetTabColor,
                      margin: EdgeInsets.only(bottom: 6.0),
                      shadowColor: Colors.grey[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      child: Container(
                        //margin: EdgeInsets.only(top: 10.0),
                        padding: EdgeInsets.all(8.0),
                        color: AppColors.bottomSheetTabColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 30.0,
                              width: 140.0,
                              //padding: EdgeInsets.all(8.0),
                              margin: EdgeInsets.only(right: 8.0),
                              child: Text('المحظورون'.tr,style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
                              decoration: BoxDecoration(

                                  borderRadius: BorderRadius.circular(6.0),
                                  color: AppColors.tabColor),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 15.0),
                              child: SvgPicture.asset(
                                'images/block_user.svg',
                                fit: BoxFit.fill,
                                height: 25.0,
                                width: 13.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, position) {
                          return  AdvertiseBlockedUserItem();
                        },
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}
