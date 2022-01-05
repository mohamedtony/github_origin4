import 'package:advertisers/features/users_module/app_colors.dart';
import 'package:advertisers/features/users_module/view/usedWidgets/advertisers_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';

class BakaAdvertiserCard extends StatelessWidget {
  BakaAdvertiserCard(
      {required this.imageStr,
      required this.bakaName,
      required this.domain,
      required this.price,this.slash,
      Key? key})
      : super(key: key);
  late final String bakaName, domain, imageStr, price;
  bool? slash;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: (){
          Get.toNamed('/bakaDetails');
        },
        child: Container(
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
                      width: 171.5.w,
                      alignment:AlignmentDirectional.centerStart,
                      child: Text(bakaName,style: TextStyle(color: AppColors.arrowBlueColor,fontSize: 23.sp),),
                    ),
                  Row(
                      children: [
                        slash==true?  SizedBox(
                            child: Stack(alignment: Alignment.center, children: [
                          SizedBox(
                            child: Text(
                              price,style:TextStyle(color: AppColors.bakaPriceColor,fontSize: 16.sp)
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
                        ])):const SizedBox(),
                        SizedBox(
                          child: Text(
                              '  $price',style:TextStyle(color: AppColors.bakaPriceColor,fontSize: 16.sp)
                          ),
                        ),
                        SizedBox(
                          child: Text(
                              '  /  سنوي',style:TextStyle(color: AppColors.arrowBlueColor,fontSize: 16.sp)
                          ),
                        ),
                      ],
                    ),
                     SizedBox(
                       height: 35.h,
                      child: Text('مميزات الباقة',style:TextStyle(color: AppColors.arrowBlueColor,fontSize: 14.sp,decoration: TextDecoration.underline,)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 15.6.w),
                child: Column(
                  children: [
                    Image.asset(
                      imageStr,
                      height: 98.h,
                      width: 98.w,
                      fit: BoxFit.fitHeight,
                    ),
                    SizedBox(height: 28.h,),
                    Padding(
                      padding: EdgeInsetsDirectional.only(end :26.6.w),
                      child: SizedBox(
                        height: 35.h,
                        child: Text(domain,style:TextStyle(color: AppColors.arrowBlueColor,fontSize: 12.sp),
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
