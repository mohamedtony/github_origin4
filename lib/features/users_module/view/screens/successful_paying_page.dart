import 'package:advertisers/features/users_module/app_colors.dart';
import 'package:advertisers/features/users_module/view/usedWidgets/advertisers_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SuccessfulPayingPage extends StatelessWidget {
  const SuccessfulPayingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: 812.0.h,
          width:375.0.w ,
          decoration:const BoxDecoration(
            color:AppColors.verifyFayrouzyFirst,
            gradient: LinearGradient(colors: [AppColors.verifyFayrouzyFirst,AppColors.verifyBlueSecond,AppColors.verifyGreenThird],
                begin: Alignment.topCenter,end: Alignment.bottomCenter ,stops:[0,1.6,.9]),
          ),

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
                Padding(
                  padding: EdgeInsetsDirectional.only(end: 44.38.w,start: 20.w,top: 41.7.h),
                  child: SizedBox(
                    height: 177.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('images/success.png',height: 131.h,width:131.w,fit: BoxFit.fitHeight),
                        SvgPicture.asset('images/machine.svg',height:176.3.h ,width:142.37.w,fit: BoxFit.fitHeight),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 91.h,),
                Container(
                  height: 124.h,
                  width: 327.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(24),
                      border:Border.all(color:AppColors.borderRadiusColor)
                  ),
                  child: Text('لقد تم تسجيلك بنجاح \nيمكنك البدء الآن',textAlign: TextAlign.center,style: TextStyle(fontSize: 27.sp,fontWeight: FontWeight.bold,color: AppColors.fontColorBlue),),
                ),
                SizedBox(height: 160.h,),
                AdvertisersButton(text: 'حفظ الفاتورة على الجوال', backgroundColor: AppColors.whiteColor,width:327.w ,textColor: AppColors.lightBlueColor,onPressed: (){
                   Get.toNamed('/Home');
                }),
                SizedBox(height: 32.h,),
                AdvertisersButton(text: 'ارسال الفاتورة على البريد الإلكتروني', backgroundColor: AppColors.verifyButtonColor,width:327.w ,textColor: AppColors.verifyTextColor,onPressed: (){

                })
    ])),
      ));
  }
}
