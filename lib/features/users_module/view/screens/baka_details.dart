import 'dart:ui';

import 'package:advertisers/app_core/network/models/PeriodModel.dart';
import 'package:advertisers/features/users_module/controller/baka_details_controller.dart';
import 'package:advertisers/features/users_module/controller/choose_baka_controller.dart';
import 'package:advertisers/features/users_module/view/cards/advantages_baka_card.dart';
import 'package:advertisers/features/users_module/view/usedWidgets/advertisers_button.dart';
import 'package:advertisers/features/users_module/view/usedWidgets/advertisers_dropdown.dart';
import 'package:advertisers/features/users_module/view/usedWidgets/advertisers_generic_field.dart';
//import 'package:advertisers/shared/network/models/PeriodModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_carousel_widget/flutter_carousel_indicators.dart';
import 'package:flutter_carousel_widget/flutter_carousel_options.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../app_colors.dart';

class BakaDetails extends StatelessWidget {
   BakaDetails({Key? key}) : super(key: key);
  // final BakaDetailsController _registerPhoneController=Get.find();

   final BakaDetailsController _bakaDetailsController = Get.find();
  @override
  Widget build(BuildContext context) {
   /* if(blocOfWidgets.isEmpty) {
      buildItems();
    }*/
    return Scaffold(
      backgroundColor: AppColors.verifyFayrouzyFirst,
      body: SafeArea(

        child:
        Obx(()=>!_bakaDetailsController.isLoading.value?Container(
          height: 812.0.h,
          width: 375.0.w,
          decoration: const BoxDecoration(
            color: AppColors.verifyFayrouzyFirst,
            gradient: LinearGradient(
                colors: [
                  AppColors.verifyFayrouzyFirst,
                  AppColors.verifyBlueSecond,
                  AppColors.verifyGreenThird
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, 1.6, .9]),
          ),
          child: SizedBox(
            // height: 169.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 169.h,
                  width: 362.w,
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      boxShadow: [
                        BoxShadow(
                            color:
                            AppColors.bakaBoxShadowColor.withOpacity(.93),
                            blurStyle: BlurStyle.inner,
                            blurRadius: 0,
                            spreadRadius: -50)
                      ],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(7),
                          topRight: Radius.circular(7))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.5.w),
                    child: SizedBox(
                      height: 169.h,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                      child: Obx(()=>Text( _bakaDetailsController.subscriptionBakaDetail.value.name?.toString()??"",
                                          style: TextStyle(
                                              fontSize: 27.sp,
                                              color: AppColors.bakaDetailsTextColor,
                                              fontFamily: 'Arabic-Regular')),
                                      )),
                                  Row(
                                    children: [
                                      SizedBox(
                                          child: Stack(alignment: Alignment.center, children: [
                                            SizedBox(
                                              child:
                                              Obx(()=>
                                                  Text(
                                                      _bakaDetailsController.subscriptionBakaDetail.value.first_period?.price?.toString()??"",style:TextStyle(color: AppColors.bakaPriceColor,fontSize: 16.sp)
                                                  ),
                                              ),
                                            ),
                                            // ),
                                            SizedBox(
                                              child: RotationTransition(
                                                turns:  AlwaysStoppedAnimation(25 / 360),
                                                child:  Text(
                                                  "/",
                                                  style: TextStyle(fontSize: 25.sp),
                                                ),
                                              ),
                                            )
                                          ])),
                                      SizedBox(
                                        child: Text(
                                            '  /  ',style:TextStyle(color: AppColors.arrowBlueColor,fontSize: 18.sp)
                                        ),),
                                      SizedBox(
                                        child:
                                        Obx(()=>
                                            Text(
                                                '${_bakaDetailsController.subscriptionBakaDetail.value.first_period?.price_after_discount ?? ""}',style:TextStyle(color: AppColors.bakaPriceColor,fontSize: 16.sp)
                                            ),
                                        ),
                                      ),

                                      SizedBox(
                                        child: Container(
                                          margin: EdgeInsets.only(right: 24.0),
                                          child: Obx(()=>Text(
                                              ' ${(_bakaDetailsController.subscriptionBakaDetail.value.first_period?.months_count??"")} أشهر ',style:TextStyle(color: AppColors.arrowBlueColor,fontSize: 16.sp)
                                          ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  /*SizedBox(
                                    child: RichText(
                                      text: TextSpan(
                                        text: '1200 ',
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            color: AppColors.bakaPriceColor),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: 'سنوي',
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  color: AppColors
                                                      .bakaDetailsTextColor,
                                                  fontFamily: 'Arabic-Regular')),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    child: RichText(
                                      text: TextSpan(
                                        text: '1200 ',
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            color: AppColors.bakaPriceColor),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: 'شهري',
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  color: AppColors
                                                      .bakaDetailsTextColor)),
                                        ],
                                      ),
                                    ),
                                  ),*/
                                ],
                              ),
                              Padding(
                                padding:
                                EdgeInsetsDirectional.only(start: 15.6.w),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'images/bakaDetails.png',
                                        height: 79.52.h,
                                        width: 119.5.w,
                                        fit: BoxFit.fitHeight,
                                      ),
                                      // SizedBox(height: 28.h,),
                                      SizedBox(
                                        height: 35.h,
                                        child:  Obx(()=> Text(
                                          'تجربة مجانية لمدة ' + (_bakaDetailsController.subscriptionBakaDetail.value.first_period?.free_days?.toString()??"")+' أيام ' ,
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                              color: AppColors.arrowBlueColor,
                                              fontSize: 12.sp),
                                        ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                              child: Text(
                                'مدة مجانية اضافية على الاشتراك السنوي 3 أشهر',
                                style: TextStyle(
                                    color: AppColors.arrowBlueColor, fontSize: 15.sp),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  // alignment: Alignment.topCenter,
                    width: 362.w,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.bakaBoxShadowColor.withOpacity(.93),
                            blurStyle: BlurStyle.inner,
                            blurRadius: 0,
                            spreadRadius: -50)
                      ],
                      //borderRadius: BorderRadius.only(topLeft: Radius.circular(7),topRight:Radius.circular(7) )
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.5.w),
                      child: Column(
                        children: [
                          SizedBox(
                            child: Text(
                              'هل تريد تجربة مجانية لمدة شهر',
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  color: AppColors.bakaPriceColor),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Column(
                              children: [
                                SizedBox(
                                  child: Text(
                                    'مميزات الباقة',
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        color: AppColors.arrowBlueColor),
                                  ),
                                ),
                                Container(
                                  height: 2,
                                  width: 99.w,
                                  color: AppColors.bakaPriceColor,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            child:  Obx(()=> Text(
                              ' نقاط المعلن : ${(_bakaDetailsController.subscriptionBakaDetail.value.commission?.toString()??"")} % من عمولة المنصة للفواتير المدفوعة داخل المنصة ',
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  color: AppColors.arrowBlueColor),
                            ),
                            ),
                          ),

                          SizedBox(
                            width: 325.w,
                            child: Obx(()=>_bakaDetailsController.blocOfWidgets.isNotEmpty?FlutterCarousel(
                              options: CarouselOptions(viewportFraction: 1,height: 320.h,
                                showIndicator: true,
                                slideIndicator: CircularSlideIndicator(indicatorBackgroundColor: AppColors.carouselIndicatorUnSelectedColor,
                                    currentIndicatorColor: AppColors.carouselIndicatorColor,
                                    padding:EdgeInsets.only(top: 80.h) ),),
                              items:  _bakaDetailsController.blocOfWidgets.map((i) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return SizedBox(

                                      child: SingleChildScrollView(
                                        child: Column(
                                          //key: Key('$i'),
                                          children:
                                          i,

                                        ),
                                      ),
                                    );
                                    //   Container(
                                    //       width: MediaQuery.of(context).size.width,
                                    //       margin: EdgeInsets.symmetric(horizontal: 5.0),
                                    //       decoration: BoxDecoration(
                                    //           color: Colors.amber
                                    //       ),
                                    //       child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                                    // );
                                  },
                                );
                              }).toList(),
                            ):SizedBox(),
                            ),),

                        ],
                        //  >>>>>>> 50e1d0cf31340f98832d344660f19052c708ef8c
                      ),
                    )),
                SizedBox(
                  height: 5,
                ),
                Container(
                  // alignment: Alignment.topCenter,
                  padding: EdgeInsetsDirectional.only(top: 5.h,bottom: 15.h),
                  width: 362.w,
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      boxShadow: [
                        BoxShadow(
                            color:
                            AppColors.bakaBoxShadowColor.withOpacity(.93),
                            blurStyle: BlurStyle.inner,
                            blurRadius: 0,
                            spreadRadius: -50)
                      ],
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(7),
                          bottomRight: Radius.circular(7))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AdvertisersButton(
                        text: 'أختر باقة',
                        onPressed: () async{
                          await bottomSheet(context);
                          //Get.toNamed('/payVerification');
                        },
                        backgroundColor: AppColors.blueAccentColor,
                        width: 146.w,
                      ),
                      AdvertisersButton(
                        text: 'رجوع',
                        onPressed: () {
                          Get.back();
                        },
                        backgroundColor: AppColors.verifyButtonColor,
                        width: 146.w,
                        textColor: AppColors.verifyTextColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
            :Container(
          margin: EdgeInsets.only(top:20.0),
          alignment: Alignment.topCenter,
          child: CircularProgressIndicator(),)
        ),)
      //),
    );
  }
/*   List<String> items=['كيو آر كود خاص بصفحة المعلن / المؤثر','إمكانية إيقاف استقبال رسائل الشات','إمكانية حفظ محتوى المعرض على سيرفر المنصة',
     'إمكانية إيقاف استقبال رسائل الشات','إمكانية ربط الإعلان بعنوان محدد','إمكانية اختيار نشاطات محددة للمعلن','إمكانية الحصول على تقارير أكثر تفصيلاً',
     'إمكانية إيقاف استقبال الطلبات','إمكانية إيقاف استقبال الطلبات','كيو آر كود خاص بصفحة المعلن / المؤثر','إمكانية إيقاف استقبال رسائل الشات','إمكانية حفظ محتوى المعرض على سيرفر المنصة',
     'إمكانية إيقاف استقبال رسائل الشات','إمكانية ربط الإعلان بعنوان محدد','إمكانية اختيار نشاطات محددة للمعلن','إمكانية الحصول على تقارير أكثر تفصيلاً',
     'إمكانية إيقاف استقبال الطلبات','إمكانية إيقاف استقبال الطلبات'];*/
  //  List<List<Widget>> blocOfWidgets=[];
  //  List<Widget> itemsAsWidgets=[];
  //  // List<List<String>> blocOfWidgetst=[];
  //  // List<String> itemsAsWidgetst=[];
  //  List<List<Widget>> buildItems(List<String> items){
  //
  //
  //
  //   int counter=0,iterate=(items.length/9).floor();
  //   for(String text in items){
  //
  //     itemsAsWidgets.add(AdvantagesBakaCard(//key: ValueKey(counter),
  //       text: text,
  //     ),);
  //     print(itemsAsWidgets.length%9);
  //     if(itemsAsWidgets.length%9==0){
  //
  //       print(itemsAsWidgets.length);
  //       blocOfWidgets.add(itemsAsWidgets.toList());
  //       counter++;
  //       itemsAsWidgets.clear();
  //     }else if(blocOfWidgets.isNotEmpty&&itemsAsWidgets.isNotEmpty&&counter>0&&itemsAsWidgets.length<9&&items.length>9&&counter<iterate){
  //       blocOfWidgets.add(itemsAsWidgets.toList());
  //       print(itemsAsWidgets.length);
  //       counter++;
  //     }else if(blocOfWidgets.isNotEmpty&&itemsAsWidgets.isNotEmpty&&counter==0&&itemsAsWidgets.length<9&&items.length<9){
  //       blocOfWidgets.add(itemsAsWidgets.toList());
  //       //return [];
  //       print(itemsAsWidgets.length);
  //       counter++;
  //     }
  //   }
  //   print('>>>>>>>>>>>>>>>>>>>>>>>>> ${20%9}');
  //   return blocOfWidgets;
  //
  // }

  Future bottomSheet(BuildContext context){

    return  showMaterialModalBottomSheet(
      context: context,
      builder: (context) =>

          SafeArea(
            child: Container(
            height:810.h ,
            decoration: const BoxDecoration(
              color: AppColors.verifyFayrouzyFirst,
              gradient: LinearGradient(
                  colors: [
                    AppColors.verifyFayrouzyFirst,
                    AppColors.verifyBlueSecond,
                    AppColors.verifyGreenThird
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0, 1.6, .9]),
            ),

            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child:InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(end:32.8.w),
                        child: Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: SvgPicture.asset('images/arrow_back_register.svg',height: 47.h,fit: BoxFit.fitHeight),

                        ),
                      ),
                    ) ,
                  ),
                  SizedBox(height: 141.5.h,),
                  Container(
                    //height: 169.h,
                    //height:572.h ,
                    width: 362.w,
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        boxShadow: [
                          BoxShadow(
                              color:
                              AppColors.bakaBoxShadowColor.withOpacity(.93),
                              blurStyle: BlurStyle.inner,
                              blurRadius: 0,
                              spreadRadius: -50)
                        ],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(7),
                            topRight: Radius.circular(7))),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.5.w),
           
           
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    child: Text(_bakaDetailsController.subscriptionBakaDetail.value.name??"",
                                        style: TextStyle(
                                            fontSize: 27.sp,
                                            color: AppColors.bakaDetailsTextColor,
                                            fontFamily: 'Arabic-Regular')),
                                  ),
                                  Container(
                                    height: 2,
                                    width: 130.w,
                                    color: AppColors.bakaPriceColor,
                                  ),
                                  SizedBox(height: 19.h,),
                                  Row(
                                    children: [
                                      SizedBox(
                                          child: Stack(alignment: Alignment.center, children: [
                                            SizedBox(
                                              child: Text(
                                                  _bakaDetailsController.subscriptionBakaDetail.value.first_period?.price?.toString()??"",style:TextStyle(color: AppColors.bakaPriceColor,fontSize: 16.sp)
                                              ),
                                            ),
                                            SizedBox(
                                              child: RotationTransition(
                                                turns:  AlwaysStoppedAnimation(25 / 360),
                                                child:  Text(
                                                  "/",
                                                  style: TextStyle(fontSize: 25.sp),
                                                ),
                                              ),
                                            )
                                          ])),
                                      SizedBox(
                                        child: Text(
                                            '  /  ',style:TextStyle(color: AppColors.arrowBlueColor,fontSize: 18.sp)
                                        ),),
                                      SizedBox(
                                        child: Text(
                                            '${_bakaDetailsController.subscriptionBakaDetail.value.first_period?.price_after_discount ?? ""}',style:TextStyle(color: AppColors.bakaPriceColor,fontSize: 16.sp)
                                        ),
                                      ),
                                      SizedBox(
                                        child: Container(
                                          margin: EdgeInsets.only(right: 24.0),
                                          child: Text(
                                              ' ${(_bakaDetailsController.subscriptionBakaDetail.value.first_period?.months_count??"")} أشهر ',style:TextStyle(color: AppColors.arrowBlueColor,fontSize: 16.sp)
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  /*SizedBox(
                                    child: RichText(
                                      text: TextSpan(
                                        text: '1200 ',
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            color: AppColors.bakaPriceColor),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: ' /   ',
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  color: AppColors
                                                      .bakaDetailsTextColor)),
                                          TextSpan(
                                              text: 'سنوي',
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  color: AppColors
                                                      .bakaDetailsTextColor,
                                                  fontFamily: 'Arabic-Regular')),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    child: RichText(
                                      text: TextSpan(
                                        text: '120 ',
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            color: AppColors.bakaPriceColor),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: ' /   ',
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  color: AppColors
                                                      .bakaDetailsTextColor)),
                                          TextSpan(
                                              text: 'شهري',
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  color: AppColors
                                                      .bakaDetailsTextColor)),
                                        ],
                                      ),
                                    ),
                                  ),*/
                                ],
                              ),
                              Padding(
                                padding:
                                EdgeInsetsDirectional.only(start: 15.6.w),
                                child: Column(
                                  children: [
                                    /*Image.asset(
                                      'images/bakaDetails.png',
                                      height: 79.52.h,
                                      width: 119.5.w,
                                      fit: BoxFit.fitHeight,
                                    ),*/
                                    Container(
                                      margin: EdgeInsets.only(top: 10.0),
                                      child: _bakaDetailsController.subscriptionBakaDetail.value.image!=null && _bakaDetailsController.subscriptionBakaDetail.value.image!=""?Image.network(
                                        _bakaDetailsController.subscriptionBakaDetail.value.image!,
                                        height: 79.52.h,
                                        width: 119.5.w,
                                        fit: BoxFit.fitHeight,
                                      ):Image.asset(
                                        'images/bakaDetails.png',
                                        height: 79.52.h,
                                        width: 119.5.w,
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                    // SizedBox(height: 28.h,),
                                    SizedBox(
                                      height: 35.h,
                                      child: Text(
                                        'تجربة مجانية لمدة '+ (_bakaDetailsController.subscriptionBakaDetail.value.first_period?.free_days?.toString()??"") + ' أيام ' ,
                                        style: TextStyle(
                                            color: AppColors.arrowBlueColor,
                                            fontSize: 12.sp),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                              child: Text(
                                'مدة مجانية اضافية على الاشتراك السنوي 3 أشهر',
                                style: TextStyle(
                                    color: AppColors.arrowBlueColor, fontSize: 15.sp),
                              )),
                          SizedBox(height: 22.h,),
                          Container(
                            height: 2,
                            width: 362.w,
                            color: AppColors.bakaPriceColor,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  SizedBox(height: 31.h,),
                                  SizedBox(
                                    child: Text('اختر مدة الاشتراك',style: TextStyle(
                                        color: AppColors.arrowBlueColor, fontSize: 18.sp),),
                                  ),
                                  AdvertisersDropDown(hintText: 'مدة الاشتراك',width:217.w,items: _bakaDetailsController.subscriptionBakaDetail.value.periods!,itemType: "bakaDetails",
                                    onChanged: (period){
                                      _bakaDetailsController.changePeriod((period as PeriodModel).id!);
                                    },
                                  ),
                                  SizedBox(height:20.h),
                                  AdvertisersGenericField(textAlignment:TextAlign.center, obscureText: false, controller: _bakaDetailsController.discountCodeController,width:217.w, hintText: 'أدخل كود الخصم التسويقي'),
                                  SizedBox(height:16.h),
                                  GetBuilder(
                                      init: _bakaDetailsController,
                                      builder: (_)=>Container(
                                    height: 62.h,
                                    width: 217.w,
                                    alignment:Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: AppColors.blueAccentColor,
                                    ),
                                    child: Obx(()=>RichText(
                                        text: TextSpan(
                                          text: _bakaDetailsController.priceAfterDiscount.value>-1?_bakaDetailsController.priceAfterDiscount.value.toString()??"":_bakaDetailsController.subscriptionBakaDetail.value.first_period?.price_after_discount.toString()??"",
                                          style: TextStyle(
                                              fontSize: 24.sp,
                                              color: AppColors.whiteColor),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: ' ر.س ',
                                                style: TextStyle(
                                                    fontSize: 16.sp,
                                                    color: AppColors
                                                        .whiteColor,
                                                    fontFamily: 'Arabic-Regular')),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ))
                                ],
                              ),
                              Material(
                                  elevation:3,
                                  borderRadius: BorderRadius.circular(6),
                                  child: InkWell(
                                      onTap: (){
                                        if(_bakaDetailsController.periodId==-1){
                                          /*ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                            content: const Text('يرجى اختيار مدة الإشتراك !',style: TextStyle(color: AppColors.whiteColor,fontSize: 17,fontFamily: 'Arabic-Regular'),),
                                          ));*/
                                          Fluttertoast.showToast(
                                              msg: 'يرجى اختيار مدة الإشتراك !',
                                              toastLength: Toast.LENGTH_LONG,
                                              gravity: ToastGravity.BOTTOM,
                                              fontSize: 16.0
                                          );
                                          //return;
                                        }else{
                                          _bakaDetailsController.checkCopon(context);
                                        }
                                      },
                                      child: SvgPicture.asset('images/refresh.svg',height: 100.h,width: 84.w,fit: BoxFit.fitHeight))),
                            ],
                          ),
                          SizedBox(height:63.h),
                          AdvertisersButton(text: 'ادفع الآن', onPressed: (){
                            print("h]tu");
                            if(_bakaDetailsController.periodId==-1){
                              Fluttertoast.showToast(
                                  msg: 'يرجى اختيار مدة الإشتراك !',
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  fontSize: 16.0
                              );
                             /* ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: const Text('يرجى اختيار مدة الإشتراك !',style: TextStyle(color: AppColors.whiteColor,fontSize: 17,fontFamily: 'Arabic-Regular'),),
                              ));*/
                              //return;
                            }else{
                              Get.toNamed('/payVerification');
                            }
                          }),
                          SizedBox(height:13.h),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            )
      ),
          ),
      barrierColor: Colors.red[50],
     // backgroundColor: ,
      isDismissible: false,enableDrag: true,
    );
  }
}
