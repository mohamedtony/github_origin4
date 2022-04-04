
import 'package:advertisers/features/advertiser_list_page/advertise_list_controller.dart';
import 'package:advertisers/features/advertiser_list_page/advertiser_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../main.dart';
//=========================================================================================

//                         By Mohamed T. Hammad

//=========================================================================================
class AdvertiserListPage extends StatelessWidget {
   AdvertiserListPage({Key? key}) : super(key: key);
   var controller = Get.put(AdvertiseListController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar:  PreferredSize(
        preferredSize: Size.fromHeight(140.0),
        child: AppBar(
          leading: Container(
            margin: EdgeInsets.only(right: 10.0),
            child: SvgPicture.asset(
              'images/list_icon.svg',
              color: Colors.white,
            ),
          ),
          leadingWidth: 56.0,
          title:      InkWell(
            onTap: (){
              Get.toNamed('/NotificationsPage');
            },
            child: Center(
              child: Container(
                padding: EdgeInsets.only(left: 20.0, right: 10.0),
                child: SvgPicture.asset(
                  'images/notification_icon.svg',
                  //color: Colors.white,
                ),
              ),
            ),
          ),
          actions: [

            Container(
              margin: EdgeInsets.only(left: 10.0),
              child: SvgPicture.asset(
                'images/ico_menu.svg',
                color: Colors.white,
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
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(75.0),
            child:Row(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  width: 85,
                  height: 65,
                  decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: AppColors.tabColor
                      *//*gradient:  const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [AppColors.beginColor, AppColors.endColor],
                      ),*//*
                     *//* boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300]!,
                          blurRadius: 20.0,
                          spreadRadius: 1.0,
                        )
                      ]*//*
                  ),
                  child: Stack(
                    children:[
                      Container(
                        margin: EdgeInsets.only(top: 4.0),
                        alignment:Alignment.topLeft,
                        child: SvgPicture.asset(
                          'images/Icon_material_stars.svg',
                          // color: Colors.white,
                          height: 14,
                          width: 14,
                        ),
                      ),
                      Container(
                        alignment:Alignment.topCenter,
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Text("12345",style: const TextStyle(color: Colors.white,fontSize: 18),),
                          Text("المتابعين",style: const TextStyle(color: Colors.white,fontSize: 16),),
                        ],
                    ),
                      ),]
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: 85,
                  height: 65,
                  decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: AppColors.tabColor
                     *//* gradient:  const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [AppColors.beginColor, AppColors.endColor],
                      ),*//*
                      *//*boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300]!,
                          blurRadius: 20.0,
                          spreadRadius: 1.0,
                        )
                      ]*//*
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Text("4.5",style: const TextStyle(color: Colors.white,fontSize: 18),),
                      Text("التقييم",style: const TextStyle(color: Colors.white,fontSize: 16),),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: 85,
                  height: 65,
                  decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: AppColors.tabColor
                      *//*gradient:  const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.white12, AppColors.endColor],
                      ),*//*
                     *//* boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300]!,
                          blurRadius: 20.0,
                          spreadRadius: 1.0,
                        )
                      ]*//*
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Text("4.5",style: const TextStyle(color: Colors.white,fontSize: 18),),
                      Text("سرعة الرد",style: const TextStyle(color: Colors.white,fontSize: 16),),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 8.0),
                  width: 85,
                  height: 65,
                  decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: AppColors.tabColor
                      *//*gradient:  const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [AppColors.beginColor, AppColors.endColor],
                      ),*//*
                      *//*boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300]!,
                          blurRadius: 20.0,
                          spreadRadius: 1.0,
                        )
                      ]*//*
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Text("547",style: const TextStyle(color: Colors.white,fontSize: 18),),
                      Container(
                       // margin: EdgeInsets.only(bottom: 6.0),
                          child: Text("الاعلانات",style: const TextStyle(color: Colors.white,fontSize: 16),)),
                    ],
                  ),
                ),
              ],
            )
            *//*TabBar(
              controller: controller.controller,
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
                tabs: [
                  Container(
                    child: Tab(
                      height: 60.0,
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
                  ),
                  Tab(
                    height: 60.0,
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
                    height: 60.0,
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
                ]),*//*
            *//*ListView(
              scrollDirection:  Axis.horizontal,
              shrinkWrap: true,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: 100,
                  height: 75,
                  decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient:  const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        colors: [AppColors.beginColor, AppColors.endColor],
                      ),
                      *//**//*boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300]!,
                          blurRadius: 20.0,
                          spreadRadius: 1.0,
                        )
                      ]*//**//*
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Text("title",style: const TextStyle(color: Colors.white,fontSize: 18),),
                      Text("name",style: const TextStyle(color: Colors.white,fontSize: 16),),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: 100,
                  height: 75,
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient:  const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [AppColors.beginColor, AppColors.endColor],
                    ),
                    *//**//*boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300]!,
                          blurRadius: 20.0,
                          spreadRadius: 1.0,
                        )
                      ]*//**//*
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Text("title",style: const TextStyle(color: Colors.white,fontSize: 18),),
                      Text("name",style: const TextStyle(color: Colors.white,fontSize: 16),),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: 100,
                  height: 75,
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient:  const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [AppColors.beginColor, AppColors.endColor],
                    ),
                    *//**//*boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300]!,
                          blurRadius: 20.0,
                          spreadRadius: 1.0,
                        )
                      ]*//**//*
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Text("title",style: const TextStyle(color: Colors.white,fontSize: 18),),
                      Text("name",style: const TextStyle(color: Colors.white,fontSize: 16),),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: 100,
                  height: 75,
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient:  const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [AppColors.beginColor, AppColors.endColor],
                    ),
                    *//**//*boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300]!,
                          blurRadius: 20.0,
                          spreadRadius: 1.0,
                        )
                      ]*//**//*
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Text("title",style: const TextStyle(color: Colors.white,fontSize: 18),),
                      Text("name",style: const TextStyle(color: Colors.white,fontSize: 16),),
                    ],
                  ),
                ),
              ],
            )*//*
          ),
        ),

      ),*/
      body:ListView(
        children: [
          AdvertiseListItem(icon: 'images/setting_icon.svg',title: 'اعدادات الحساب التجارى',listTilePressed: (){
            Get.toNamed('/AdvertiserSettingsPage');
          },),
          AdvertiseListItem(icon: 'images/menu_icon.svg',title: 'الطلبات',listTilePressed: (){
            Get.toNamed('/AdvertisingRequestsPage');
          },),
          AdvertiseListItem(icon: 'images/my_ads_icon.svg',title: 'اعلاناتى',listTilePressed: (){
            Get.toNamed('/MyAdsPage2');
          },),
          AdvertiseListItem(icon: 'images/discount_copon_img.svg',title: 'الخوصومات والكوبوناتي',listTilePressed: (){
            print('pressed2');
            Get.toNamed('/AdvertisersCopons');
           // Get.toNamed('/DiscountPage');
          },),
          AdvertiseListItem(icon: 'images/gallery_icon.svg',title: 'المعرض',listTilePressed: (){
            print('pressed2');
          },),
          AdvertiseListItem(icon: 'images/report_icon.svg',title: 'التقارير',listTilePressed: (){
            print('pressed2');
          },),
          AdvertiseListItem(icon: 'images/person_icon.svg',title: 'الموظفين',listTilePressed: (){
            Get.toNamed('/EmployeesPage');
          },),
          AdvertiseListItem(icon: 'images/subscribe_icon.svg',title: 'الاشتراكات',listTilePressed: (){
            print('pressed2');
          },),
          AdvertiseListItem(icon: 'images/manage_icon.svg',title: 'ادارة حسابات المعلنين',listTilePressed: (){
            print('pressed2');
          },),
          AdvertiseListItem(icon: 'images/logout_icon.svg',title: 'خروج',listTilePressed: () async {
            // await storage.remove("data");
            // await storage.remove("token");
            await storage.erase();
            Get.offAllNamed('/loginPage');
            print('pressed2');
          },),
        ],
      ),
    );
  }
}
