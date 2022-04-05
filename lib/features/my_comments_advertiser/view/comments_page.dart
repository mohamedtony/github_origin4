import 'package:advertisers/features/advertiser_invoice_input/controller/advertiser_invoice_input_controller.dart';
import 'package:advertisers/features/advertiser_invoice_input/view/advertiser_invoice_input_page.dart';
import 'package:advertisers/features/advertiser_order_details/controller/advertiser_order_details_controller.dart';
import 'package:advertisers/features/advertising_requests/controller/advertising_requests_controller.dart';
import 'package:advertisers/features/advertising_requests/widgets/advertising_requests_slide_right_item.dart';
import 'package:advertisers/features/advertising_requests/widgets/advertising_requests_slide_right_item_separation.dart';
import 'package:advertisers/features/advertising_requests/widgets/advertising_requests_slide_right_items_wraper.dart';
import 'package:advertisers/features/advertising_requests/widgets/click_picture_widget.dart';
import 'package:advertisers/features/advertising_requests/widgets/filter_bottom_sheet.dart';
import 'package:advertisers/features/advertising_requests/widgets/single_statistics_item.dart';
import 'package:advertisers/features/customer_order_invoice_out_puts/order_invoice_controller.dart';
import 'package:advertisers/features/employees/controller/employees_controller.dart';
import 'package:advertisers/features/employees/view/AddEmployeePage.dart';
import 'package:advertisers/features/employees/view/employee_slide_right_items_action.dart';
import 'package:advertisers/features/my_comments_advertiser/controller/comments_controller.dart';
import 'package:advertisers/features/reason_rejecting_advertisement/controller/reason_rejecting_advertisement_controller.dart';
import 'package:advertisers/features/tax_settings/view/widgets/tax_settings_app_bar_widget.dart';
import 'package:advertisers/features/users_module/app_colors.dart';
import 'package:advertisers/reason_rejecting_advertisement_customer/controller/reason_rejecting_advertisement_customer_controller.dart';
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
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:math' as math; // import this
class CommentsPage extends GetWidget<CommentsController>  {

  final CommentsController  controller = Get.put(CommentsController());


  // ScrollController? scrollController;
  launchURL(urlLink) async {
    var url = urlLink;
    if(url != null){
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return controller.obx(
            (state) =>  Scaffold(
              appBar:  PreferredSize(
                child:  AppBarWidget(
              controller: controller.searchController,
              isSideMenu: false,
              isSearchBar: false,
              isNotification: false,
              isBack: true,
              searchBarBigRight: false,
              ),
              preferredSize:  Size(
                  MediaQuery.of(context).size.width,
                  90.0
              ),
          ),

              body: controller.myEmployees.isNotEmpty ? Container(
            color:const Color(0xffF5F5F5),
            child: Column(
              children: [
                Container(
                  color: Color(0xffF5F5F5),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        /// header
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  child: Text("تعليقات المشاهدين",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color:   Colors.white,
                                        fontFamily: 'A Jannat LT, Regular'
                                    ),),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 12),
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('images/comments2.png'),fit:  BoxFit.fill,

                                    )
                                ),

                                width: 21,
                                height: 17,
                              ),
                            ),
                          ],
                        ),
                        /// statics number
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              /// comments num
                              Row(

                                children: [
                                  Padding(
                                    padding:   EdgeInsets.symmetric(vertical:4.0,horizontal: 8),
                                    child: Text("529",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color:   Color(0XFF427BD0),
                                          fontFamily: 'A Jannat LT, Regular'
                                      ),),
                                  ),

                                  Padding(
                                    padding:   EdgeInsets.symmetric(vertical:4.0,horizontal: 8),
                                    child: Text("تعليق",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color:   Color(0XFF427BD0),
                                          fontFamily: 'A Jannat LT, Regular'
                                      ),),
                                  ),
                                ],
                              ),
                              /// dislikes num
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding:   EdgeInsets.symmetric(vertical:4.0,),
                                    child:  Container(
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage('images/dislike.png'),fit:  BoxFit.fill,
                                          )
                                      ),
                                      width: 36,
                                      height: 35,
                                    ),
                                  ),

                                  Padding(
                                    padding:   EdgeInsets.symmetric(vertical:4.0,),
                                    child: Text("64",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color:   Color(0XFF427BD0),
                                          fontFamily: 'A Jannat LT, Regular'
                                      ),),
                                  ),
                                ],
                              ),
                              ///likes num
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding:   EdgeInsets.symmetric(vertical:4.0,),
                                    child:  Container(
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage('images/like.png'),fit:  BoxFit.fill,
                                          )
                                      ),
                                      width: 36,
                                      height: 35,
                                    ),
                                  ),

                                  Padding(
                                    padding:   EdgeInsets.symmetric(vertical:4.0,),
                                    child: Text("129",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color:   Color(0XFF427BD0),
                                          fontFamily: 'A Jannat LT, Regular'
                                      ),),
                                  ),
                                ],
                              ),
                              ///reply num
                              Container(
                                width: 53,
                                height: 27,
                                decoration: BoxDecoration(
                                  color: Color(0XFF979797),
                                  borderRadius: BorderRadius.circular(14)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal:2.0),
                                      child: Text("25",
                                        style: TextStyle(
                                            fontSize: 13.sp,
                                            color:   Color(0XFFFFFF00),
                                            fontFamily: 'A Jannat LT, Regular'
                                        ),),
                                    ),

                                    Text("رد",
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          color:   Color(0XFFFFFF00),
                                          fontFamily: 'A Jannat LT, Regular'
                                      ),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        /// line
                        const Padding(
                         padding:  EdgeInsets.all(2.0),
                         child:  Divider(height: 1,),
                       )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  // height: 400,
                  child: Container(

                    child: SmartRefresher(
                      controller: controller.refreshController,
                      enablePullUp: true,
                      onRefresh: () async {
                        /*final result = await */controller.fetchEmployeesList();
                        if (controller.myEmployees.isNotEmpty) {
                          controller.refreshController.refreshCompleted();
                        } /*else {
                          controller.refreshController.refreshFailed();
                        }*/
                      },
                      onLoading: () async {
                        /*final result = await*/ controller.fetchEmployeesList();
                        if (controller.myEmployees.isNotEmpty) {
                          controller.refreshController.loadComplete();
                        } /*else {
                          controller.refreshController.loadFailed();
                        }*/
                      },
                      child: ListView(
                        controller: controller.scrollController,
                        // primary: true,
                        children: [

                          GetBuilder<CommentsController>(
                            init: CommentsController(),
                            builder: (controller) => ListView.builder(

                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: /*controller.myEmployees.length*/10,
                                // itemCount: state?.data?.parentRequests?.length,
                                itemBuilder: (context, index) {
                                //  final uiEmployeeRequests = controller.myEmployees[index];
                                  // final uiParentRequests = state?.data?.parentRequests![index]!;
                                  return  Container(
                                    color: index==2?Colors.grey[300]:Colors.transparent,
                                    child: GestureDetector(
                                      onPanUpdate: (details) {
                                        // Swiping in right direction.
                                        // if (details.delta.dx > 0) {
                                        //   controller.closeSingleItemFromCheckListFunctions(uiEmployeeRequests!.id);
                                        //   print("Dragging in +X direction");
                                        // }
                                        //
                                        // // Swiping in left direction.
                                        // if (details.delta.dx < 0) {
                                        //   print("Dragging in -X direction");
                                        //   controller.openSingleItemFromCheckListFunctions(uiEmployeeRequests!.id);
                                        // }

                                      },

                                      child: InkWell(
                                        onTap:(){
                                         // controller.fetchAnEmployee(id: uiEmployeeRequests!.id);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(right: 16),
                                          child:  Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              ///name & img date
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  ///name & img
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal:4.0),
                                                        child: Container(
                                                          width: 23.sp,
                                                          height: 23.sp,
                                                          decoration: const BoxDecoration(
                                                            shape: BoxShape.circle,
                                                            image: DecorationImage(image: AssetImage('images/man img.png'),fit: BoxFit.fill),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal:8.0),
                                                        child: Text(
                                                          "احمد عبدالله خليفة",
                                                          style: TextStyle(
                                                              fontSize: 15.sp,
                                                              color: const Color(0xff212121),
                                                              fontFamily: 'A Jannat LT, Bold'
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  ///date
                                                  Padding(
                                                    padding: const EdgeInsets.only(left:25.0),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          "14 نوفمبر 2022",
                                                          style: TextStyle(
                                                              fontSize: 10.sp,
                                                              color: const Color(0xff212121),
                                                              fontFamily: 'A Jannat LT, Bold'
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.symmetric(horizontal:4.0),
                                                          child: Text(
                                                            "الساعة 7.25 م",
                                                            style: TextStyle(
                                                                fontSize: 10.sp,
                                                                color: const Color(0xff212121),
                                                                fontFamily: 'A Jannat LT, Bold'
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              Padding(
                                                padding:   EdgeInsets.symmetric(horizontal:34.sp,vertical: 11.sp),
                                                child: Container(
                                                  width: 303.sp,
                                                  height: 46.sp,
                                                  child: Text(
                                                    "المنتجات جميلة جداً ا حبذا إعادة العرض مرة أخرى انا معجب جداً بمنتجاتكم وأستخدمها أنا وعائلتي",
                                                    style: TextStyle(
                                                        fontSize: 15.sp,
                                                        color: const Color(0xff4074CA),
                                                        fontFamily: 'A Jannat LT,Regular'
                                                    ),
                                                  ),
                                                ),
                                              ),

                                              ///rating & add reply
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  ///rating
                                                  Padding(
                                                    padding: const EdgeInsets.only( top: 8),
                                                    child: Container(
                                                      width: 120,
                                                      height: 27,
                                                      child: RatingBar.builder(
                                                        unratedColor: Colors.grey[300],
                                                        textDirection: TextDirection.ltr,
                                                        itemSize: 15,
                                                        initialRating: 5,
                                                        minRating: 1,
                                                        direction: Axis.horizontal,
                                                        allowHalfRating: true,
                                                        itemCount: 5,
                                                        itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                                                        itemBuilder: (context, _) => Icon(
                                                          Icons.star,
                                                          color: Colors.amber,
                                                        ),
                                                        onRatingUpdate: (rating) {
                                                          print(rating);
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  ///add reply
                                                  index==2?
                                                  Container():
                                                  InkWell(
                                                    onTap: (){
                                                      controller.showComment.value=!controller.showComment.value;
                                                      print('controller.showComment ${controller.showComment.value}');
                                                    },
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(left:15.0),
                                                      child: Container(
                                                        width: 88,
                                                        height: 27,
                                                        decoration: BoxDecoration(
                                                            color: Color(0XFF979797),
                                                            borderRadius: BorderRadius.circular(18)
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 2),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              const Padding(
                                                                padding:  EdgeInsets.symmetric(horizontal:4.0),
                                                                child: Icon(Icons.add_circle_outline,color: Color(0XFFFFFF00),size: 14,),
                                                              ),

                                                              Text("اضف رد",
                                                                style: TextStyle(
                                                                    fontSize: 13.sp,
                                                                    color:   Color(0XFFFFFF00),
                                                                    fontFamily: 'A Jannat LT, Regular'
                                                                ),),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),


                                              Obx(()=>Visibility(
                                                visible: controller.showComment.value||index==1,
                                                child: ///name & img
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.symmetric(horizontal:4.0),
                                                          child: Container(
                                                            width: 23.sp,
                                                            height: 23.sp,
                                                            decoration: const BoxDecoration(
                                                              shape: BoxShape.circle,
                                                              image: DecorationImage(image: AssetImage('images/man img2.png'),fit: BoxFit.fill),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.symmetric(horizontal:8.0),
                                                          child: Text(
                                                            "المشرف / محمد عبدالله",
                                                            style: TextStyle(
                                                                fontSize: 15.sp,
                                                                color: const Color(0xff979797),
                                                                fontFamily: 'A Jannat LT,Regular'
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        const Padding(
                                                          padding:  EdgeInsets.only(right:12.0,left: 12),
                                                          child: Icon(Icons.subdirectory_arrow_left_rounded,color: Color(0xff4184CE),size: 15,),
                                                        ),

                                                        Padding(
                                                          padding: const EdgeInsets.only(top:10.0,left: 10,bottom: 10),
                                                          child: Container(
                                                            height: 130,
                                                            width: 275,
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(6),
                                                                border: Border.all(color: Color(0xffB2CBE6).withOpacity(.5))
                                                            ),
                                                            child:   Column(
                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                              children: [
                                                                Container(
                                                                  height: 96,
                                                                  width: 275,
                                                                  child: TextField(
                                                                    keyboardType: TextInputType.multiline,
                                                                    maxLines: null,
                                                                    controller: controller.commentController.value,
                                                                    style: TextStyle(color: Color(0xff979797),fontSize: 15,fontFamily: 'A Jannat LT, Regular'),
                                                                    decoration: InputDecoration(
                                                                        hintStyle: TextStyle(color: Color(0XFF9B9B9B),fontSize: 12,fontFamily: 'Open Sans,Regular'),
                                                                        filled: true,
                                                                        fillColor: Color(0xffEAEAEA).withOpacity(0.1),
                                                                        border: OutlineInputBorder(
                                                                            borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                                                                        enabledBorder: OutlineInputBorder(
                                                                            borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                                                                        focusedBorder: OutlineInputBorder(
                                                                            borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                                                                        hintText: "اضف رد"),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  height: 32,
                                                                  decoration: BoxDecoration(
                                                                      color: Color(0xff979797),
                                                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(6),bottomRight: Radius.circular(6))
                                                                  ),
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.symmetric(horizontal:15.0),
                                                                    child: Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                          children: [
                                                                            Transform(
                                                                              alignment: Alignment.center,
                                                                              transform: Matrix4.rotationY(math.pi),
                                                                              child: const Padding(
                                                                                padding:  EdgeInsets.symmetric(horizontal:8.0),
                                                                                child: Icon(Icons.send,color: Color(0XFFFFFF00),size: 14,),
                                                                              ),
                                                                            ),


                                                                            Text("إرسال الرد عبر",
                                                                              style: TextStyle(
                                                                                  fontSize: 13.sp,
                                                                                  color:   Color(0XFFFFFF00),
                                                                                  fontFamily: 'A Jannat LT, Regular'
                                                                              ),),
                                                                          ],
                                                                        ),

                                                                        Padding(
                                                                          padding: const EdgeInsets.only(left:15.0),
                                                                          child: Container(
                                                                            width: 90,
                                                                            child: Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsets.symmetric(horizontal:8.0),
                                                                                  child: Container(
                                                                                    width: 25.sp,
                                                                                    height: 25.sp,
                                                                                    decoration:const BoxDecoration(
                                                                                        color: Colors.white,
                                                                                        shape: BoxShape.circle
                                                                                    ),
                                                                                    child: const Padding(
                                                                                      padding:  EdgeInsets.symmetric(horizontal:4.0),
                                                                                      child: Icon(Icons.notifications,color: Color(0XFF979797),size: 14,),
                                                                                    ),
                                                                                  ),
                                                                                ),

                                                                                Padding(
                                                                                  padding: const EdgeInsets.symmetric(horizontal:8.0),
                                                                                  child: Container(
                                                                                    width: 25.sp,
                                                                                    height: 25.sp,
                                                                                    decoration:  BoxDecoration(
                                                                                        color: Colors.transparent,
                                                                                        shape: BoxShape.circle,
                                                                                        border: Border.all(color:const Color(0XFFFFFF00),width: .5)
                                                                                    ),
                                                                                    child: const Padding(
                                                                                      padding:  EdgeInsets.symmetric(horizontal:4.0),
                                                                                      child: Icon(Icons.messenger_outline_outlined,color: Color(0XFFFFFF00),size: 14,),
                                                                                    ),
                                                                                  ),
                                                                                ),

                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),


                                                                      ],
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        )

                                                      ],
                                                    )
                                                  ],
                                                ),


                                                //),
                                              ),),


                                              Visibility(
                                                visible: index==2,
                                                child: ///name & img
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.symmetric(horizontal:4.0),
                                                          child: Container(
                                                            width: 23.sp,
                                                            height: 23.sp,
                                                            decoration: const BoxDecoration(
                                                              shape: BoxShape.circle,
                                                              image: DecorationImage(image: AssetImage('images/man img2.png'),fit: BoxFit.fill),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.symmetric(horizontal:8.0),
                                                          child: Text(
                                                            "المشرف / محمد عبدالله",
                                                            style: TextStyle(
                                                                fontSize: 15.sp,
                                                                color: const Color(0xff979797),
                                                                fontFamily: 'A Jannat LT,Regular'
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        const Padding(
                                                          padding:  EdgeInsets.only(right:12.0,left: 12),
                                                          child: Icon(Icons.subdirectory_arrow_left_rounded,color: Color(0xff4184CE),size: 15,),
                                                        ),

                                                        Padding(
                                                          padding: const EdgeInsets.only(top:10.0,left: 10,bottom: 10),
                                                          child: Container(
                                                            width: 275,
                                                            child:   const Text('يشرفنا استخدامكم منتجاتنا .. وسيكون هناك عرض قادم أفضل بعد أسبوعين .. وتم اضافتك في اشعارات التبليغ عند بداية العرض',
                                                              style: TextStyle(color: Color(0xff979797),fontSize: 15,fontFamily: 'A Jannat LT, Regular'),),
                                                          ),
                                                        )

                                                      ],
                                                    )
                                                  ],
                                                ),


                                                //),
                                              ),



                                              /// line
                                              const Padding(
                                                padding:  EdgeInsets.only(left:2.0,right: 2,bottom: 2,top: 12),
                                                child:  Divider(height: 1,),
                                              )

                                            ],
                                          ),

                                        ),
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
          ):const Center(
            child: Text("لا يوجد موظفين"),
          ),

        )
    );
  }
}

