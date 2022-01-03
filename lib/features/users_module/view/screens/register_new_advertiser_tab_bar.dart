import 'package:advertisers/features/users_module/app_colors.dart';
import 'package:advertisers/features/users_module/view/screens/register_new_advertiser_company.dart';
import 'package:advertisers/features/users_module/view/screens/register_new_advertiser_user.dart';
import 'package:advertisers/features/users_module/view/screens/register_new_client_company.dart';
import 'package:advertisers/features/users_module/view/screens/register_new_client_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class RegisterNewAdvertiserTapBar extends StatelessWidget {
  const RegisterNewAdvertiserTapBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        // set initial index to 1
        initialIndex: 1,
        child: Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: PreferredSize(
            preferredSize: Size(375.w,125.h),

            child: AppBar(
              backgroundColor:AppColors.whiteColor ,
              bottom: PreferredSize(
                preferredSize: Size(375.w,58.h),
                child: TabBar(indicatorWeight: 4,
                  tabs: [
                    Tab(text: 'cian'.tr,height:58.h ,),
                    Tab( text: 'person'.tr,height:58.h ,),

                    //Tab(icon: Icon(Icons.directions_bike)),//
                  ],labelStyle: TextStyle(fontSize: 23.sp,fontFamily: 'Arabic-Regular'),labelColor:AppColors.tabAdvertiserTextColor2 ,
                  unselectedLabelColor: AppColors.tabAdvertiserTextColor,indicatorSize:TabBarIndicatorSize.tab ,mouseCursor: MouseCursor.defer,
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 24.w),automaticIndicatorColorAdjustment: false,
                  labelPadding: EdgeInsets.symmetric(horizontal: 24.w),
                  //  indicator: BoxDecoration(
                  //    border: Border.fromBorderSide( BorderSide(color: Color(0xffF1F1F1),width: 2,style:BorderStyle.solid ),
                  //   )
                  // ),
                ),
              ),
              title: InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset('images/arrow_back.svg',height: 47.h,fit: BoxFit.fitHeight)),

            ),
          ),
          body:  TabBarView(
            children: [

              RegisterNewAdvertiserCompany(),
              RegisterNewAdvertiserUser(),

            ],
          ),
        ),
      ),
    );
  }
}