import 'package:advertisers/users_module/app_colors.dart';
import 'package:advertisers/users_module/controller/forget_password_for_phone_controller.dart';
import 'package:advertisers/users_module/controller/register_phone_controller.dart';
import 'package:advertisers/users_module/view/usedWidgets/advertisers_button.dart';
import 'package:advertisers/users_module/view/usedWidgets/advertisers_phone.dart';
import 'package:awesome_select/awesome_select.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart'as svg;

import 'package:group_radio_button/group_radio_button.dart';

enum ClientType { client, company, advertiser }
class RegisterAccountType extends StatefulWidget {
RegisterAccountType({Key? key}) : super(key: key);


@override
  _RegisterAccountTypeState createState() => _RegisterAccountTypeState();
}

class _RegisterAccountTypeState extends State<RegisterAccountType> {
 // late Widget _verticalGroupValue=RegisterAccountTypeCard(value: 'client', singleValue: 'client'.tr,active: false,);
 // final List<Widget> _status=[RegisterAccountTypeCard(value: 'client', singleValue: 'client'.tr,active: false,),RegisterAccountTypeCard(value: 'company', singleValue: 'company'.tr,active:false),
 //  RegisterAccountTypeCard(value: 'advertiser', singleValue: 'advertiser'.tr,active :false)];
  late String value='client';
  bool active=false;
  ClientType _type = ClientType.client;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: AppColors.whiteColor,
          body: SafeArea(
            child: Center(
              child: Container(
                height: 812.0.h,
                width: 375.0.w,
                alignment: Alignment.topCenter,
                decoration:const BoxDecoration(
                  color:AppColors.verifyFayrouzyFirst,
                  gradient: LinearGradient(colors: [AppColors.verifyFayrouzyFirst,AppColors.verifyBlueSecond,AppColors.verifyGreenThird],
                      begin: Alignment.topCenter,end: Alignment.bottomCenter ,stops:[0,1.6,.9]),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child:Padding(
                          padding: EdgeInsetsDirectional.only(end:32.8.w),
                          child: Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: SvgPicture.asset('images/arrow_back.svg',height: 47.h,fit: BoxFit.fitHeight),

                          ),
                        ) ,
                      ),
                      SizedBox(height: 100.h,),
                      Container(
                          height:76.1.h,
                          width:68.46.w,
                          decoration:const BoxDecoration(
                              color: AppColors.transparentColor,
                              image:  DecorationImage(image: svg.Svg('images/account_type.svg'),fit: BoxFit.fill))
                      ),
                      SizedBox(
                        width: 375.0.w,
                        child: Row(

                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width:160.46.w,
                              child: ListTile(
                                title: Text('client'.tr,style: TextStyle(fontSize:25.sp ,color:AppColors.whiteColor,),),
                                leading: Radio(
                                  value: ClientType.client,overlayColor:  MaterialStateProperty.all(AppColors.whiteColor),fillColor: MaterialStateProperty.all(AppColors.whiteColor) ,
                                  groupValue: _type,activeColor:AppColors.heavyBlueColor,focusColor:AppColors.whiteColor ,hoverColor: AppColors.whiteColor,
                                  onChanged: (value) {
                                    setState(() {
                                      _type = value as ClientType;
                                    });
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              width:130.46.w,
                              child: ListTile(
                                title: Text('company'.tr,style: TextStyle(fontSize:25.sp ,color:AppColors.whiteColor,),),
                                leading: Radio(
                                  value: ClientType.company,
                                  groupValue: _type,overlayColor:  MaterialStateProperty.all(AppColors.whiteColor),fillColor: MaterialStateProperty.all(AppColors.whiteColor) ,
                                  activeColor:AppColors.heavyBlueColor,focusColor:AppColors.whiteColor ,hoverColor: AppColors.whiteColor,
                                  onChanged: (value) {
                                    setState(() {
                                      _type = value as ClientType;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 29.8.h,),
                      Container(
                        height: 22.h,
                        width: 375.w,
                        color: AppColors.whiteColor.withOpacity(.24),
                      ),
                      SizedBox(height: 41.2.h,),
                      Container(
                          height:76.1.h,
                          width:68.46.w,
                          decoration:const BoxDecoration(
                              color: AppColors.transparentColor,
                              image:  DecorationImage(image: svg.Svg('images/account_type.svg'),fit: BoxFit.fill))
                      ),
                      SizedBox(
                        width:140.46.w,
                        child: ListTile(
                          title: Text('advertiser'.tr,style: TextStyle(fontSize:25.sp ,color:AppColors.whiteColor,),),
                          leading: Radio(
                            value: ClientType.advertiser,
                            overlayColor:  MaterialStateProperty.all(AppColors.whiteColor),fillColor: MaterialStateProperty.all(AppColors.whiteColor) ,
                            groupValue: _type,activeColor:AppColors.heavyBlueColor,focusColor:AppColors.whiteColor ,hoverColor: AppColors.whiteColor,

                            onChanged: (value) {
                              setState(() {
                                _type = value as ClientType;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 24.8.h),
                      Image.asset('images/photoDecor.png',height: 140.h,width: 140.h,fit: BoxFit.fitHeight),
                    ],
                  ),
                ),
              ),
            ),
          ),

      );
  }
}
