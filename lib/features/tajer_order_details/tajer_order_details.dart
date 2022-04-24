import 'package:advertisers/app_core/network/responses/AdvertiserOrderDetailsResponse.dart';
import 'package:advertisers/features/advertiser_order_details/controller/advertiser_order_details_controller.dart';
import 'package:advertisers/features/advertiser_order_details/widgets/content_widgets/address_widget.dart';
import 'package:advertisers/features/advertiser_order_details/widgets/content_widgets/attachments_widget.dart';
import 'package:advertisers/features/advertiser_order_details/widgets/content_widgets/coupons_widget.dart';
import 'package:advertisers/features/advertiser_order_details/widgets/content_widgets/links_widget.dart';
import 'package:advertisers/features/advertiser_order_details/widgets/content_widgets/note_widget.dart';
import 'package:advertisers/features/advertiser_order_details/widgets/order_details_title.dart';
import 'package:advertisers/features/advertising_story_details/Dragabble/overlay_handler.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:advertisers/features/tajer_order_details/controller/tajer_order_details_controller.dart';
import 'package:advertisers/shared/advertisers_appbar/advertisers_app_bar.dart';
import 'package:advertisers/shared/gradient_check_box/gradient_check_box.dart';
// import 'package:adv/shared/advertisers_appbar/advertisers_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:advertisers/app_core/network/responses/AdvertiserOrderDetailsResponse.dart';
import 'package:advertisers/features/advertiser_order_details/controller/advertiser_order_details_controller.dart';
import 'package:advertisers/features/advertiser_order_details/widgets/content_widgets/address_widget.dart';
import 'package:advertisers/features/advertiser_order_details/widgets/content_widgets/attachments_widget.dart';
import 'package:advertisers/features/advertiser_order_details/widgets/content_widgets/coupons_widget.dart';
import 'package:advertisers/features/advertiser_order_details/widgets/content_widgets/links_widget.dart';
import 'package:advertisers/features/advertiser_order_details/widgets/content_widgets/note_widget.dart';
import 'package:advertisers/features/advertiser_order_details/widgets/order_details_title.dart';
import 'package:advertisers/shared/advertisers_appbar/advertisers_app_bar.dart';
import 'package:advertisers/shared/gradient_check_box/gradient_check_box.dart';
// import 'package:adv/shared/advertisers_appbar/advertisers_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class TajerOrderDetails extends GetWidget<TajerOrderDetailsController> {


  final TajerOrderDetailsController  controller = Get.put(TajerOrderDetailsController());
  OverlayHandlerProvider overlayHandlerProvider = Get.find();

  TajerOrderDetails({Key? key,}) : super(key: key);
  final List<String> titles = ['المرفقات', 'الروابط', 'الكوبون', 'العنوان'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarWidget(
          isSearchBar: false,
          isNotification: false,
          isBack: true,
          isSideMenu: false,
          backPressed: (){
            overlayHandlerProvider.updateHidden(false, 300);
            Get.back();
          },
        ),
        preferredSize: Size(MediaQuery.of(context).size.width, 120.h),
      ),
      body: Container(
        child: ListView(
          children: [

        GetBuilder<TajerOrderDetailsController>(
        init: TajerOrderDetailsController(),
        builder: (controller) =>  Column(
              children: [
                ///header
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// ads active
                      Row(
                        children: [
                          Container(
                            width: 29.sp,
                            height: 29.sp,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('images/active img 2.png'),fit: BoxFit.fill,
                                )
                            ),
                            // child: SvgPicture.asset('images/active img.svg',height: 10,width: 10,fit: BoxFit.fill,),
                          ),

                          Container(
                            width: 80.sp,
                            //height: 19.sp,
                            child: Text('الإعلان ${controller.showAdsDetailsResponse.value!=null&&controller.showAdsDetailsResponse.value.data!=null?controller.showAdsDetailsResponse.value.data!.statusTxt??"":""}',style: TextStyle(color: Color(0xff097534),fontFamily: 'A Jannat LT, Regular',fontSize: 14),),
                          ),

                        ],
                      ),

                      /// amount of days
                      Container(
                        width: 70.sp,
                        //height: 19.sp,
                        child: Text('${controller.showAdsDetailsResponse.value!=null&&controller.showAdsDetailsResponse.value.data!=null?controller.showAdsDetailsResponse.value.data!.timeAgo??"":""}',style: TextStyle(color: Color(0xff8369CF),fontFamily: 'A Jannat LT, Regular',fontSize: 14),),
                      ),

                      /// id of ads
                      Container(
                        width: 55.sp,
                        //height: 19.sp,
                        child: Text('#${controller.showAdsDetailsResponse.value!=null&&controller.showAdsDetailsResponse.value.data!=null? controller.showAdsDetailsResponse.value.data!.id??"" :""}',style: TextStyle(color: Color(0xff132E82),fontFamily: 'A Jannat LT, Regular',fontSize: 16),),
                      ),

                    ],
                  ),
                ),

                const Padding(
                  padding:   EdgeInsets.symmetric(horizontal:8.0),
                  child: Divider(height: 1,),
                ),

                Column(
                  children: [
                    Row(
                      children: [
                        /// img
                        Padding(
                          padding: const EdgeInsets.only(top:8.0,right: 14),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [

                              Container(
                                width: 63,
                                height: 63,
                                decoration: BoxDecoration(
                                  image:   DecorationImage(image: NetworkImage('${
                                      controller.showAdsDetailsResponse.value!=null&&controller.showAdsDetailsResponse.value.data!=null&&controller.showAdsDetailsResponse.value.data!.user!=null
                                          &&controller.showAdsDetailsResponse.value.data!.user!.image!=null?
                                  controller.showAdsDetailsResponse.value.data!.user!.image :controller.noImage}')/*AssetImage('images/man img.png',)*/,fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),

                              Positioned(bottom: -12,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal:18.0),
                                  child: Container(
                                    width: 30.sp,
                                    height: 30.sp,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(image: AssetImage('images/saudi flag.png'),fit: BoxFit.fill)
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),


                        /// ads owner
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right:14.0,top: 8),
                              child: Container(

                                child: Text('صاحب الإعلان',style: TextStyle(color: Color(0xff757575),fontFamily: 'A Jannat LT, Regular',fontSize: 14),),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:6.0,right: 14),
                              child: Container(

                                child: Text('${controller.showAdsDetailsResponse.value!=null&&controller.showAdsDetailsResponse.value.data!=null&&controller.showAdsDetailsResponse.value.data!.user!=null? controller.showAdsDetailsResponse.value.data!.user!.username??"" :""}',style: TextStyle(color: Color(0xff041D67),fontFamily: 'A Jannat LT, Regular',fontSize: 15),),
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: Text('نشاط التاجر / اكسسوارات وشنط',style: TextStyle(color: Color(0xff041D67),fontFamily: 'A Jannat LT, Regular',fontSize: 15),),
                        ),
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:14.0,vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [


                          ///comment for the ads owner
                           InkWell(
                              onTap: (){
                                controller.showCommentField.value=!controller.showCommentField.value;
                                controller.update();
                              },
                              child: Row(
                                children: [
                                  SvgPicture.asset('images/comment img.svg',height: 35,width: 35,fit: BoxFit.fill,),

                                  Container(
                                    child: Text('تعليقك الخاص لصاحب الإعلان',style: TextStyle(color: Color(0xff041D67),fontFamily: 'A Jannat LT, Regular',fontSize: 12),),
                                  ),
                                ],
                              ),
                            ),


                          Container(
                            width: 141,
                            child: Row(
                              children: [
                                Container(
                                  width: 35.sp,
                                  height: 35.sp,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('images/chat img3.png'),fit: BoxFit.fill,
                                      )
                                  ),
                                ),
                                // SvgPicture.asset('images/chat img2.svg',height: 35,width: 35,fit: BoxFit.fill,),

                                Container(
                                  child: Text('راسل صاحب الإعلان',style: TextStyle(color: Color(0xff041D67),fontFamily: 'A Jannat LT, Regular',fontSize: 12),),
                                ),
                              ],
                            ),
                          ),


                        ],
                      ),
                    ),

                    Obx(
                          () => Visibility(
                        visible: controller.showCommentField.value,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 8),
                          child: Container(
                            height: 42,
                            decoration:const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12.0),
                                    bottomLeft: Radius.circular(12.0)),
                             ),
                            child: TextField(
                              textAlign: TextAlign.start,
                              textAlignVertical: TextAlignVertical.center,
                              enabled: true,
                              controller: controller.addCommentController.value,
                               style: TextStyle(
                                color: (AppColors.editProfileTextColorOpa)
                                    .withOpacity(0.51),
                                fontWeight: FontWeight.w500,
                                fontSize: 14.0,
                              ),
                              decoration: InputDecoration(
                                suffixIcon: InkWell(
                                  onTap: (){
                                    if(controller.addCommentController.value!=null && controller.addCommentController.value.text!=null&&
                                        controller.addCommentController.value.text!=""&&controller.showAdsDetailsResponse.value!=null
                                        &&controller.showAdsDetailsResponse.value.data!=null&&controller.showAdsDetailsResponse.value.data!.user!=null
                                        &&controller.showAdsDetailsResponse.value.data!.user!.id!=null){
                                      controller.checkForAddingComment(controller.showAdsDetailsResponse.value.data!.user!.id,controller.showAdsDetailsResponse.value.data!.id,controller.addCommentController.value.text);
                                    }else{
                                      Get.snackbar(
                                        "خطأ",
                                        "يجب ادخال التعليق",
                                        icon: const Icon(Icons.person, color: Colors.red),
                                        backgroundColor: Colors.yellow,
                                        snackPosition: SnackPosition.BOTTOM,);
                                    }
                                  },
                                    child: Icon(Icons.send,color: Color(0xff4166CD),)
                                ),
                                  contentPadding: EdgeInsets.only(
                                      left: 10.0, right: 14.0, bottom: 12.0),
                                  // isCollapsed: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(70.0),
                                    borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  filled: true,
                                  hintStyle: TextStyle(color: Colors.grey[350]),
                                  hintText: 'اضف تعليقك الخاص لصاحب الاعلان',
                                  fillColor: Colors.white70),
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),

                const Padding(
                  padding:   EdgeInsets.symmetric(horizontal:8.0),
                  child: Divider(height: 1,),
                ),

                /// description
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8.0,
                        left: 8.0,
                        right: 8.0,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right:20.0),
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'وصف الاعلان :',
                            style: TextStyle(color:const Color(0xff041D67), fontSize: 14.sp,fontFamily: 'A Jannat LT,Regular'),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom:16.0,right: 30,left: 30,top: 5),
                      child: GetBuilder<TajerOrderDetailsController>(
                          id: 'First',
                          builder: (_) {
                            return Column(
                              children: [
                                Align(
                                  alignment:Alignment.centerRight,
                                  child: Text( controller.showAdsDetailsResponse.value!=null&&controller.showAdsDetailsResponse.value.data!=null?
                                  controller.showAdsDetailsResponse.value.data!.description??"":"",
                                    style: TextStyle(
                                      color: const Color(0xff041D67),
                                      fontSize: 12.sp,
                                    ),
                                    maxLines: controller.firstSeeMore,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: InkWell(
                                    onTap: () {
                                      controller.updateSeeMore(builderId: 'First');
                                    },
                                    child: Text(
                                      controller.firstSeeMore != null
                                          ? ' المزيد...'
                                          : ' أقل...',
                                      style: TextStyle(
                                        color: const Color(0xffF1924F),
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            );
                          }),
                    ),
                  ],
                ),
              ],
            ),
        ),


            GetBuilder<TajerOrderDetailsController>(
                init: TajerOrderDetailsController(),
                id: 'SelectedIndex',
                builder: (_) {
                  return Column(
                    children: [
                      Container(
                        color: Colors.grey[200],
                        height: 45.w,
                        child: ListView.separated(
                          padding: const EdgeInsets.all(8.0),
                          scrollDirection: Axis.horizontal,
                          itemCount: titles.length,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              controller.updateSelectedIndex(
                                  builderId: 'SelectedIndex',
                                  mSelectedIndex: index);
                            },
                            child: Container(
                              width:
                              controller.selectedIndex == index ? 95.w : null,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(horizontal: 15, ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: controller.selectedIndex == index
                                    ? const Color(0xff979797)
                                    : Colors.transparent,
                              ),
                              child: Center(
                                child: Text(
                                  titles[index],
                                  style: TextStyle(
                                      color: controller.selectedIndex == index
                                          ? Colors.white
                                          : Colors.grey[500],
                                      fontSize: 14.sp),
                                ),
                              ),
                            ),
                          ),
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 10,
                          ),
                        ),
                      ),
                      AnimatedSwitcher(
                          duration: const Duration(seconds: 1),
                          transitionBuilder: (child, animation) =>
                              ScaleTransition(child: child, scale: animation),
                          child: Container(
                              key: Key('${controller.selectedIndex}'),
                              child: [
                                AttachmentsWidget(myAttachments: controller.myOderDetails.data?.attachments??[],),
                                LinksWidget(myLinks: controller.myOderDetails.data?.links??[],),
                                CouponsWidget(copon: controller.myOderDetails.data?.copon??Copon(),),
                                AddressWidget(address: controller.myOderDetails.data?.address??Address(lat: "37.42796133580664",lng: "-122.085749655962"),),
                              ][controller.selectedIndex])),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
