

import 'package:advertisers/features/users_module/app_colors.dart';
import 'package:advertisers/features/users_module/view/cards/baka_advertiser_card.dart';
import 'package:advertisers/features/users_module/view/usedWidgets/advertisers_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ChooseBakaPage extends StatelessWidget {
  const ChooseBakaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
        SizedBox(height: 68.h,),
        Container(
          height:45.h ,
          padding:const EdgeInsetsDirectional.all(0),
          margin: const EdgeInsetsDirectional.all(0),
          decoration: const BoxDecoration(

            color: AppColors.bakaBarColor,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight:  Radius.circular(12))
          ),
          child:   Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(start:20.w),
                child: Container(
                  width:137.w,
                  height: 30.h,
                  alignment: Alignment.center,
                  padding: EdgeInsetsDirectional.all(0),
                  margin: EdgeInsetsDirectional.all(0),
                  decoration: BoxDecoration(
                      color: AppColors.tabAdvertiserTextColor2,
                      borderRadius: BorderRadius.circular(6)
                  ),
                  child: Text('باقات الإشتراك',style: TextStyle(color: AppColors.whiteColor,fontSize: 15.sp),),
                ),
              ),
              Padding(
                padding:  EdgeInsetsDirectional.only(end: 12.0.w),
                child: SvgPicture.asset('images/puzzle.svg',height: 23.07.h,width:30.77.w,fit: BoxFit.fitHeight),
              ),
            ],
          ),
        ),
          Expanded(
            child: Container(
              color: AppColors.whiteColor,
              child: SingleChildScrollView(
              child:Container(
                color:AppColors.whiteColor,
                child: Column(
                    children:[


                      Padding(
                        padding: EdgeInsets.symmetric(horizontal:6.5.w,vertical: 3.62.h),
                        child: BakaAdvertiserCard(bakaName: 'الباقة الاساسية',slash:true, domain: 'مجانية لمدة سنة',price: '500',imageStr: 'images/mainBaka.png',),
                      ),
                      SizedBox(height: 40.h,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal:6.5.w,vertical: 3.62.h),
                        child: BakaAdvertiserCard(bakaName: 'الباقة التقدم', domain: 'تجربة مجانية لمدة شهر',price: '1200',imageStr: 'images/bakaTakadom.png',),
                      ),
                      SizedBox(height: 40.h,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal:6.5.w,vertical: 3.62.h),
                        child: BakaAdvertiserCard(bakaName: 'الباقة بريميم', domain: 'تجربة مجانية لمدة شهر',price: '2000',imageStr: 'images/bakaBremuim.png',),
                      ),
                      SizedBox(height: 97.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AdvertisersButton(text: 'أختر باقة', onPressed: (){
                            Get.toNamed('/bakaDetails');
                          },backgroundColor: AppColors.blueAccentColor,width: 146.w,),
                          AdvertisersButton(text: 'رجوع', onPressed: (){
                            Get.toNamed('/registerNewAdvertiserTapBar');
                          },backgroundColor: AppColors.verifyButtonColor,width: 146.w,textColor: AppColors.verifyTextColor,),
                        ],
                      ),
                      SizedBox(height: 22.h,)
                ]),
              ),

              ),
            ),
          ),

      ],
    ))));
  }
}
