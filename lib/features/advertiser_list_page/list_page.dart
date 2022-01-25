
import 'package:advertisers/features/advertiser_list_page/advertise_list_controller.dart';
import 'package:advertisers/features/advertiser_list_page/advertiser_list_page.dart';
import 'package:advertisers/features/client_list_page/client_list_page.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ListPage extends StatelessWidget {
  ListPage({Key? key}) : super(key: key);
  var controller = Get.put(AdvertiseListController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
        preferredSize: Size.fromHeight(140.0),
        child: AppBar(
          leading: InkWell(
            onTap: (){
              controller.changeIndex(0);
            },
            child: Container(
              margin: EdgeInsets.only(right: 10.0),
              child: Obx(()=>SvgPicture.asset(
                controller.tabIndex.value==0?'images/right_clicked.svg':'images/list_icon.svg',
               // color: controller.tabIndex.value==0?Colors.transparent:Colors.white,
              )),
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

            InkWell(
                onTap: (){
               controller.changeIndex(1);
              },
              child: Obx(()=>controller.clientProfileModel.value.role!=null && controller.clientProfileModel.value.role =="advertiser"?Container(
                margin: EdgeInsets.only(left: 10.0),
                child: SvgPicture.asset(
                  controller.tabIndex.value==1?'images/left_clicked.svg':'images/left_notclicked.svg',
                  // color: Colors.white,
                ),
              ):Container(
                margin: EdgeInsets.only(left: 10.0),
                child: SvgPicture.asset(
                  controller.tabIndex.value==1?'images/left_clicked.svg':'images/left_notclicked.svg',
                  // color: Colors.white,
                ),
              ),)
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
              child:Obx(()=> controller.tabIndex.value==1?Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    width: 85,
                    height: 65,
                    decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: AppColors.tabColor
                      /*gradient:  const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [AppColors.beginColor, AppColors.endColor],
                      ),*/
                      /* boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300]!,
                          blurRadius: 20.0,
                          spreadRadius: 1.0,
                        )
                      ]*/
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

                                Obx(()=>Text('${controller.clientProfileModel.value.followers??''}',style: const TextStyle(color: Colors.white,fontSize: 18),),),
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
                      /* gradient:  const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [AppColors.beginColor, AppColors.endColor],
                      ),*/
                      /*boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300]!,
                          blurRadius: 20.0,
                          spreadRadius: 1.0,
                        )
                      ]*/
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Obx(()=>Text(controller.clientProfileModel.value.rate??'',style: const TextStyle(color: Colors.white,fontSize: 18),),),
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
                      /*gradient:  const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.white12, AppColors.endColor],
                      ),*/
                      /* boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300]!,
                          blurRadius: 20.0,
                          spreadRadius: 1.0,
                        )
                      ]*/
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Obx(()=>Text(controller.clientProfileModel.value.reply_speed??'',style: const TextStyle(color: Colors.white,fontSize: 18),),),
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
                      /*gradient:  const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [AppColors.beginColor, AppColors.endColor],
                      ),*/
                      /*boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300]!,
                          blurRadius: 20.0,
                          spreadRadius: 1.0,
                        )
                      ]*/
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Obx(()=>Text('${controller.clientProfileModel.value.ads_count??''}',style: const TextStyle(color: Colors.white,fontSize: 18),),),
                        Container(
                          // margin: EdgeInsets.only(bottom: 6.0),
                            child: Text("الاعلانات",style: const TextStyle(color: Colors.white,fontSize: 16),)),
                      ],
                    ),
                  ),
                ],
              ):
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    width: 85,
                    height: 65,
                    decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: AppColors.tabColor
                      /*gradient:  const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [AppColors.beginColor, AppColors.endColor],
                      ),*/
                      /* boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300]!,
                          blurRadius: 20.0,
                          spreadRadius: 1.0,
                        )
                      ]*/
                    ),
                    child: Container(
                      alignment:Alignment.topCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Obx(()=>Text('${controller.clientProfileModel.value.followers??''}',style: const TextStyle(color: Colors.white,fontSize: 18),),),
                          Text("المتابعين",style: const TextStyle(color: Colors.white,fontSize: 16),),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: 85,
                    height: 65,
                    decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: AppColors.tabColor
                      /* gradient:  const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [AppColors.beginColor, AppColors.endColor],
                      ),*/
                      /*boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300]!,
                          blurRadius: 20.0,
                          spreadRadius: 1.0,
                        )
                      ]*/
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Obx(()=>Text(controller.clientProfileModel.value.rate??'',style: const TextStyle(color: Colors.white,fontSize: 18),),),
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
                      /*gradient:  const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.white12, AppColors.endColor],
                      ),*/
                      /* boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300]!,
                          blurRadius: 20.0,
                          spreadRadius: 1.0,
                        )
                      ]*/
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Obx(()=>Text('${controller.clientProfileModel.value.wallet??''}',style: const TextStyle(color: Colors.white,fontSize: 18),),),
                        const Text("المحفظة",style: const TextStyle(color: Colors.white,fontSize: 16),),
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
                      /*gradient:  const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [AppColors.beginColor, AppColors.endColor],
                      ),*/
                      /*boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300]!,
                          blurRadius: 20.0,
                          spreadRadius: 1.0,
                        )
                      ]*/
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Obx(()=>Text('${controller.clientProfileModel.value.points??''}',style: const TextStyle(color: Colors.white,fontSize: 18),),),
                        const Text("النقاط",style: const TextStyle(color: Colors.white,fontSize: 16),),
                      ],
                    ),
                  ),
                ],
              ))
            /*TabBar(
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
                ]),*/
            /*ListView(
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

                      Text("title",style: const TextStyle(color: Colors.white,fontSize: 18),),
                      Text("name",style: const TextStyle(color: Colors.white,fontSize: 16),),
                    ],
                  ),
                ),
              ],
            )*/
          ),
        ),

      ),
      body:Obx(()=>IndexedStack(
        index: controller.tabIndex.value,
        children: [
          ClientListPage(),
          AdvertiserListPage(),

        ],
      )),
    );
  }
}
