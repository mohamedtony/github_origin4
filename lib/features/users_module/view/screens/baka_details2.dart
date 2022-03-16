import 'package:advertisers/app_core/network/models/Area.dart';
import 'package:advertisers/app_core/network/models/PeriodModel.dart';
import 'package:advertisers/features/users_module/app_colors.dart';
import 'package:advertisers/features/users_module/controller/baka_details_controller.dart';
import 'package:advertisers/features/users_module/view/usedWidgets/advertisers_button.dart';
import 'package:advertisers/features/users_module/view/usedWidgets/advertisers_dropdown.dart';
import 'package:advertisers/features/users_module/view/usedWidgets/advertisers_generic_field.dart';
import 'package:advertisers/shared/loading_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class PayVerification2 extends StatelessWidget {
  PayVerification2({Key? key}) : super(key: key);
  final BakaDetailsController _bakaDetailsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.verifyFayrouzyFirst.withOpacity(.99),
        body: SafeArea(
            child: ListView(
              children: [ Container(
                //height:810.h ,
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
                              borderRadius: const BorderRadius.only(
                                  topLeft: const Radius.circular(7),
                                  topRight: const Radius.circular(7))),
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
                                            child: Obx(()=>Text(_bakaDetailsController.subscriptionBakaDetail.value.name??"",
                                                style: TextStyle(
                                                    fontSize: 27.sp,
                                                    color: AppColors.bakaDetailsTextColor,
                                                    fontFamily: 'Arabic-Regular')))
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
                                                    child: Obx(()=>Text(
                                                        _bakaDetailsController.subscriptionBakaDetail.value.first_period?.price?.toString()??"",style:TextStyle(color: AppColors.bakaPriceColor,fontSize: 16.sp)
                                                    )),
                                                  ),
                                                  _bakaDetailsController.subscriptionBakaDetail.value.first_period?.price_after_discount!=null ?SizedBox(
                                                    child: RotationTransition(
                                                      turns:  const AlwaysStoppedAnimation(25 / 360),
                                                      child:  Text(
                                                        "/",
                                                        style: TextStyle(fontSize: 25.sp),
                                                      ),
                                                    ),
                                                  )
                                                :const SizedBox()])),
                                            _bakaDetailsController.subscriptionBakaDetail.value.first_period?.price_after_discount!=null ?SizedBox(
                                              child: Text(
                                                  '  /  ',style:TextStyle(color: AppColors.arrowBlueColor,fontSize: 18.sp)
                                              ),):const SizedBox(),
                                            _bakaDetailsController.subscriptionBakaDetail.value.first_period?.price_after_discount!=null ? SizedBox(
                                              child: Obx(()=>Text(
                                                  '${_bakaDetailsController.subscriptionBakaDetail.value.first_period?.price_after_discount ?? ""}',style:TextStyle(color: AppColors.bakaPriceColor,fontSize: 16.sp)
                                              )),
                                            ):const SizedBox(),
                                            SizedBox(
                                              child: Container(
                                                margin: const EdgeInsets.only(right: 24.0),
                                                child: Obx(()=>Text(
                                                    ' ${(_bakaDetailsController.subscriptionBakaDetail.value.first_period?.months_count??"")} أشهر ',style:TextStyle(color: AppColors.arrowBlueColor,fontSize: 16.sp)
                                                )),
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
                                            margin: const EdgeInsets.only(top: 10.0),
                                            child: Obx(()=>_bakaDetailsController.subscriptionBakaDetail.value.image!=null && _bakaDetailsController.subscriptionBakaDetail.value.image!.isNotEmpty?Image.network(
                                              _bakaDetailsController.subscriptionBakaDetail.value.image!,
                                              height: 79.52.h,
                                              width: 119.5.w,
                                              fit: BoxFit.fitHeight,
                                            ):Image.asset(
                                              'images/bakaDetails.png',
                                              height: 79.52.h,
                                              width: 119.5.w,
                                              fit: BoxFit.fitHeight,
                                            )),
                                          ),
                                          // SizedBox(height: 28.h,),
                                          _bakaDetailsController.subscriptionBakaDetail.value.first_period?.free_days!=null?SizedBox(
                                            height: 35.h,
                                            child: Text(
                                              'تجربة مجانية لمدة '+ (_bakaDetailsController.subscriptionBakaDetail.value.first_period?.free_days?.toString()??"") + ' أيام ' ,
                                              style: TextStyle(
                                                  color: AppColors.arrowBlueColor,
                                                  fontSize: 12.sp),
                                            ),
                                          ):const SizedBox(),
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
                                          },areas:[Area()],
                                        ),
                                        SizedBox(height:20.h),
                                        AdvertisersGenericField(textAlignment:TextAlign.center, obscureText: false, controller: _bakaDetailsController.discountCodeController,width:217.w, hintText: 'أدخل كود الخصم التسويقي',onChanged: (text){
                                          if(text.isEmpty){
                                            if(_bakaDetailsController.periodId!=-1&&_bakaDetailsController.coponId!=-1) {
                                              print("textEmpty");
                                              _bakaDetailsController.changePeriod(_bakaDetailsController.periodId);
                                            }
                                          }
                                        },),
                                        SizedBox(height:16.h),
                                        Obx(()=>Container(
                                          height: 62.h,
                                          width: 217.w,
                                          alignment:Alignment.center,
                                          decoration: _bakaDetailsController.periodId!=-1?BoxDecoration(
                                            borderRadius: BorderRadius.circular(7),
                                            color: AppColors.blueAccentColor,
                                          ):const BoxDecoration(),
                                          child: RichText(
                                            text: TextSpan(
                                              text: _bakaDetailsController.createSubscriptionModel.value.total?.toString()??'',
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
                                        ))
                                        /*GetBuilder(
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
                                            ))*/
                                      ],
                                    ),
                                    Material(
                                        elevation:3,
                                        borderRadius: BorderRadius.circular(6),
                                        child: InkWell(
                                            onTap: (){
                                              if(_bakaDetailsController.periodId==-1){
                                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                            content: Text('يرجى اختيار مدة الإشتراك !',style: TextStyle(color: AppColors.whiteColor,fontSize: 17,fontFamily: 'Arabic-Regular'),),
                                          ));
                                                /*Fluttertoast.showToast(
                                                    msg: 'يرجى اختيار مدة الإشتراك !',
                                                    toastLength: Toast.LENGTH_LONG,
                                                    gravity: ToastGravity.BOTTOM,
                                                    fontSize: 16.0
                                                );*/
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
                                    if(_bakaDetailsController.discountCodeController.text.isNotEmpty && (/*_bakaDetailsController.coponCode!=null &&*/ _bakaDetailsController.discountCodeController.text!=_bakaDetailsController.coponCode)){
                                      _bakaDetailsController.checkCopon(context,type: "payNow");
                                    }else{
                                      Get.toNamed('/payVerification');
                                    }

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
              ),],
            )));
  }

}


