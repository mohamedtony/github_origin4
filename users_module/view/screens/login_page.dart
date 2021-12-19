
import 'dart:ui';

import 'package:advertisers/users_module/app_colors.dart';
import 'package:advertisers/users_module/controller/login_controller.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';



class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final LoginController _loginController=Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.topCenter,
            child: Form(
              key: _loginController.loginClientFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
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
                          child: SvgPicture.asset('advertisers/images/arrow_back.svg',height: 22.81.h,fit: BoxFit.fitHeight),
                        ),
                      ) ,
                    ),
                    //SizedBox(height: 230.h,),
                    Container(
                        height:88.h,
                        width:88.w,
                        decoration: const BoxDecoration(
                          color: AppColors.blueAccentColor,
                          //gradient: LinearGradient(begin:Alignment.topCenter ,end:Alignment.bottomCenter , colors:const [AppColors.firstBrownColor,AppColors.secondBrownColor]),
                          shape: BoxShape.circle,),
                            // borderRadius:BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)) ,
                            // image:  DecorationImage(image: AssetImage('asset/images.jpeg'),fit: BoxFit.fill))
                    ),
                    SizedBox(height: 28.62.h,),
                    SizedBox(
                      height: 35.h,
                    child: Text('platform'.tr,style: TextStyle(fontSize: 20.sp,color: AppColors.logoBlueColor,fontFamily: 'elmessiri-Regular'),),),
                    SizedBox(height: 36.5.h,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child:Padding(
                        padding:  EdgeInsets.all(16.0.w),
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text('login'.tr,style: TextStyle(fontSize:17.sp,color: AppColors.heavyBlueColor)),
                        ),
                      ) ,
                    ),
                    SizedBox(
                      width: 323.w,
                      //height: 50.h,
                      child: TextFormField(
                        style: TextStyle(fontSize: 15.sp ),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding:  EdgeInsets.symmetric(vertical: 5.0.h),
                         suffixIcon: SvgPicture.asset('advertisers/images/phone.svg',height: 47.h,fit: BoxFit.fitHeight,),
                          prefixIcon:Obx(()=>CountryCodePicker(
                              searchDecoration: const InputDecoration(
                                  focusColor: AppColors.borderfayrozy,focusedBorder:UnderlineInputBorder(),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.borderfayrozy),)),

                              initialSelection: _loginController.countryCode.value,
                              onChanged: (countryCodeVal){
                                _loginController.countryCode.value=countryCodeVal.code!;
                              })),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.h),borderSide:const BorderSide(color:AppColors.borderfayrozy)
                          ),
                          filled: true,
                          disabledBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.h),borderSide:const BorderSide(color: AppColors.borderfayrozy)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.h),borderSide:const BorderSide(color: AppColors.borderfayrozy)
                          ),
                          focusColor: AppColors.borderfayrozy,
                          fillColor:AppColors.whiteColor,
                          hintStyle:TextStyle(color: AppColors.greyColor,fontSize: 15.sp),
                          hintText: 'phone'.tr,
                        ),
                        controller: _loginController.passwordController,
                        onSaved: (value){
                          _loginController.password=value!;
                        },
                        validator: (value){
                          return _loginController.validatePassword(value!);
                        },
                      ),
                    ),
                    // const SizedBox(height: 25,),
                    // SizedBox(
                    //   width: 323.w,
                    //   //height: 45.h,
                    //   child: TextFormField(
                    //     style: TextStyle(fontSize: 15.sp ),
                    //     textAlign: TextAlign.center,
                    //     keyboardType: TextInputType.number,
                    //     decoration: InputDecoration(
                    //       border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(12.h),borderSide:const BorderSide(color:AppColors.borderGormozy)
                    //       ),
                    //       filled: true,
                    //       disabledBorder:OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(12.h),borderSide:const BorderSide(color: AppColors.borderGormozy)
                    //       ),
                    //       enabledBorder: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(12.h),borderSide:const BorderSide(color: AppColors.borderGormozy)
                    //       ),
                    //       focusColor: AppColors.borderGormozy,
                    //       fillColor: AppColors.whiteColor,
                    //       hintStyle:TextStyle(color: AppColors.greyColor,fontSize: 15.sp),
                    //       hintText: 'أدخل كلمة المرور',
                    //     ),
                    //     controller: _loginController.phoneController,
                    //     onSaved: (value){
                    //       _loginController.phone=value!;
                    //     },
                    //     validator: (value){
                    //       return _loginController.validatePhone(value!);
                    //     },
                    //   ),
                    // ),
                    SizedBox(height:10.h),
                    Padding(
                      padding: EdgeInsetsDirectional.only(end:31.w),
                      child: Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: SizedBox(child: Text('forgetPassword'.tr,style: TextStyle(color:AppColors.heavyBlueColor,decoration: TextDecoration.underline,fontSize: 15.sp),))),
                    ),
                    SizedBox(height:46.h),
                    Container(
                      height: 40.h,
                      width:237.w,
                      alignment: Alignment.center,
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: AppColors.blueAccentColor
                        //gradient: LinearGradient(begin:Alignment.topCenter ,end:Alignment.bottomCenter , colors:const [AppColors.firstBrownColor,AppColors.secondBrownColor])
                      ),

                      child: TextButton(onPressed: (){
                        _loginController.checkLogin();
                      }, child: Text('login'.tr,style: TextStyle(fontSize: 15.sp),),style: ButtonStyle(
                          foregroundColor:MaterialStateProperty.all(AppColors.whiteColor),
                          shape:MaterialStateProperty.all(const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10),
                          ))) ),),
                    ),
                    SizedBox(height:17.h),
                    SizedBox(
                      height: 29.h,
                      width: MediaQuery.of(context).size.width,
                      child: Row(mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(color: AppColors.lightBlueColor,height: 2.h,width: 150.w,),
                          Text('or'.tr,style: TextStyle(fontSize: 16.sp,color: AppColors.orBlueColor)),
                          Container(color: AppColors.lightBlueColor,height: 2.h,width: 150.w,),
                        ],
                      ),
                    ),
                    SizedBox(height:23.h),
                    Container(
                      height: 40.h,
                      width:237.w,
                      alignment: Alignment.center,
                      decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(7.h),
                          color: AppColors.blueAccentColor
                         // gradient: LinearGradient(begin:Alignment.topCenter ,end:Alignment.bottomCenter , colors:const [AppColors.firstBrownColor,AppColors.secondBrownColor])
                      ),

                      child: TextButton(onPressed: (){
                        _loginController.checkLogin();
                      }, child: Text('register'.tr,style: TextStyle(fontSize: 15.sp),),style: ButtonStyle(
                          foregroundColor:MaterialStateProperty.all(AppColors.whiteColor),
                          shape:MaterialStateProperty.all( RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(7.h),
                          ))) ),),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
