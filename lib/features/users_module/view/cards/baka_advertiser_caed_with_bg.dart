import 'package:advertisers/app_core/network/models/SubscriptionBaka.dart';
import 'package:advertisers/features/users_module/app_colors.dart';
import 'package:advertisers/features/home_page/app_colors.dart' as mColor;
import 'package:advertisers/features/users_module/controller/choose_baka_controller.dart';
import 'package:advertisers/features/users_module/view/usedWidgets/advertisers_button.dart';
//import 'package:advertisers/shared/network/models/SubscriptionBaka.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as mt;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BakaAdvertiserCardBG extends StatelessWidget {
  BakaAdvertiserCardBG(
      {required this.imageStr,
        required this.bakaName,
        required this.domain,
        required this.price,this.slash,
        required this.subscriptionBaka,
        Key? key, this.index})
      : super(key: key);
  late final String bakaName, domain, imageStr, price;
  late SubscriptionBaka subscriptionBaka;
  int? index;
  final ChooseBakaController _chooseBakaController = Get.find();
  bool? slash;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(12),
      child: GetBuilder(
        init: _chooseBakaController,
        builder:(_)=>_chooseBakaController.indexClicked==index?Container(
          alignment:AlignmentDirectional.centerStart,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color(0xFFE9E9E9),
            border: Border.all(
                color: mColor.AppColors.addPhotoBottom,
                width: 0.5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(start: 26.0.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 54.h,
                      width:171.5.w,
                      alignment:AlignmentDirectional.centerStart,
                      child: Text('${subscriptionBaka.name?? ''}',style: TextStyle(color: AppColors.arrowBlueColor,fontSize: 23.sp),),
                    ),
                    Row(
                      children: [
                        slash==true?  SizedBox(
                            child: Stack(alignment: Alignment.center, children: [
                              SizedBox(
                                child: Text(
                                    subscriptionBaka.first_period?.price?.toString()??"",style:TextStyle(color: AppColors.bakaPriceColor,fontSize: 16.sp)
                                ),
                              ),
                              subscriptionBaka.first_period?.price_after_discount!=null?SizedBox(
                                child: RotationTransition(
                                  turns:  AlwaysStoppedAnimation(25 / 360),
                                  child:  Text(
                                    "/",
                                    style: TextStyle(fontSize: 25.sp),
                                  ),
                                ),
                              ):const SizedBox()
                            ])):const SizedBox(),
                        subscriptionBaka.first_period?.price_after_discount!=null?SizedBox(
                          child: Text(
                              '  /  ',style:TextStyle(color: AppColors.arrowBlueColor,fontSize: 18.sp)
                          ),):const SizedBox(),
                        SizedBox(
                          child: Text(
                              '${subscriptionBaka.first_period?.price_after_discount ?? ""}',style:TextStyle(color: AppColors.bakaPriceColor,fontSize: 16.sp)
                          ),
                        ),
                        SizedBox(
                          child: Container(
                            margin: EdgeInsets.only(right: 24.0),
                            child: Text(
                                ' ${(subscriptionBaka.first_period?.months_count??"")} أشهر ',style:TextStyle(color: AppColors.arrowBlueColor,fontSize: 16.sp)
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 35.h,
                      child: mt.InkWell(
                          onTap: (){
                            _chooseBakaController.changeBakaID( subscriptionBaka.id!);
                              Get.toNamed('/chooseBakaDetails');
                          },
                          child: Text('مميزات الباقة',style:TextStyle(color: AppColors.arrowBlueColor,fontSize: 18.sp,decoration: TextDecoration.underline,fontWeight: FontWeight.w600))),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 15.6.w),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10.0),
                      child: subscriptionBaka.image!=null && subscriptionBaka.image!=""?Image.network(
                        subscriptionBaka.image!,
                        height: 96.h,
                        width: 98.w,
                        fit: BoxFit.fitHeight,
                      ):Image.asset(
                        imageStr,
                        height: 96.h,
                        width: 98.w,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    SizedBox(height: 28.h,),
                    Padding(
                      padding: EdgeInsetsDirectional.only(end :26.6.w),
                      child: SizedBox(
                        height: 35.h,
                        child: Text(' مجانية لمدة ${subscriptionBaka.first_period?.free_days??''} أيام ',style:TextStyle(color: AppColors.arrowBlueColor,fontSize: 12.sp,),textDirection: mt.TextDirection.rtl,
                        ),
                      ),
                    ),

                  ],
                ),
              )
            ],
          ),
        ):Container(
          alignment:AlignmentDirectional.centerStart,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(start: 26.0.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 54.h,
                      width:171.5.w,
                      alignment:AlignmentDirectional.centerStart,
                      child: Text('${subscriptionBaka.name?? ''}',style: TextStyle(color: AppColors.arrowBlueColor,fontSize: 23.sp),),
                    ),
                    Row(
                      children: [
                        slash==true?  SizedBox(
                            child: Stack(alignment: Alignment.center, children: [
                              SizedBox(
                                child: Text(
                                    subscriptionBaka.first_period?.price?.toString()??"",style:TextStyle(color: AppColors.bakaPriceColor,fontSize: 16.sp)
                                ),
                              ),
                              subscriptionBaka.first_period?.price_after_discount!=null?SizedBox(
                                child: RotationTransition(
                                  turns:  AlwaysStoppedAnimation(25 / 360),
                                  child:  Text(
                                    "/",
                                    style: TextStyle(fontSize: 25.sp),
                                  ),
                                ),
                              ):const SizedBox()
                            ])):const SizedBox(),
                        subscriptionBaka.first_period?.price_after_discount!=null?SizedBox(
                          child: Text(
                              '  /  ',style:TextStyle(color: AppColors.arrowBlueColor,fontSize: 18.sp)
                          ),):SizedBox(),
                        SizedBox(
                          child: Text(
                              '${subscriptionBaka.first_period?.price_after_discount ?? ""}',style:TextStyle(color: AppColors.bakaPriceColor,fontSize: 16.sp)
                          ),
                        ),
                        SizedBox(
                          child: Container(
                            margin: EdgeInsets.only(right: 24.0),
                            child: Text(
                                ' ${(subscriptionBaka.first_period?.months_count??"")} أشهر ',style:TextStyle(color: AppColors.arrowBlueColor,fontSize: 16.sp)
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 35.h,
                      child: mt.InkWell(
                          onTap: (){
                            _chooseBakaController.changeBakaID( subscriptionBaka.id!);
                            Get.toNamed('/chooseBakaDetails');
                          },
                          child: Text('مميزات الباقة',style:TextStyle(color: AppColors.arrowBlueColor,fontSize: 18.sp,decoration: TextDecoration.underline,fontWeight: FontWeight.w600))),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 15.6.w),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10.0),
                      child: subscriptionBaka.image!=null && subscriptionBaka.image!=""?Image.network(
                        subscriptionBaka.image!,
                        height: 96.h,
                        width: 98.w,
                        fit: BoxFit.fitHeight,
                      ):Image.asset(
                        imageStr,
                        height: 96.h,
                        width: 98.w,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    SizedBox(height: 28.h,),
                    Padding(
                      padding: EdgeInsetsDirectional.only(end :26.6.w),
                      child: SizedBox(
                        height: 35.h,
                        child: Text(' مجانية لمدة ${subscriptionBaka.first_period?.free_days??''} أيام ',style:TextStyle(color: AppColors.arrowBlueColor,fontSize: 12.sp,),textDirection: mt.TextDirection.rtl,
                        ),
                      ),
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
