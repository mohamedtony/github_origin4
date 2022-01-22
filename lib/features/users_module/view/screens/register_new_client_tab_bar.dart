import 'package:advertisers/features/users_module/app_colors.dart';
import 'package:advertisers/features/users_module/view/screens/register_new_client_company.dart';
import 'package:advertisers/features/users_module/view/screens/register_new_client_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class RegisterNewClientTapBar extends StatelessWidget {
  const RegisterNewClientTapBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        initialIndex: 1,
        child: Scaffold(
          backgroundColor: AppColors.verifyFayrouzyFirst,
          appBar: PreferredSize(
            preferredSize: Size(375.w,125.h),

            child: AppBar(
              backgroundColor:AppColors.verifyFayrouzyFirst ,
              bottom: PreferredSize(
                preferredSize: Size(375.w,58.h),
                child: TabBar(indicatorWeight: 4,
                  tabs: [
                    Tab(text: 'cian'.tr,height:58.h ,),
                    Tab( text: 'person'.tr,height:58.h ,),

                    //Tab(icon: Icon(Icons.directions_bike)),
                  ],labelStyle: TextStyle(fontSize: 23.sp,fontFamily: 'Arabic-Regular'),labelColor:AppColors.verifyBlueSecond ,
                  unselectedLabelColor: AppColors.whiteColor,
                ),
              ),
              title: InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset('images/arrow_back_register.svg',height: 47.h,fit: BoxFit.fitHeight)),

            ),
          ),
          body:  TabBarView(
            children: [

              RegisterNewClientCompany(),
              RegisterNewClientUser(),
            ],
          ),
        ),
      ),
    );
  }
}