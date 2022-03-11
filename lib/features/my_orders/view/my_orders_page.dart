import 'dart:io';

import 'package:advertisers/features/my_orders/controller/my_orders_controller.dart';
import 'package:advertisers/features/my_orders/widgets/slide_right_item.dart';
import 'package:advertisers/features/my_orders/widgets/slide_right_item_separation.dart';
import 'package:advertisers/features/my_orders/widgets/slide_right_items_wraper.dart';
import 'package:advertisers/features/users_module/app_colors.dart';
import 'package:advertisers/features/wallet_module/widgets/processes_widgets/processes_widget.dart';
import 'package:advertisers/features/wallet_module/widgets/shipping_widgets/shipping_widget.dart';
import 'package:advertisers/shared/advertisers_appbar/advertisers_app_bar.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';

class MyOrdersPage extends StatefulWidget {
  MyOrdersPage({Key? key}) : super(key: key);

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage>
    with SingleTickerProviderStateMixin {
  // final MyOrdersController _MyOrdersController = Get.put(MyOrdersController());
  //int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: InkWell(
          onTap: () {},
          child: Image.asset(
            "images/my_orders_floating_button.png",
            height: 100,
          )),
      // appBar:  PreferredSize(
      //   child:  AppBarWidget(
      //     isSideMenu: false,
      //     isSearchBar: true,
      //     isNotification: false,
      //     isBack: true,
      //     searchBarBigRight: false,
      //   ),
      //   preferredSize:  Size(
      //       MediaQuery.of(context).size.width,
      //       90.0
      //   ),
      // ),
      body: GetBuilder<MyOrdersController>(
        init: MyOrdersController(),
        builder: (controller) => SmartRefresher(
          controller: controller.refreshController,
          enablePullUp: true,
          onRefresh: () async {
            final result = await controller.getRequestsData(isRefresh: true);
            if (result) {
              controller.refreshController.refreshCompleted();
            } else {
              controller.refreshController.refreshFailed();
            }
          },
          onLoading: () async {
            final result = await controller.getRequestsData();
            if (result) {
              controller.refreshController.loadComplete();
            } else {
              controller.refreshController.loadFailed();
            }
          },
          child: ListView.builder(
              //physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              //itemCount: orders!.length,
              itemCount: controller.myRequestsAsClient.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10, right: 5, left: 5),
                  child: GestureDetector(
                    onTap: () {
                      controller.currentIndex.value = index;
                      //controller.closeSingleItemFromCheckListFunctions(controller.orders![index].id);
                      if (controller.currentIndex.value  == index) {
                        controller.closeSingleItemFromCheckListFunctions(
                            controller.myRequestsAsClient[index].id);
                      }
                    },
                    onPanUpdate: (details) {
                      controller.currentIndex.value  = index;
                      // Swiping in right direction.
                      if (details.delta.dx > 0) {
                        // controller.closeSingleItemFromCheckListFunctions(orders![index].id);
                        if (controller.currentIndex.value  == index) {
                          controller.closeSingleItemFromCheckListFunctions(
                              controller.myRequestsAsClient[index].id);
                          print("Dragging in +X direction");
                        }
                      }

                      // Swiping in left direction.
                      if (details.delta.dx < 0) {
                        if (controller.currentIndex.value  == index) {
                          print("Dragging in -X direction");
                          //controller.openSingleItemFromCheckListFunctions(orders![index].id);
                          controller.openSingleItemFromCheckListFunctions(
                              controller.myRequestsAsClient[index].id);
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
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${controller.myRequestsAsClient[index].id}",
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                fontSize: 15.sp,
                                                color: Color(0xff4B4B95)),
                                          ),
                                          Text(
                                            "${controller.myRequestsAsClient[index].created_at}",
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
                                                            .myRequestsAsClient![
                                                                index]
                                                            .id);
                                                print(
                                                    "controller.checkList == > ${controller.checkListShare} ${controller.checkListShare!.contains(controller.myRequestsAsClient![index].id)}");
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
                                          // Text("تفاصيل الطلب",style: TextStyle( decoration: TextDecoration.underline,fontSize: 15.sp,color: Color(0xff244094)),),
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
                                                  print("person");
                                                },
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Image.network(
                                                      "${controller.myRequestsAsClient[index].advertiser?.image ?? ''}",
                                                      height: 70,errorBuilder: (context,object,err){
                                                        return Image.asset('images/no_image_available.png',height: 70);
                                                    },
                                                    )),
                                              ),
                                              SizedBox(
                                                height: controller
                                                        .checkListFunctions!
                                                        .contains(controller
                                                            .myRequestsAsClient[
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
                                                      .myRequestsAsClient[index]
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
                                                            "${controller.myRequestsAsClient[index].advertiser?.username ?? ''}",
                                                            style: TextStyle(
                                                                fontSize: 17.sp,
                                                                color: Color(
                                                                    0xff000000),
                                                                height: 1.4),
                                                          )),
                                                          Padding(
                                                            padding: const EdgeInsets.only(top:8.0),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  controller
                                                                          .myRequestsAsClient[
                                                                              index]
                                                                          .bill_total
                                                                          ?.toStringAsFixed(
                                                                              2) ??
                                                                      '',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16.sp,
                                                                      color: Color(
                                                                          0xffD37A47),
                                                                      height:
                                                                          1.5),
                                                                ),
                                                                Text(
                                                                  "ريال",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15.sp,
                                                                      color: Color(
                                                                          0xffD37A47),
                                                                      height:
                                                                          1.1),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Text(
                                                        "نوع المنتج /  ${controller.myRequestsAsClient[index].product_type?.name ?? ''}",
                                                        style: TextStyle(
                                                            fontSize: 14.sp,
                                                            color: Color(
                                                                0xff4B4B95)),
                                                      ),
                                                      Text(
                                                        "${controller.myRequestsAsClient[index].status_txt}",
                                                        style: TextStyle(
                                                            fontSize: 14.sp,
                                                            color: Color(
                                                                0xff888888)),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap:(){
                                              if(controller.myRequestsAsClient[index].status_txt=="تم التسعير"){
                                             Get.toNamed("/CustomerOrderInvoicePage?billId=${controller.myRequestsAsClient[index].id}&phone=${controller.myRequestsAsClient[index].advertiser?.phone}&"
                                                 "whatsapp=${controller.myRequestsAsClient[index].advertiser?.whatsapp}");
                                }},
                                            child: Card(
                                              elevation: 5,
                                              color: Colors.white,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: SvgPicture.asset(
                                                  "images/sheet.svg",
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                              onTap: controller
                                                          .myRequestsAsClient[
                                                              index]
                                                          .status_txt ==
                                                      "مرفوض من المعلن"
                                                  ? () {
                                                controller.currentIndex.value=index;
                                                if (controller.currentIndex.value  ==
                                                          index) {
                                                        Get.toNamed(
                                                            "/ReasonRejectingAdvertisement?requestId=${controller.myRequestsAsClient[index].id}&"
                                                                "phone=${controller.myRequestsAsClient[index].advertiser?.phone}&whatsapp${controller.myRequestsAsClient[index].advertiser?.whatsapp}");
                                                      }
                                                    }:
                                              controller
                                                  .myRequestsAsClient[
                                              index]
                                                  .status_txt ==
                                                  "مرفوض منى"
                                                  ? () {
                                                controller.currentIndex.value=index;
                                                if (controller.currentIndex.value  ==
                                                    index) {
                                                  Get.toNamed(
                                                      "/ReasonRejectingAdvertisementCustomer?requestId=${controller.myRequestsAsClient[index].id}&"
                                                          "phone=${controller.myRequestsAsClient[index].advertiser?.phone}&whatsapp${controller.myRequestsAsClient[index].advertiser?.phone}");
                                                }
                                              }:null,
                                              child: Text(
                                                controller
                                                        .myRequestsAsClient[
                                                            index]
                                                        .status_txt ??
                                                    '',
                                                style: TextStyle(
                                                    fontSize: 15.sp,
                                                    color: Color(0xffD37A47),
                                                    height: 1.5),
                                              )),
                                          const SizedBox(
                                            width: 1,
                                          ),
                                        ],
                                      )),
                                      Container(
                                        height: 40,
                                        width: 1,
                                        color: Colors.black54,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 15),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.toNamed('/AdvertiserDetailsPage?requestId=${controller.myRequestsAsClient[index].id}');
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: Text(
                                            "تفاصيل الطلب",
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                fontSize: 15.sp,
                                                color: Color(0xff244094),
                                                height: 1.5),
                                          ),
                                        ),
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
                                  controller.myRequestsAsClient[index].id)
                              ? 15
                              : double.infinity,
                          child: controller.checkListShare!.contains(
                                  controller.myRequestsAsClient[index].id)
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
                                            controller.currentIndex.value=index;
                                            if(controller.currentIndex.value==index) {
                                              await openwhatsapp(context,
                                                  controller
                                                      .myRequestsAsClient[index]
                                                      .advertiser?.whatsapp);
                                            }},
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
                                    controller.myRequestsAsClient[index].id)
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
                                      controller.myRequestsAsClient[index].id)
                                  ? Row(
                                      children: [
                                        Expanded(
                                          child: SlideRightItemsWraper(
                                            firstWidget: SlideRightItemWidget(
                                              isSvg: true,
                                              title: "دفع",
                                              onPress: controller
                                                          .myRequestsAsClient[
                                                              index]
                                                          .statuses
                                                          ?.payment ==
                                                      false
                                                  ? null
                                                  : () {
                                                controller.currentIndex.value=index;
                                                if (controller.currentIndex.value  ==
                                                          index) {
                                                        print("money");
                                                      }
                                                    },
                                              icon:
                                                  "images/dollar-bill-line.svg",
                                              widgetOpacity: controller
                                                          .myRequestsAsClient[
                                                              index]
                                                          .statuses
                                                          ?.payment ==
                                                      false
                                                  ? 0.4
                                                  : 1,
                                              checkOpacity: 0,
                                            ),
                                            secondWidget: Center(
                                              child: Center(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: SlideRightItemWidget(
                                                    isSvg: true,
                                                    title: "رفض",
                                                    onPress: controller
                                                                .myRequestsAsClient[
                                                                    index]
                                                                .statuses
                                                                ?.reject ==
                                                            false
                                                        ? null
                                                        : () {
                                                      controller.currentIndex.value=index;
                                                      if (controller.currentIndex.value  ==
                                                                index) {
                                                              CoolAlert.show(
                                                                  context: context,
                                                                  title:
                                                                      "رفض التسعير",
                                                                  type: CoolAlertType
                                                                      .info,
                                                                  //text: "Your transaction was successful!",
                                                                  widget: SizedBox(
                                                                    width: 323.w,
                                                                    height: 250.h,
                                                                    child:
                                                                        TextFormField(
                                                                      maxLines: 20,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              14.sp,
                                                                          fontFamily:
                                                                              'Arabic-Regular'),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      // onChanged: (val){
                                                                      //
                                                                      // },
                                                                      decoration:
                                                                          InputDecoration(
                                                                        contentPadding: EdgeInsets.symmetric(
                                                                            vertical:
                                                                                5.0.h,
                                                                            horizontal:
                                                                                10.w),
                                                                        // suffixIcon:prefix??const SizedBox(width: 0,),
                                                                        border: OutlineInputBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(12
                                                                                    .h),
                                                                            borderSide:
                                                                                BorderSide(
                                                                                    color: AppColors.borderfayrozy)),
                                                                        filled: true,

                                                                        disabledBorder: OutlineInputBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(12
                                                                                    .h),
                                                                            borderSide:
                                                                                BorderSide(
                                                                                    color: AppColors.borderfayrozy)),
                                                                        enabledBorder: OutlineInputBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(12
                                                                                    .h),
                                                                            borderSide:
                                                                                BorderSide(
                                                                                    color: AppColors.borderfayrozy)),
                                                                        focusColor:
                                                                            AppColors
                                                                                .borderfayrozy,
                                                                        fillColor:
                                                                            AppColors
                                                                                .whiteColor,
                                                                        hintStyle: TextStyle(
                                                                            color: AppColors
                                                                                .greyColor,
                                                                            fontSize:
                                                                                15.sp),
                                                                        hintText:
                                                                            'سبب الرفض',
                                                                      ),
                                                                      controller:
                                                                          controller
                                                                              .reasonController,
                                                                      // onSaved: (val){
                                                                      //
                                                                      // },
                                                                      // validator: validator,
                                                                    ),
                                                                  ),
                                                                  confirmBtnText:
                                                                      "حفظ",
                                                                  onConfirmBtnTap:
                                                                      () {
                                                                    controller.refuseRequest(
                                                                        requestId: controller
                                                                                .myRequestsAsClient[
                                                                                    index]
                                                                                .id ??
                                                                            0);
                                                                    Get.back();
                                                                  },//cancelBtnTextStyle:TextStyle(color: Colors.blue) ,
                                                                  cancelBtnText:
                                                                      "الغاء",showCancelBtn: true,
                                                                  onCancelBtnTap: () {
                                                                    Get.back();
                                                                  });
                                                              print("refuse");
                                                            }
                                                          },
                                                    icon: "images/remove-line.svg",
                                                    widgetOpacity: controller
                                                                .myRequestsAsClient[
                                                                    index]
                                                                .statuses
                                                                ?.reject ==
                                                            false
                                                        ? 0.4
                                                        : 1,
                                                    checkOpacity: 0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SlideRightItemsSeparation(),
                                        Expanded(
                                            child: SlideRightItemsWraper(
                                          firstWidget: SlideRightItemWidget(
                                            isSvg: true,
                                            title: "تحويل",
                                            //اعكس /
                                            onPress: controller
                                                        .myRequestsAsClient[
                                                            index]
                                                        .statuses
                                                        ?.transfer ==
                                                    false
                                                ? null: () {
                                              controller.currentIndex.value=index;
                                              if (controller.currentIndex.value  == index) {
                                                     Get.toNamed("/ClientPaymentModelPage?advertiser=${controller.myRequestsAsClient[index].advertiser?.username??' '}"
                                                         "&requestId=${controller.myRequestsAsClient[index].id}&total=${controller.myRequestsAsClient[index].bill_total}");
                                                    }
                                                  }
                                                ,
                                            icon: "images/Outline.svg",
                                            widgetOpacity: controller
                                                        .myRequestsAsClient[
                                                            index]
                                                        .statuses
                                                        ?.transfer ==
                                                    false
                                                ? 0.4
                                                : 1,
                                            checkOpacity: .4,
                                          ),
                                          secondWidget: SlideRightItemWidget(
                                            isSvg: true,
                                            title: "تعديل",
                                            onPress: controller
                                                        .myRequestsAsClient[
                                                            index]
                                                        .statuses
                                                        ?.edit ==
                                                    false
                                                ? null
                                                : () {
                                              controller.currentIndex.value=index;
                                              if (controller.currentIndex.value  == index) {
                                                      print("refuse");
                                                    }
                                                  },
                                            icon: "images/edit_pen.svg",
                                            widgetOpacity: controller
                                                        .myRequestsAsClient[
                                                            index]
                                                        .statuses
                                                        ?.edit ==
                                                    false
                                                ? 0.4
                                                : 1,
                                            checkOpacity: 0,
                                          ),
                                        )),
                                        SlideRightItemsSeparation(),
                                        Expanded(
                                            child: SlideRightItemsWraper(
                                          firstWidget: SlideRightItemWidget(
                                            isSvg: true,
                                            title: "تنفيذ",
                                            onPress: controller
                                                        .myRequestsAsClient[
                                                            index]
                                                        .statuses
                                                        ?.confirm ==
                                                    false
                                                ? null
                                                : () {
                                              controller.currentIndex.value=index;
                                              if (controller.currentIndex.value  == index) {
                                                  controller.getClientConfirm(requestId: controller.myRequestsAsClient[index].id??0);
                                                    }
                                                  },
                                            icon: "images/advertising.svg",
                                            widgetOpacity: controller
                                                        .myRequestsAsClient[
                                                            index]
                                                        .statuses
                                                        ?.confirm ==
                                                    false
                                                ? 0.4
                                                : 1,
                                            checkOpacity: 1,
                                          ),
                                          secondWidget: SlideRightItemWidget(
                                            isSvg: true,
                                            title: "الغاء",
                                            onPress: controller
                                                        .myRequestsAsClient[
                                                            index]
                                                        .statuses
                                                        ?.cancel ==
                                                    false
                                                ? null
                                                : () {
                                              controller.currentIndex.value=index;
                                              if (controller.currentIndex.value  == index) {
                                                      controller.cancelRequest(
                                                          requestId: controller
                                                                  .myRequestsAsClient[
                                                                      index]
                                                                  .id ??
                                                              0);
                                                      print("refuse");
                                                    }
                                                  },
                                            icon:
                                                "images/annotation-visibility.svg",
                                            widgetOpacity: controller
                                                        .myRequestsAsClient[
                                                            index]
                                                        .statuses
                                                        ?.cancel ==
                                                    false
                                                ? 0.4
                                                : 1,
                                            checkOpacity: 0,
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
      ),
    );
  }
  openwhatsapp(context,whatsapp) async{
    //var whatsapp ="+919144040888";
    var whatsappURl_android = "whatsapp://send?phone="+whatsapp+"&text=hello";
    var whatappURL_ios ="https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
    if(Platform.isIOS){
      // for iOS phone only
      if( await canLaunch(whatappURL_ios)){
        await launch(whatappURL_ios, forceSafariVC: false);
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: new Text("whatsapp no installed")));
      }
    }else{
      // android , web
      if( await canLaunch(whatsappURl_android)){
        await launch(whatsappURl_android);
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: new Text("whatsapp no installed")));
      }
    }
  }
}

List<Widget> TabsWidgets = [
  ProcessesWidget(),
  ShippingWidget(),
  // PullsWidget(),
  // PointsWidget()
];

// class Orders {
//   int? id;
//   String? orderId,
//       orderDate,
//       ownerName,
//       ownerImage,
//       orderTitle,
//       orderDesc,
//       orderStatus,
//       orderComments,
//       orderViews;
//   Orders({
//     this.id,
//     this.orderId,
//     this.orderComments,
//     this.orderDate,
//     this.orderDesc,
//     this.orderStatus,
//     this.orderTitle,
//     this.orderViews,
//     this.ownerName,
//     this.ownerImage
//   });
// }
//
// List <Orders> orders = [
//   Orders(
//       id: 1,
//       orderStatus: "active",
//       orderId: "523621#",
//       orderComments: "69580",
//       orderDate: "12/02/2021",
//       orderDesc: "تغطية كاملة مع الحضور لافتتاح الفرع لجديد",
//       orderTitle: "منتجات غذائية",
//       orderViews: "65324",
//       ownerName: "حمدي الفريدي",
//       ownerImage: "https://roshah.com/wp-content/uploads/2018/04/2986-1.jpg"
//
//   ),
//   Orders(
//       id: 2,
//       orderStatus: "active",
//       orderId: "523621#",
//       orderComments: "69580",
//       orderDate: "12/02/2021",
//       orderDesc: "تغطية كاملة مع الحضور لافتتاح الفرع لجديد",
//       orderTitle: "منتجات غذائية",
//       orderViews: "65324",
//       ownerName: "حمدي الفريدي",
//       ownerImage: "https://roshah.com/wp-content/uploads/2018/04/2986-1.jpg"
//   ),
//   Orders(
//       id: 3,
//       orderStatus: "active",
//       orderId: "523621#",
//       orderComments: "69580",
//       orderDate: "12/02/2021",
//       orderDesc: "تغطية كاملة مع الحضور لافتتاح الفرع لجديد",
//       orderTitle: "منتجات غذائية",
//       orderViews: "65324",
//       ownerName: "حمدي الفريدي",
//       ownerImage: "https://roshah.com/wp-content/uploads/2018/04/2986-1.jpg"
//   ),
//   Orders(
//       id: 4,
//       orderStatus: "active",
//       orderId: "523621#",
//       orderComments: "69580",
//       orderDate: "12/02/2021",
//       orderDesc: "تغطية كاملة مع الحضور لافتتاح الفرع لجديد",
//       orderTitle: "منتجات غذائية",
//       orderViews: "65324",
//       ownerName: "حمدي الفريدي",
//       ownerImage: "https://roshah.com/wp-content/uploads/2018/04/2986-1.jpg"
//   ),
//   Orders(
//       id: 5,
//       orderStatus: "active",
//       orderId: "523621#",
//       orderComments: "69580",
//       orderDate: "12/02/2021",
//       orderDesc: "تغطية كاملة مع الحضور لافتتاح الفرع لجديد",
//       orderTitle: "منتجات غذائية",
//       orderViews: "65324",
//       ownerName: "حمدي الفريدي",
//       ownerImage: "https://roshah.com/wp-content/uploads/2018/04/2986-1.jpg"
//   ),
// ];
