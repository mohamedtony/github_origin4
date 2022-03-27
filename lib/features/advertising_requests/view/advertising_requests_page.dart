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
import 'package:advertisers/features/reason_rejecting_advertisement/controller/reason_rejecting_advertisement_controller.dart';
import 'package:advertisers/features/tax_settings/view/widgets/tax_settings_app_bar_widget.dart';
import 'package:advertisers/features/users_module/app_colors.dart';
import 'package:advertisers/reason_rejecting_advertisement_customer/controller/reason_rejecting_advertisement_customer_controller.dart';
import 'package:advertisers/shared/advertisers_appbar/advertisers_app_bar.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class AdvertisingRequestsPage extends GetWidget<AdvertisingRequestsController>  {
  AdvertiserInvoiceInputsController _advertiserInvoiceInputsController=Get.put(AdvertiserInvoiceInputsController());
  AdvertisingRequestsController _advertisingRequestsController=Get.put(AdvertisingRequestsController());


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
              isSearchBar: true,
              isNotification: false,
              isBack: true,
              searchBarBigRight: true,
              searchPressed: (){
                controller.parentRequests.clear();
                controller.parentRequestsIds.clear();
                controller.fetchAdvertisingRequests(pageZero: true);
              },
              filterPressed: (){
                void _modalBottomSheetMenu(){
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (builder){
                        return  FilterBottomSheetWidget(areas:state!.data!.areas ,sorts: state!.data!.sorts,);
                      }
                  );
                }
                _modalBottomSheetMenu();
              },
            ),
            preferredSize:  Size(
                MediaQuery.of(context).size.width,
                90.0
            ),
          ),



          body: controller.parentRequests.isNotEmpty ?
          Container(
            color:const Color(0xffF5F5F5),
            child: Column(
              children: [
                Card(
                  color: Colors.grey[200],
                  elevation: 3,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                          },
                          child: Container(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 40, vertical: 3),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: const Color(0xff4184CE)),
                            child: const Text(
                              "طلبات الاعلان",
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  // height: 400,
                  child: Container(
                    padding:const EdgeInsets.all(10),
                    child: ListView(
                      controller: controller.scrollController,
                      // primary: true,
                      children: [

                        GetBuilder<AdvertisingRequestsController>(
                          init: AdvertisingRequestsController(),
                          builder: (controller) => ListView.builder(

                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.parentRequests.length,
                              // itemCount: state?.data?.parentRequests?.length,
                              itemBuilder: (context, index) {
                                final uiParentRequests = controller.parentRequests[index];
                                // final uiParentRequests = state?.data?.parentRequests![index]!;
                                return  Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: GestureDetector(
                                    // onTap: (){
                                    //   controller.closeSingleItemFromCheckListFunctions(uiParentRequests!.id);
                                    // },
                                    onPanUpdate: (details) {
                                      // Swiping in right direction.
                                      if (details.delta.dx > 0) {
                                        controller.closeSingleItemFromCheckListFunctions(uiParentRequests!.id);
                                        print("Dragging in +X direction");
                                      }

                                      // Swiping in left direction.
                                      if (details.delta.dx < 0) {
                                        print("Dragging in -X direction");
                                        controller.openSingleItemFromCheckListFunctions(uiParentRequests!.id);
                                      }

                                    },

                                    child: Stack(
                                      children: [
                                        InkWell(
                                          onTap:(){
                                            controller.closeSingleItemFromCheckListFunctions(uiParentRequests!.id);
                                          },
                                          child: Card(
                                            elevation: 5,
                                            shape:  RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(15.0),
                                            ),
                                            child:  Padding(
                                              padding: const EdgeInsets.only(right: 18),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    padding: const EdgeInsets.all(8),
                                                    child:  Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text("${uiParentRequests!.id}#",style: TextStyle( decoration: TextDecoration.underline,fontSize: 15.sp,color: Color(0xff4B4B95)),),
                                                            InkWell(
                                                                onTap: (){
                                                                  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => AdvertiserInvoiceInputs(
                                                                  //   user: uiParentRequests!.user,
                                                                  // )));

                                                                  // _advertiserInvoiceInputsController.isRepricing = false;
                                                                  // _advertiserInvoiceInputsController.user = uiParentRequests!.user;
                                                                  // Get.toNamed(
                                                                  //     '/AdvertiserInvoiceInputs',
                                                                  //     // arguments: uiParentRequests!.user
                                                                  // );
                                                                },
                                                                child: Text("${uiParentRequests!.createdAt}",style: TextStyle(fontSize: 15.sp,color: Color(0xff888888)),)),
                                                            InkWell(
                                                              onTap: (){
                                                                controller.addAndRemoveOtherFromCheckListShare(uiParentRequests.id);
                                                                // print("controller.checkList == > ${controller.checkListShare} ${controller.checkListShare!.contains(uiParentRequests!.id)}");
                                                              },
                                                              child: Row(
                                                                children: [
                                                                  Container(
                                                                    height: 10,
                                                                    width: 10,
                                                                    decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius.circular(50),
                                                                      color: Colors.black54,

                                                                    ),
                                                                  ),
                                                                  const   SizedBox(
                                                                    width: 8,
                                                                  ),
                                                                  Container(
                                                                    height: 10,
                                                                    width: 10,
                                                                    decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius.circular(50),
                                                                      color: Colors.black54,

                                                                    ),
                                                                  ),
                                                                  const   SizedBox(
                                                                    width: 8,
                                                                  ),
                                                                  Container(
                                                                    height: 10,
                                                                    width: 10,
                                                                    decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius.circular(50),
                                                                      color: Colors.black54,

                                                                    ),
                                                                  ),

                                                                ],
                                                              ),
                                                            )
                                                            // Text("تفاصيل الطلب",style: TextStyle( decoration: TextDecoration.underline,fontSize: 15.sp,color: Color(0xff244094)),),

                                                          ],
                                                        ),
                                                        const  SizedBox(
                                                          height: 12,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            // SizedBox(
                                                            //   width: 200,
                                                            // ),
                                                            Column(
                                                              children: [
                                                                InkWell(
                                                                  onTap: (){
                                                                    controller.addAndRemoveOtherFromCheckProfile(uiParentRequests!.id);
                                                                    print("person");
                                                                  },
                                                                  child: ClipRRect(
                                                                      borderRadius: BorderRadius.circular(10),
                                                                      child: Image.network("https://picsum.photos/200/300",height: 80,)//${uiParentRequests!.advertiser!.image}
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height:  controller.checkListFunctions!.contains(uiParentRequests!.id) ? 25.h + 8 : 8,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                  children: [
                                                                    InkWell(
                                                                      onTap: (){
                                                                        launchURL(uiParentRequests!.advertiser!.socials!.facebook);
                                                                      },
                                                                      child: Image.asset("images/fb.png",width: 25,),
                                                                    ),
                                                                    const  SizedBox(
                                                                      width: 8,
                                                                    ),
                                                                    InkWell(
                                                                      onTap: (){
                                                                        launchURL(uiParentRequests!.advertiser!.socials!.snapchat);
                                                                      },
                                                                      child: Image.asset("images/snapchat.png",width: 25,),
                                                                    ),
                                                                    const  SizedBox(
                                                                      width: 8,
                                                                    ),
                                                                    InkWell(
                                                                      onTap: (){
                                                                        launchURL(uiParentRequests!.advertiser!.socials!.instagram);
                                                                      },
                                                                      child: Image.asset("images/insta.png",width: 25,),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                            const  SizedBox(
                                                              width: 15,
                                                            ),
                                                            controller.checkListFunctions!.contains(uiParentRequests!.id) ?  Container() : Expanded(
                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Row(
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                    children: [
                                                                      Expanded(child: Text("${uiParentRequests!.advertiser?.username
                                                                      }",style: TextStyle(fontSize: 17.sp,color: Color(0xffD37A47),height: 1.4),)),

                                                                    ],
                                                                  ),
                                                                  Text("${uiParentRequests!.productType?.name}",style: TextStyle(fontSize: 15.sp,color: Color(0xff4B4B95)),),
                                                                  Text("${uiParentRequests!.address}",style: TextStyle(fontSize: 13.sp,color: Color(0xff4B4B95),height: 1.3),),
                                                                  Text("${uiParentRequests!.description}",style: TextStyle(fontSize: 14.sp,color: Color(0xff888888)),maxLines: 1,overflow: TextOverflow.ellipsis,),


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
                                                    color: const Color(0xffBBBBBB66),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    decoration:const  BoxDecoration(
                                                      borderRadius:  BorderRadius.only(
                                                        bottomLeft:  Radius.circular(15.0),
                                                        bottomRight:  Radius.circular(15.0),
                                                      ),
                                                      color: Color(0xffF5F5F5),
                                                    ),
                                                    padding:const EdgeInsets.only(right: 8,left: 8,bottom: 5,top: 5),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Expanded(child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                            Card(
                                                              elevation: 5,
                                                              color: Colors.white,
                                                              child: uiParentRequests!.statusTxt == "advertiser_add_bill" ? InkWell(
                                                                onTap:(){
                                                                  Get.put(OrderInvoiceController()).fetchInvoiceData(requestId: uiParentRequests!.id);
                                                                  Get.toNamed(
                                                                      '/CustomerOrderInvoiceOutPutsPage',
                                                                  //     arguments: [
                                                                  //   {"first": 'First data'},
                                                                  //   {"second": 'Second data'}
                                                                  // ]
                                                                  );

                                                                },
                                                                child: Padding(
                                                                  padding: const EdgeInsets.all(12.0),
                                                                  child: SvgPicture.asset(
                                                                    "images/sheet.svg",
                                                                  ),
                                                                ),
                                                              ):Container(
                                                                padding: const EdgeInsets.all(12.0),
                                                              ),
                                                            ),

                                                            InkWell(
                                                              onTap: (){
                                                                if(uiParentRequests!.statusTxt == "ملغي من العميل"){
                                                                  Get.put(ReasonRejectingAdvertisementController()).requestId=  int.parse(uiParentRequests!.id.toString());
                                                                  Get.put(ReasonRejectingAdvertisementController()).getRefuseReason(requestId: uiParentRequests!.id);
                                                                  Get.toNamed(
                                                                      "/ReasonRejectingAdvertisement?requestId=${uiParentRequests.id}&"
                                                                          "phone=${uiParentRequests.advertiser?.phone}&whatsapp${uiParentRequests.advertiser?.whatsapp}");

                                                                }else if( uiParentRequests!.statusTxt == "ملغي من المعلن"||uiParentRequests!.statusTxt == "ملغي منى"){
                                                                  Get.put(ReasonRejectingAdvertisementCustomerController()).requestId=  int.parse(uiParentRequests!.id.toString());
                                                                  Get.put(ReasonRejectingAdvertisementCustomerController()).getRefuseReason(requestId: uiParentRequests!.id);
                                                                  Get.toNamed(
                                                                      "/ReasonRejectingAdvertisementCustomer?requestId=${uiParentRequests.id}&"
                                                                          "phone=${uiParentRequests.advertiser?.phone}&whatsapp${uiParentRequests.advertiser?.phone}");

                                                                }
                                                                print("status is # ${controller.parentRequests[index].status}  ${uiParentRequests!.statusTxt} ${uiParentRequests!.statusTxt == "ملغي من المعلن"}");

                                                              },
                                                              child: Column(
                                                                children: [
                                                                  Text("${uiParentRequests!.statusTxt}",style: TextStyle( fontSize: 15.sp,color: Color(0xffD37A47),height: 1.5),),
                                                                  if(uiParentRequests!.remainingDays != "null")  if(uiParentRequests!.remainingDays != "")  if(uiParentRequests!.remainingDays != null)
                                                                    if(uiParentRequests!.executionDate != "null")  if(uiParentRequests!.executionDate != "")  if(uiParentRequests!.executionDate != null)  Row(
                                                                    children: [
                                                                     Text("${uiParentRequests!.executionDate??""}",style: TextStyle( fontSize: 13.sp,color: Color(0xff636363),height: 1.5),),
                                                                      const SizedBox(width: 5,),
                                                                      Text("بعد ${uiParentRequests!.remainingDays} ايام",style: TextStyle( fontSize: 13.sp,color: Color(0xff1A9B40),height: 1.5),),
                                                                    ],
                                                                  )

                                                                ],
                                                              ),
                                                            ),


                                                            const SizedBox(
                                                              width: 1,
                                                            ),
                                                          ],
                                                        )),

                                                        Container(
                                                          height: 40,
                                                          width: 1,
                                                          color: Colors.black54,
                                                          margin: EdgeInsets.symmetric(horizontal: 15),
                                                        ),

                                                        InkWell(
                                                          onTap: (){
                                                            Get.put(AdvertiserOrderDetailsController()).requestId=int.parse(uiParentRequests!.id.toString() );
                                                            Get.put(AdvertiserOrderDetailsController()).fetchOderDetails(requestId: uiParentRequests!.id);
                                                            Get.toNamed('/AdvertiserOrderDetails');//CustomerOrderInvoiceOutPutsPage
                                                          },
                                                          child: Padding(
                                                            padding: const EdgeInsets.symmetric(horizontal: 15),
                                                            child: Text("تفاصيل الطلب",style: TextStyle(decoration: TextDecoration.underline, fontSize: 15.sp,color: Color(0xff244094),height: 1.5),),
                                                          ),
                                                        )
                                                        ,
                                                      ],
                                                    ),
                                                  ),

                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 45,
                                          right: MediaQuery.of(context).size.width * .73,
                                          left: 10,
                                          bottom: controller.checkListShare!.contains(uiParentRequests!.id)? 15 : double.infinity,
                                          child : controller.checkListShare!.contains(uiParentRequests!.id)?
                                          // AnimatedContainer(
                                          //   duration: const Duration(milliseconds: 500),
                                          FadeInDown(
                                            child: Container(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  InkWell(
                                                    onTap: (){
                                                      // launchURL("whatsapp://send?phone=${uiParentRequests!.user!.whatsapp}");
                                                      launchURL("https://wa.me/${uiParentRequests!.advertiser!.whatsapp}?text=Hello");
                                                    },
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,

                                                      children: [
                                                        Container(
                                                          padding:const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                                          decoration: const BoxDecoration(
                                                            color: Colors.white54,
                                                            borderRadius: BorderRadius.all(
                                                              Radius.circular(10.0),
                                                            ),
                                                          ),
                                                          child: Center(
                                                            child: FaIcon(FontAwesomeIcons.whatsapp,color: Color(0xff148253),size: 35.sp,),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ), InkWell(
                                                    onTap: (){

                                                    },
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,

                                                      children: [
                                                        Container(
                                                          padding:const EdgeInsets.symmetric(horizontal: 15,vertical: 12),
                                                          decoration: const BoxDecoration(
                                                            color: Colors.white54,
                                                            borderRadius: BorderRadius.all(
                                                              Radius.circular(10.0),
                                                            ),
                                                          ),
                                                          child: Center(
                                                            child: FaIcon(FontAwesomeIcons.commentDots,color: Colors.white,size: 35.sp,),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              // color: Colors.black45,
                                              decoration: const BoxDecoration(
                                                gradient:   LinearGradient(
                                                    begin: Alignment.topRight,
                                                    end: Alignment.bottomRight,
                                                    colors: [
                                                      Color(0xff6fd3de),
                                                      Color(0xff486ac7),
                                                    ]
                                                ),        borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                              ),
                                            ),
                                          ):Container(),
                                        ),


                                        Positioned(
                                          top: 3,
                                          right: 0,
                                          bottom: 3,
                                          // left: controller.checkListFunctions!.contains(uiParentRequests!.id) ? MediaQuery.of(context).size.width * .3 :double.infinity ,
                                          child: AnimatedContainer(
                                            duration:const Duration(milliseconds: 400),
                                            width:  controller.checkListFunctions!.contains(uiParentRequests!.id) ? MediaQuery.of(context).size.width * .7 : 0,
                                            curve: Curves.fastOutSlowIn,
                                            decoration: const BoxDecoration(
                                              borderRadius:  BorderRadius.only(
                                                bottomRight:  Radius.circular(10.0),
                                                topRight:  Radius.circular(10.0),
                                              ),
                                              gradient:   LinearGradient(
                                                  begin: Alignment.topRight,
                                                  end: Alignment.bottomRight,
                                                  colors: [
                                                    Color(0xff6fd3de),
                                                    Color(0xff486ac7),
                                                  ]
                                              ),
                                            ),
                                            child: Container(

                                              padding: EdgeInsets.all(15),
                                              child: controller.checkListFunctions!.contains(uiParentRequests!.id) ? Row(
                                                children: [
                                                  Expanded(
                                                    child:

                                                    AdvertisingRequestsSlideRightItemsWraper(
                                                      firstWidget: AdvertisingRequestsSlideRightItemWidget(
                                                        isSvg: true,
                                                        isClickable: uiParentRequests!.statuses!.pricing,
                                                        title: "تسعير الطلب",
                                                        onPress: (){

                                                          _advertisingRequestsController.isRepricing = false;
                                                          _advertiserInvoiceInputsController.reset();
                                                          _advertiserInvoiceInputsController.user = uiParentRequests!.user;
                                                          _advertiserInvoiceInputsController.requestId = uiParentRequests!.id;

                                                          Get.toNamed(
                                                            '/AdvertiserInvoiceInputs',
                                                            // arguments: uiParentRequests!.user
                                                          );
                                                        },
                                                        icon: "images/dollar-bill-line.svg",
                                                        widgetOpacity: uiParentRequests!.statuses!.pricing! ? 1 : .4,
                                                        // checkOpacity:  uiParentRequests!.statuses!.pricing! ? 0 : .4,
                                                      ),
                                                      secondWidget: AdvertisingRequestsSlideRightItemWidget(
                                                        isSvg: true,
                                                        isClickable: uiParentRequests!.statuses!.editPricing,
                                                        title: "إعادة تسعير",
                                                        onPress: (){

                                                          print("isRepricing => ${_advertisingRequestsController.isRepricing}");
                                                          _advertisingRequestsController.isRepricing = true;
                                                          _advertiserInvoiceInputsController.reset();

                                                          _advertiserInvoiceInputsController.fetchShowRequestBill(requestId: uiParentRequests!.id);
                                                          _advertiserInvoiceInputsController.user = uiParentRequests!.user;
                                                          _advertiserInvoiceInputsController.requestId = uiParentRequests!.id;
                                                          Get.toNamed(
                                                            '/AdvertiserInvoiceInputs',
                                                            // arguments: uiParentRequests!.user
                                                          );
                                                        },
                                                        icon: "images/dollar-bill-line.svg",
                                                        widgetOpacity: uiParentRequests!.statuses!.editPricing!? 1 : .4,
                                                        // checkOpacity:  uiParentRequests!.statuses!.editPricing == false ? 0 : .4,
                                                      ),
                                                    ),


                                                  ),


                                                  AdvertisingRequestsSlideRightItemsSeparation(),



                                                  Expanded(
                                                      child: AdvertisingRequestsSlideRightItemsWraper(
                                                        firstWidget: AdvertisingRequestsSlideRightItemWidget(
                                                          isSvg: true,
                                                          isClickable: uiParentRequests!.statuses!.confirmTransfer,

                                                          title: "تأكيد التحويل",
                                                          onPress: (){
                                                            print("refuse1");
                                                            controller.confirmTransferService(requestId:uiParentRequests!.id );
                                                          },
                                                          icon: "images/Outline.svg",
                                                          widgetOpacity: uiParentRequests!.statuses!.confirmTransfer!? 1 : .4,
                                                          // checkOpacity:  uiParentRequests!.statuses!.confirmTransfer == false ? 0 : .4,
                                                        ),
                                                        secondWidget:  AdvertisingRequestsSlideRightItemWidget(
                                                          isSvg: true,
                                                          isClickable: uiParentRequests!.statuses!.confirmTransfer,

                                                          title: "رفض التحويل",
                                                          onPress: (){
                                                            print("refuse2");
                                                            controller.rejectTransferService(requestId:uiParentRequests!.id );
                                                          },
                                                          icon: "images/Outline.svg",
                                                          widgetOpacity: uiParentRequests!.statuses!.confirmTransfer! ? 1 : .4,
                                                          // checkOpacity:  uiParentRequests!.statuses!.confirmTransfer == true ? 0 : .4,
                                                        ),
                                                      )),


                                                  AdvertisingRequestsSlideRightItemsSeparation(),


                                                  Expanded(
                                                      child: AdvertisingRequestsSlideRightItemsWraper(
                                                        firstWidget: AdvertisingRequestsSlideRightItemWidget(
                                                          isSvg: true,
                                                          title: "تم تنفيذ الاعلان",
                                                          isClickable: uiParentRequests!.statuses!.confirmFinished,

                                                          onPress: (){
                                                            controller.advertiserConfirmService(requestId:uiParentRequests!.id );
                                                          },
                                                          icon: "images/advertising.svg",
                                                          widgetOpacity: uiParentRequests!.statuses!.confirmFinished! ? 1 : .4,
                                                          checkOpacity:  uiParentRequests!.statuses!.confirmFinished! ? .04 : 0,
                                                        ),
                                                        secondWidget:    AdvertisingRequestsSlideRightItemWidget(
                                                          isSvg: true,
                                                          isClickable: uiParentRequests!.statuses!.reject!,
                                                          title: "رفض الطلب",
                                                          onPress: (){
                                                            print("refuse3 ${uiParentRequests!.statuses!.reject} ${controller.parentRequests[index].statuses?.reject}");

                                                              controller.currentIndex.value=index;
                                                              print("refuse3 ${controller.currentIndex.value  == index}");

                                                              if (controller.currentIndex.value  ==index) {
                                                                CoolAlert.show(
                                                                    context: context,
                                                                    title:
                                                                    "رفض التسعير",
                                                                    type: CoolAlertType.info,
                                                                    //text: "Your transaction was successful!",
                                                                    widget: SizedBox(
                                                                      width: 323.w,
                                                                      height: 120.h,
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
                                                                      ),
                                                                    ),
                                                                    confirmBtnText:
                                                                    "حفظ",
                                                                    onConfirmBtnTap:
                                                                        () {
                                                                      controller.rejectRequestService(
                                                                          requestId: controller
                                                                              .parentRequests[
                                                                          index].id ?? 0);
                                                                      Get.back();
                                                                    },//cancelBtnTextStyle:TextStyle(color: Colors.blue) ,
                                                                    cancelBtnText:
                                                                    "الغاء",showCancelBtn: true,
                                                                    onCancelBtnTap: () {
                                                                      Get.back();
                                                                    });
                                                                print("refuse");
                                                              }

                                                             // controller.rejectRequestService(requestId:uiParentRequests!.id );
                                                      /*      controller.parentRequests[index].status == "مرفوض منى"
                                                                ? () {
                                                              controller.currentIndex.value=index;
                                                              if (controller.currentIndex.value  == index) {
                                                                Get.toNamed(
                                                                    "/ReasonRejectingAdvertisement?requestId=${controller.parentRequests[index].id}&"
                                                                        "phone=${controller.parentRequests[index].advertiser?.phone}&whatsapp${controller.parentRequests[index].advertiser?.whatsapp}");
                                                              }
                                                            }:
                                                            controller.parentRequests[index].status == "مرفوض من العميل"
                                                                ? () {controller.currentIndex.value=index;
                                                              if (controller.currentIndex.value  == index) {
                                                                Get.toNamed(
                                                                    "/ReasonRejectingAdvertisementCustomer?requestId=${controller.parentRequests[index].id}&"
                                                                        "phone=${controller.parentRequests[index].advertiser?.phone}&whatsapp${controller.parentRequests[index].advertiser?.phone}");
                                                              }
                                                            }:null;*/


                                                          },
                                                          icon: "images/remove-line.svg",
                                                          widgetOpacity: uiParentRequests!.statuses!.reject! ? 1 : .4,
                                                          // checkOpacity:  uiParentRequests!.statuses!.reject == false ? 0 : .4,
                                                        ),
                                                      )
                                                  ),
                                                ],
                                              ):Container(),
                                            ),
                                          ),
                                        ),


                                        Positioned(
                                          top:3,
                                          right: 0,
                                          bottom: 3,
                                          child: Container(
                                            width: 15,
                                            decoration: const BoxDecoration(
                                                gradient:   LinearGradient(
                                                  begin: Alignment.topRight,
                                                  end: Alignment.bottomRight,
                                                  colors: [
                                                    Color(0xff6fd3de),
                                                    Color(0xff486ac7),
                                                  ],
                                                ),
                                                borderRadius:  BorderRadius.only(
                                                  bottomRight: const Radius.circular(10.0),
                                                  topRight: const Radius.circular(10.0),
                                                )
                                            ),
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
                                        Positioned(
                                            top: 5,
                                            right: 0,
                                            left: 0,
                                            bottom: 5,
                                            child: controller.checkListClickProfile!.contains(uiParentRequests!.id) ?  ClickPictureWidget(parentRequests: uiParentRequests!,): Container())

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

                // controller.tabId

                // const ProcessesWidget()
              ],
            ),
          ):const Center(
            child: Text("لا توجد طلبات"),
          ),
        ));
  }
}

