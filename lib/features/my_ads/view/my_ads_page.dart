import 'dart:io';

import 'package:advertisers/features/advertiser_order_details/controller/advertiser_order_details_controller.dart';
import 'package:advertisers/features/my_ads/controller/my_adds_controller.dart';
import 'package:advertisers/features/my_ads/widgets/slide_right_item.dart';
import 'package:advertisers/features/my_ads/widgets/slide_right_item_new.dart';
import 'package:advertisers/features/my_ads/widgets/slide_right_item_separation.dart';
import 'package:advertisers/features/my_ads/widgets/slide_right_items_wraper.dart';
import 'package:advertisers/features/my_ads/widgets/slide_right_items_wraper_one_item.dart';
import 'package:advertisers/features/my_comments_advertiser/controller/comments_controller.dart';
import 'package:advertisers/features/tajer_order_details/controller/tajer_order_details_controller.dart';

import 'package:advertisers/features/wallet_module/widgets/processes_widgets/processes_widget.dart';
import 'package:advertisers/features/wallet_module/widgets/shipping_widgets/shipping_widget.dart';
import 'package:advertisers/shared/advertisers_appbar/advertisers_app_bar.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';

class MyAdsPage extends GetWidget<MyAddsController>  {

  final MyAddsController  controller = Get.put(MyAddsController());

  MyAdsPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyAddsController>(
        init: MyAddsController(),
        builder: (controller) => Scaffold(
              appBar:  PreferredSize(
                child:  AppBarWidget(
                  isSideMenu: false,
                  isSearchBar: true,
                  isNotification: false,
                  isBack: true,
                  searchBarBigRight: false,
                ),
                preferredSize:  Size(
                    MediaQuery.of(context).size.width,
                    90.0
                ),
              ),
              body: Container(
        child: Column(
          children: [
            /// header
            Padding(
              padding: const EdgeInsets.symmetric(vertical:10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:20.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xff4184CE),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Padding(
                        padding:   EdgeInsets.symmetric(vertical:4.0,horizontal: MediaQuery.of(context).size.width*.09),
                        child: Text("اعلاناتى",
                          style: TextStyle(
                              fontSize: 14.sp,
                              color:   Colors.white,
                              fontFamily: 'A Jannat LT, Regular'
                          ),),
                      ),
                    ),
                  ),


                ],
              ),
            ),
            Expanded(
              child: Container(
                child: SmartRefresher(
                  controller: controller.refreshController,
                  enablePullUp: true,
                  onRefresh: () async {
                      /*final result = await*/ controller.getAdsData(isRefresh: true);
                      if (controller.addsList.isNotEmpty) {
                        controller.refreshController.refreshCompleted();
                      } else {
                        controller.refreshController.refreshFailed();
                      }
                    },
                  onLoading: () async {
                      /*final result = await*/ controller.getAdsData();
                      if (controller.addsList.isNotEmpty) {
                        controller.refreshController.loadComplete();
                      } else {
                        controller.refreshController.loadFailed();
                      }
                    },
                  child: ListView(
                      controller: controller.scrollController,
                      children: [
                        GetBuilder<MyAddsController>(
                          init: MyAddsController(),
                          builder: (controller) => ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                             shrinkWrap: true,
                             itemCount: controller.addsList.length,
                            itemBuilder: (context, index) {
                              //controller.addsList[index].bill_total??0;
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10, right: 5, left: 5),
                                child: GestureDetector(
                                  onTap: () {
                                    controller.currentIndex.value = index;
                                    //controller.closeSingleItemFromCheckListFunctions(controller.orders![index].id);
                                    if (controller.currentIndex.value  == index) {
                                      controller.closeSingleItemFromCheckListFunctions(
                                          controller.addsList[index].id);
                                    }
                                  },
                                  onPanUpdate: (details) {
                                    controller.currentIndex.value  = index;
                                    // Swiping in right direction.
                                    if (details.delta.dx > 0) {
                                      // controller.closeSingleItemFromCheckListFunctions(orders![index].id);
                                      if (controller.currentIndex.value  == index) {
                                        controller.closeSingleItemFromCheckListFunctions(
                                            controller.addsList[index].id);
                                        print("Dragging in +X direction");
                                      }
                                    }

                                    // Swiping in left direction.
                                    if (details.delta.dx < 0) {
                                      if (controller.currentIndex.value  == index) {
                                        print("Dragging in -X direction");
                                        //controller.openSingleItemFromCheckListFunctions(orders![index].id);
                                        controller.openSingleItemFromCheckListFunctions(
                                            controller.addsList[index].id);
                                      }
                                    }
                                  },
                                  child: Stack(
                                    children: [
                                      Card(
                                        elevation: 5,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(right: 18),
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 165.sp,
                                                padding: const EdgeInsets.all(8),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                          "${controller.addsList[index].id}",
                                                          style: TextStyle(
                                                              decoration:
                                                                  TextDecoration.underline,
                                                              fontSize: 15.sp,
                                                              color: Color(0xff4B4B95)),
                                                        ),
                                                        Text(
                                                          "${controller.addsList[index].startedAt}",
                                                          style: TextStyle(
                                                              fontSize: 15.sp,
                                                              color: Color(0xff888888)),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            controller.currentIndex.value=index;
                                                            if (controller.currentIndex.value  == index) {
                                                              controller
                                                                  .addAndRemoveOtherFromCheckListShare(
                                                                      controller
                                                                          .addsList![
                                                                              index]
                                                                          .id);
                                                              print(
                                                                  "controller.checkList == > ${controller.checkListShare} ${controller.checkListShare!.contains(controller.addsList![index].id)}");
                                                            }
                                                          },
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(5.0),
                                                            child: Row(
                                                              children: [
                                                                Container(
                                                                  height: 6,
                                                                  width: 6,
                                                                  decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            50),
                                                                      gradient: LinearGradient(colors: [Color(0xff427AD0),Color(0xff48DBE1)],begin: Alignment.bottomCenter,end: Alignment.topCenter,)
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 8,
                                                                ),
                                                                Container(
                                                                  height: 6,
                                                                  width: 6,
                                                                  decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            50),
                                                                      gradient: LinearGradient(colors: [Color(0xff427AD0),Color(0xff48DBE1)],begin: Alignment.bottomCenter,end: Alignment.topCenter,)

                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 8,
                                                                ),
                                                                Container(
                                                                  height: 6,
                                                                  width: 6,
                                                                  decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            50),
                                                                      gradient: LinearGradient(colors: [Color(0xff427AD0),Color(0xff48DBE1)],begin: Alignment.bottomCenter,end: Alignment.topCenter,)

                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        )
                                                       ],
                                                    ),
                                                    const SizedBox(
                                                      height: 12,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      children: [
                                                        // SizedBox(
                                                        //   width: 200,
                                                        // ),
                                                        Column(
                                                          children: [
                                                            InkWell(
                                                              onTap: () {
                                                                print("person333");
                                                              },
                                                              child: ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          10),
                                                                  child: Image.network(
                                                                    controller.addsList[index].user?.image ?? '',
                                                                    height: 68,width: 68,fit: BoxFit.fill,errorBuilder: (context,object,err){
                                                                      return Image.asset('images/man img2.png',height: 68,width: 68,fit: BoxFit.fill);
                                                                  },
                                                                  )),
                                                            ),
                                                            SizedBox(
                                                              height: controller
                                                                      .checkListFunctions!
                                                                      .contains(controller
                                                                          .addsList[
                                                                              index]
                                                                          .id)
                                                                  ? 25.h
                                                                  : 0,
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          width: 15,
                                                        ),
                                                        controller.checkListFunctions!
                                                                .contains(controller
                                                                    .addsList[index]
                                                                    .id)
                                                            ? Container()
                                                            : Expanded(
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment.start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Row(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Expanded(
                                                                            child: Text(
                                                                          controller.addsList[index].user?.username ?? '',
                                                                          style: TextStyle(
                                                                            fontFamily: 'A Jannat LT, Regular',
                                                                              fontSize: 13.sp,
                                                                              color:const Color(
                                                                                  0xffD37A47),
                                                                              height: 1.4),
                                                                        )),
                                                                        InkWell(
                                                                          onTap: (){
                                                                           /* Get.put(TajerOrderDetailsController()).requestId=int.parse(controller.addsList[index].id.toString() );
                                                                            Get.put(TajerOrderDetailsController()).fetchOderDetails(requestId: controller.addsList[index].id);
                                                                            Get.put(TajerOrderDetailsController()).getTajerData(id: controller.addsList[index].id);*/
                                                                            Get.toNamed('/TajerOrderDetails?requestId=${controller.addsList[index].id}');
                                                                          },
                                                                          child: Text( 'تفاصيل الطلب',
                                                                            style: TextStyle(
                                                                              decoration: TextDecoration.underline,
                                                                                fontFamily: 'A Jannat LT, Regular',
                                                                                fontSize: 13.sp,
                                                                                color:const  Color(0xff244094),
                                                                                height:
                                                                                    1.5),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Text(controller.addsList[index].type ?? '',
                                                                     // 'منتجات غذائية',
                                                                      style: TextStyle(
                                                                          fontFamily: 'A Jannat LT, Regular',
                                                                          fontSize: 12.sp,
                                                                          color:const Color(
                                                                              0xff244094)),
                                                                    ),

                                                                    Text(
                                                                      //   "نوع المنتج /  ${controller.addsList[index].product_type?.name ?? ''}",
                                                                      'الرياض - حي الياسمين',
                                                                      style: TextStyle(
                                                                          fontFamily: 'A Jannat LT, Regular',
                                                                          fontSize: 10.sp,
                                                                          color:const Color(0xff244094)),
                                                                    ),

                                                                    Padding(
                                                                      padding: const EdgeInsets.only(top:14.0),
                                                                      child: Text(
                                                                         controller.addsList[index].description??"",
                                                                       // 'تغطية كاملة مع الحضور لافتتاح الفرع لجديد',
                                                                        style: TextStyle(
                                                                            fontSize: 11.sp,
                                                                            color:const Color(
                                                                                0xff888888)),
                                                                        maxLines: 1,
                                                                        overflow: TextOverflow
                                                                            .ellipsis,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                height: 1,
                                                color: Color(0xffBBBBBB66),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                decoration: const BoxDecoration(
                                                  borderRadius: BorderRadius.only(
                                                    bottomLeft: Radius.circular(15.0),
                                                    bottomRight: Radius.circular(15.0),
                                                  ),
                                                  color: Color(0xffF5F5F5),
                                                ),
                                                padding: const EdgeInsets.only(
                                                    right: 8, left: 8, bottom: 5, top: 5),
                                                child: Row(
                                                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    controller.addsList[index].statusTxt=="العرض موقوف"||
                                                    controller.addsList[index].statusTxt=="موقوف"?
                                                    Padding(
                                                      padding: const EdgeInsets.only(
                                                          right: 15),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.only(top:8.0),
                                                            child: Text(
                                                                "${controller.addsList[index].statusTxt?? ''}",
                                                              /*"العرض موقوف",*/
                                                              style: TextStyle(
                                                                  fontSize: 14.sp,
                                                                  color:   const Color(0xffFFB300),
                                                                  fontFamily: 'A Jannat LT, Regular'
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(top:8.0,left: 12),
                                                            child: SvgPicture.asset(  'images/hand.svg' ,
                                                              width: 50,
                                                              height: 30,
                                                              fit: BoxFit.fill,
                                                            ),
                                                          ),



                                                        ],
                                                      ),
                                                    )
                                                        :controller.addsList[index].statusTxt=="العرض منتهي"||
                                                        controller.addsList[index].statusTxt=="منتهي"?
                                                    Padding(
                                                      padding: const EdgeInsets.only(
                                                          right: 15),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [



                                                          Text( controller.addsList[index].statusTxt??"",
                                                            style: TextStyle(
                                                                fontSize: 14.sp,
                                                                color:   const Color(0xffD80000),
                                                                fontFamily: 'A Jannat LT, Regular'
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(top:8.0,left: 12),
                                                            child: SvgPicture.asset('images/delete_employee.svg',
                                                              width: 50,
                                                              height: 30,
                                                              fit: BoxFit.fill,
                                                            ),
                                                          ),
                                                        ],
                                                      ),



                                                    )

                                                    :Padding(
                                                      padding: const EdgeInsets.only(
                                                          right: 15),
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Text(
                                                            controller.addsList[index].statusTxt??"",
                                                            style: TextStyle(
                                                               fontFamily: 'A Jannat LT, Regular',
                                                                fontSize: 14.sp,
                                                                color: Color(0xff097534),
                                                                height: 1.5),
                                                          ),
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              SvgPicture.asset('images/save img.svg',
                                                                fit: BoxFit.fill,
                                                                height: 17.0,
                                                                width: 11.0,),

                                                              Container(width: 10,),
                                                              Image.asset('images/speaker2.png',
                                                                fit: BoxFit.fill,
                                                                height: 35.0,
                                                                width: 28.0,),


                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),

                                                    InkWell(
                                                      onTap: (){
                                                        Get.put(CommentsController()).commentsList.clear();
                                                        Get.put(CommentsController()).adsId.value=controller.addsList[index].id??0;
                                                        Get.put(CommentsController()).getCommentsData(id: controller.addsList[index].id);
                                                         Get.toNamed('/CommentsPage');
                                                      },
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Image.asset('images/comments2.png',height: 13,width: 17,fit: BoxFit.fill,),
                                                          Container(width: 10,),
                                                          Container(
                                                            child: Text('${controller.addsList[index].comments??""}',
                                                              style:const TextStyle(decoration: TextDecoration.underline,color: Color(0xff041D67),fontFamily: 'A Jannat LT, Regular',fontSize: 12),),
                                                          ),
                                                        ],
                                                      ),
                                                    ),



                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Image.asset('images/eye-open2.png',height: 13,width: 17,fit: BoxFit.fill,),
                                                        Container(width: 10,),
                                                        Container(
                                                          child: Text('${controller.addsList[index].views??""}',
                                                            style:const TextStyle(decoration: TextDecoration.underline,color: Color(0xff041D67),fontFamily: 'A Jannat LT, Regular',fontSize: 12),),
                                                        ),
                                                      ],
                                                    ),


                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 45,
                                        right: MediaQuery.of(context).size.width * .73,
                                        left: 10,
                                        bottom: controller.checkListShare!.contains(
                                                controller.addsList[index].id)
                                            ? 15
                                            : double.infinity,
                                        child: controller.checkListShare!.contains(
                                                controller.addsList[index].id)
                                            ?
                                            // AnimatedContainer(
                                            //   duration: const Duration(milliseconds: 500),
                                            FadeInDown(
                                                child: Container(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.spaceEvenly,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                    children: [
                                                      InkWell(
                                                        onTap: ()async {
                                                          // controller.currentIndex.value=index;
                                                          // if(controller.currentIndex.value==index) {
                                                          //   await openwhatsapp(context,
                                                          //       controller
                                                          //           .addsList[index]
                                                          //           .advertiser?.whatsapp);
                                                          // }
                                                          },
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment.center,
                                                          children: [
                                                            Container(
                                                              padding: EdgeInsets.symmetric(
                                                                  horizontal: 15,
                                                                  vertical: 10),
                                                              decoration: const BoxDecoration(
                                                                color: Colors.white54,
                                                                borderRadius:
                                                                    BorderRadius.all(
                                                                  Radius.circular(10.0),
                                                                ),
                                                              ),
                                                              child: Center(
                                                                child: FaIcon(
                                                                  FontAwesomeIcons.whatsapp,
                                                                  color: Color(0xff148253),
                                                                  size: 35.sp,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () {},
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment.center,
                                                          children: [
                                                            Container(
                                                              padding: EdgeInsets.symmetric(
                                                                  horizontal: 15,
                                                                  vertical: 12),
                                                              decoration: const BoxDecoration(
                                                                color: Colors.white54,
                                                                borderRadius:
                                                                    BorderRadius.all(
                                                                  Radius.circular(10.0),
                                                                ),
                                                              ),
                                                              child: Center(
                                                                child: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .commentDots,
                                                                  color: Colors.white,
                                                                  size: 35.sp,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  // color: Colors.black45,
                                                  decoration: const BoxDecoration(
                                                    gradient: LinearGradient(
                                                        begin: Alignment.topRight,
                                                        end: Alignment.bottomRight,
                                                        colors: [
                                                          Color(0xff6fd3de),
                                                          Color(0xff486ac7),
                                                        ]),
                                                    borderRadius: BorderRadius.all(
                                                      Radius.circular(10.0),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : Container(),
                                      ),
                                      Positioned(
                                        top: 3,
                                        right: 0,
                                        bottom: 3,
                                        // left: controller.checkListFunctions!.contains(orders![index].id) ? MediaQuery.of(context).size.width * .3 :double.infinity ,
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 400),
                                          width: controller.checkListFunctions!.contains(
                                                  controller.addsList[index].id)
                                              ? MediaQuery.of(context).size.width * .7
                                              : 0,
                                          curve: Curves.fastOutSlowIn,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(10.0),
                                              topRight: Radius.circular(10.0),
                                            ),
                                            gradient: LinearGradient(
                                                begin: Alignment.topRight,
                                                end: Alignment.bottomRight,
                                                colors: [
                                                  Color(0xff6fd3de),
                                                  Color(0xff486ac7),
                                                ]),
                                          ),
                                          child: Container(
                                            padding: EdgeInsets.all(15),
                                            child: controller.checkListFunctions!.contains(
                                                    controller.addsList[index].id)
                                                ? Row(
                                                    children: [
                                                      Expanded(
                                                        child: SlideRightItemsWraper(
                                                          firstWidget: Obx(
                                                            () => SlideRightItemWidget(
                                                            isSvg: true,
                                                            title: "عرض بروفايل",
                                                            icon: controller.addsList[index].showProfile!=null&& controller.addsList[index].showProfile==0?"images/new open eye.svg":"images/new closed eye.svg",
                                                            iconWidth: 20.sp,
                                                            iconHeight: 11.7.sp,
                                                            widgetOpacity:/* controller
                                                                        .addsList[
                                                                            index]
                                                                        .statuses
                                                                        ?.confirm_pricing ==
                                                                    false
                                                                ? 0.4
                                                                : */1,
                                                            checkOpacity: 0,
                                                            onPress: (){
                                                              controller.showOnProfile(id: controller.addsList[index].id);
                                                              controller.update();
                                                            },
                                                          ),
                                                          ),
                                                          secondWidget: SlideRightItemWidget(
                                                            isSvg: true,
                                                            title: "تعديل الاعلان",
                                                            // onPress: controller
                                                            //             .addsList[
                                                            //                 index]
                                                            //             .statuses
                                                            //             ?.edit ==
                                                            //         false
                                                            //     ? null
                                                            //     : () {
                                                            //   controller.currentIndex.value=index;
                                                            //   if (controller.currentIndex.value  == index) {
                                                            //     Get.toNamed('/AdvertiserDetailsPage?requestId=${controller.addsList[index].id}');
                                                            //         }
                                                            //       },
                                                            icon: "images/new edit.svg",
                                                            iconWidth: 27.sp,
                                                            iconHeight: 21.sp,
                                                            widgetOpacity: /*controller
                                                                      .addsList[
                                                                          index]
                                                                      .statuses
                                                                      ?.edit ==
                                                                  false
                                                              ? 0.4
                                                              : */1,
                                                            checkOpacity: 0,
                                                          ),
                                                        ),
                                                      ),
                                                    //  SlideRightItemsSeparation(),
                                                      Expanded(
                                                          child: SlideRightItemsWraper(
                                                            firstWidget:
                                                            Obx(
                                                                  () =>SlideRightItemWidget(
                                                              isSvg: true,
                                                              title: "عرض      منصة",
                                                              icon: controller.addsList[index].showApp!=null&& controller.addsList[index].showApp==0?"images/new open eye.svg":"images/new closed eye.svg",
                                                              iconWidth: 20.sp,
                                                              iconHeight: 11.7.sp,
                                                              widgetOpacity:/* controller
                                                                        .addsList[
                                                                            index]
                                                                        .statuses
                                                                        ?.confirm_pricing ==
                                                                    false
                                                                ? 0.4
                                                                : */1,
                                                              checkOpacity: 0,
                                                              onPress: (){
                                                                controller.showOnApp(id: controller.addsList[index].id);
                                                              },
                                                            ),
                                                            ),
                                                            secondWidget: SlideRightItemWidget(
                                                              isSvg: true,
                                                              title: "حذف   الإعلان",
                                                              onPress:(){
                                                                Get.defaultDialog(
                                                                    title: "هل تريد حذف هذا الاعلان !",
                                                                    content: Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                      children: [
                                                                        InkWell(
                                                                          onTap: (){
                                                                            controller.deleteAnAds(id: controller.addsList[index].id);
                                                                            Get.back();
                                                                          },
                                                                          child: Container(
                                                                            width: 80,
                                                                            decoration: BoxDecoration(
                                                                              color: Colors.red,
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                            child: const Padding(
                                                                              padding:  EdgeInsets.symmetric(horizontal:8.0,vertical: 4),
                                                                              child: Center(child: Text("نعم",style: TextStyle(color: Colors.white,fontSize: 12),)),
                                                                            ),
                                                                          ),
                                                                        ),

                                                                        InkWell(
                                                                          onTap: (){
                                                                            Get.back();
                                                                          },
                                                                          child: Container(
                                                                            width: 80,
                                                                            decoration: BoxDecoration(
                                                                              color: Colors.green,
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                            child: const Padding(
                                                                              padding:  EdgeInsets.symmetric(horizontal:8.0,vertical: 4),
                                                                              child: Center(child: Text("لا",style: TextStyle(color: Colors.white,fontSize: 12),)),
                                                                            ),
                                                                          ),
                                                                        ),

                                                                      ],),
                                                                    backgroundColor: Colors.white,
                                                                    titleStyle: const TextStyle(color: Colors.red,fontSize: 16),
                                                                    barrierDismissible: false
                                                                );
                                                              },
                                                              icon: "images/trash-bin-outline.svg",
                                                              iconWidth: 26.sp,
                                                              iconHeight: 22.sp,
                                                              widgetOpacity: /*controller
                                                                      .addsList[
                                                                          index]
                                                                      .statuses
                                                                      ?.edit ==
                                                                  false
                                                              ? 0.4
                                                              : */1,
                                                              checkOpacity: 0,
                                                            ),
                                                      )),
                                                     // SlideRightItemsSeparation(),
                                                      Expanded(
                                                          child: SlideRightItemsWraperOneItem(
                                                        firstWidget: SlideRightItemNewWidget(
                                                          isSvg: true,
                                                          title: "تحديث العرض",
                                                          viewNumber: "1",
                                                          onPress: (){
                                                            controller.repostAds(id: controller.addsList[index].id);
                                                          },
                                                          icon: "images/7.svg",
                                                          iconHeight: 15,
                                                          iconWidth: 15,
                                                          widgetOpacity: 1,
                                                          checkOpacity: 1,
                                                        ),
                                                      )),
                                                    ],
                                                  )
                                                : Container(),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 3,
                                        right: 0,
                                        bottom: 3,
                                        child: Container(
                                          width: 15,
                                          decoration: const BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.topRight,
                                                end: Alignment.bottomRight,
                                                colors: [
                                                  Color(0xff6fd3de),
                                                  Color(0xff486ac7),
                                                ],
                                              ),
                                              borderRadius: BorderRadius.only(
                                                bottomRight: const Radius.circular(10.0),
                                                topRight: const Radius.circular(10.0),
                                              )),
                                          child: Row(
                                            children: [
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Container(
                                                height: 45,
                                                width: 2,
                                                color: Colors.white,
                                              ),
                                              const SizedBox(
                                                width: 3,
                                              ),
                                              Container(
                                                height: 30,
                                                width: 2,
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                        ),
                      ],
                    ),
                ),
              ),
            ),
          ],
        ),
      ),
    )
    );
  }
}


