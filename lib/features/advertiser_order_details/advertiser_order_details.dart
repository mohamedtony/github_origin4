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
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AdvertiserOrderDetails
    extends GetWidget<AdvertiserOrderDetailsController> {
  AdvertiserOrderDetails({Key? key,}) : super(key: key);


  final List<String> titles = ['المرفقات', 'الروابط', 'الكوبونات', 'العنوان'];
  // final List<Widget> contentList = [
  //     AttachmentsWidget(),
  //     LinksWidget(),
  //     CouponsWidget(),
  //    AddressWidget(),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarWidget(
          isSearchBar: false,
          isNotification: false,
          isBack: true,
          isSideMenu: false,
        ),
        preferredSize: Size(MediaQuery.of(context).size.width, 120.h),
      ),
      body: ListView(
        children: [
            OrderDetailsTitle(requestId: controller.requestId,),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  left: 8.0,
                  right: 8.0,
                ),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 100.w,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        // border: Border.all(color: Colors.grey[300]!),
                        // color: const Color(0xff4184CE),
                        color: const Color(0xff979797),
                      ),
                      child: Text(
                        'نوع المنتج',
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Text(controller.myOderDetails.data?.productType?.name??"" ,
                        style: TextStyle(
                            color: const Color(0xff041D67), fontSize: 14.sp),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
              )
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  left: 8.0,
                  right: 8.0,
                ),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 100.w,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        // border: Border.all(color: Colors.grey[300]!),
                        // color: const Color(0xff4184CE),
                        color: const Color(0xff979797),
                      ),
                      child: Text(
                        'نوع الاعلان',
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Text(controller.myOderDetails.data?.adsType?.name??"",
                        style: TextStyle(
                            color: const Color(0xff041D67), fontSize: 14.sp),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
              )
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  left: 8.0,
                  right: 8.0,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 95.w,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        // border: Border.all(color: Colors.grey[300]!),
                        // color: const Color(0xff4184CE),
                        color: const Color(0xff979797),
                      ),
                      child: Text(
                        'التاريخ',
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 10,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'من',
                                style: TextStyle(
                                    color: const Color(0xff041D67), fontSize: 14.sp),
                              ),

                              Text(controller.myOderDetails.data?.startedAt??"",
                                style: TextStyle(
                                    color: const Color(0xff041D67), fontSize: 14.sp),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '   :   ',
                                style: TextStyle(
                                    color: const Color(0xff041D67), fontSize: 14.sp),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'إلى',
                                style: TextStyle(
                                    color: const Color(0xff041D67), fontSize: 14.sp),
                              ),

                              Text(controller.myOderDetails.data?.endedAt??"",
                                style: TextStyle(
                                    color: const Color(0xff041D67), fontSize: 14.sp),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      height: 35,
                      width: 1,
                      color: Colors.grey,
                    ),
                    Expanded(
                      flex: 2,
                      child: controller.myOderDetails.data?.repeatCount!=null?
                      Text( '${controller.myOderDetails.data?.repeatCount?.toString()}  مرة ',
                        style: TextStyle(
                            color: const Color(0xff041D67), fontSize: 14.sp),
                      ):Container(),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
              )
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  left: 8.0,
                  right: 8.0,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 95.w,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        // border: Border.all(color: Colors.grey[300]!),
                        // color: const Color(0xff4184CE),
                        color: const Color(0xff979797),
                      ),
                      child: Text(
                        'القنوات',
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                        child: SizedBox(
                      height: 40.w,
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.all(1),
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.myOderDetails.data?.channels!=null?controller.myOderDetails.data?.channels?.length??0:0,
                        itemBuilder: (context, index) => Container(
                          margin: const EdgeInsets.all(1),
                          child: Container(
                            decoration:BoxDecoration(
                              shape: BoxShape.circle,
                              image: controller.myOderDetails.data?.channels?[index].image!=null
                                  ?   DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage('${controller.myOderDetails.data?.channels?[index].image}'),//
                              )
                                  : const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('images/twitter.png'),
                              ),
                            ),
                            height: 40.w,
                            width: 40.w,
                          ),
                        ),
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 10,
                        ),
                      ),
                    )),
                    Stack(
                      children: [
                        Container(
                          height: 60,
                          width: 80,
                          decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            gradient: const LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xff6fd3de),
                                  Color(0xff486ac7),
                                ]
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("المنصة",style: TextStyle(color: Colors.white,fontSize: 14),),
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        color: Colors.white
                                    ),
                                    child: Center(
                                      child: Icon(Icons.check,color: Color(0xff486ac7),size: 10,),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  const FaIcon(FontAwesomeIcons.youtube,color: Colors.white,size: 20,),


                                ],
                              ),

                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  left: 8.0,
                  right: 8.0,
                ),
                child: Container(
                  width: 95.w,
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    // border: Border.all(color: Colors.grey[300]!),
                    // color: const Color(0xff4184CE),
                    color: const Color(0xff979797),
                  ),
                  child: Text(
                    'الوصف',
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GetBuilder<AdvertiserOrderDetailsController>(
                    id: 'First',
                    builder: (_) {
                      return Column(
                        children: [
                          Align(
                            alignment:Alignment.centerRight,
                            child: Text(controller.myOderDetails.data?.description??"",
                              style: TextStyle(
                                color: const Color(0xff041D67),
                                fontSize: 14.sp,
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
              const Divider(
                thickness: 1,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Card(
                  elevation: 0,
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(8.0),
                  // ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      // color: Colors.white,
                      // color: Color(0xff979797),
                      borderRadius: BorderRadius.circular(8),
                      // border: Border.all(
                      //
                      // ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8.0,
                            left: 8.0,
                            right: 8.0,
                          ),
                          child: Container(
                            width: 95.w,
                            alignment: Alignment.center,
                            padding:
                            const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              // border: Border.all(color: Colors.grey[300]!),
                              // color: const Color(0xff4184CE),
                              color: const Color(0xff979797),
                            ),
                            child: Text(
                              'ملحوظة',
                              style: TextStyle(color: Colors.white, fontSize: 12.sp),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: GetBuilder<AdvertiserOrderDetailsController>(
                              id: 'Second',
                              builder: (_) {
                                return Column(
                                  children: [
                                    Align(
                                      alignment:Alignment.centerRight,
                                      child: Text(controller.myOderDetails.data?.notes??"",
                                        style: TextStyle(
                                          color: const Color(0xff041D67),
                                          fontSize: 12.sp,
                                        ),
                                        maxLines: controller.secondSeeMore,
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: InkWell(
                                        onTap: () {
                                          controller.updateSeeMore(builderId: 'Second');
                                        },
                                        child: Text(
                                          controller.secondSeeMore != null
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
                  ),
                ),
              )

            ],
          ),
          GetBuilder<AdvertiserOrderDetailsController>(
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: controller.selectedIndex == index
                                  ? const Color(0xff979797)
                                  : Colors.transparent,
                            ),
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
    );
  }
}
