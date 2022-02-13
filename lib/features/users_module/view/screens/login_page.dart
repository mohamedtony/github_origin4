
import 'dart:ui';

import 'package:advertisers/features/users_module/app_colors.dart';
import 'package:advertisers/features/users_module/controller/login_controller.dart';
import 'package:advertisers/features/users_module/view/usedWidgets/advertisers_button.dart';
import 'package:advertisers/features/users_module/view/usedWidgets/advertisers_generic_field.dart';
import 'package:advertisers/features/users_module/view/usedWidgets/advertisers_phone.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart'as svg;


class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final LoginController _loginController=Get.find();

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
              key: _loginController.loginClientFormKey1,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // SizedBox(
                    //   width: MediaQuery.of(context).size.width,
                    //   child:Padding(
                    //     padding: EdgeInsetsDirectional.only(end:32.8.w),
                    //     child: Align(
                    //       alignment: AlignmentDirectional.centerEnd,
                    //       child: SvgPicture.asset('images/arrow_back.svg',height: 47.h,fit: BoxFit.fitHeight),
                    //
                    //     ),
                    //   ) ,
                    // ),

                    Container(
                        height:88.h,
                        width:88.w,
                        decoration:const BoxDecoration(
                          color: AppColors.blueAccentColor,
                            shape: BoxShape.circle,
                             image:  DecorationImage(image: svg.Svg('images/notLogo.svg'),fit: BoxFit.fill))
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
                          child: Text('login'.tr,style: TextStyle(fontSize:17.sp,color: AppColors.heavyBlueColor,fontWeight: FontWeight.bold)),
                        ),
                      ) ,
                    ),
                    Obx(()=>AdvertisersPhone(hintText: 'phone'.tr,initialSelection: _loginController.countryCode.value,flag: true,
                        onChanged: (countryCodeVal){
                          _loginController.countryCode.value=countryCodeVal.dialCode!;
                          _loginController.regionCode.value=countryCodeVal.code! ;
                        },controller: _loginController.phoneController,
                      onSaved: (value){
                        _loginController.phone=value!;
                      },
                      validator: (value){
                        return _loginController.validatePhone(value!);
                      }, )),

                    const SizedBox(height: 25,),

                   AdvertisersGenericField(hintText: 'enterPassword'.tr,obscureText: true,
                      controller: _loginController.passwordController,textAlignment: TextAlign.center,
                      onSaved: (value){
                        _loginController.password=value!;
                      },
                      validator: (value){
                        return _loginController.validatePassword(value!);
                      }, ),
                    SizedBox(height:10.h),
                    InkWell(
                      onTap: (){
                        Get.toNamed('/forgetPasswordForPhone');
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.only(end:31.w),
                            child: Align(
                                alignment: AlignmentDirectional.centerEnd,
                                child: SizedBox(child: Text('forgetPassword'.tr,style: TextStyle(color:AppColors.heavyBlueColor,decoration: TextDecoration.underline,fontSize: 15.sp,fontWeight: FontWeight.bold),))),
                          ),
                          // Padding(
                          //   padding: EdgeInsetsDirectional.only(end:31.w),
                          //   child: Align(
                          //       alignment: AlignmentDirectional.centerEnd,
                          //       child: SizedBox(
                          //           width: 110.w,
                          //           child:const Divider(color:AppColors.heavyBlueColor,height: 1,thickness: 1,)),),
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(height:46.h),
                   AdvertisersButton(text: 'login'.tr, onPressed: (){
                     _loginController.phoneMess.value = '';
                     _loginController. passwordMess.value = '';

                     _loginController.errorRegister.value=false;
                     _loginController.isValid.value=false;

                     _loginController.checkLogin(context);}),
                    SizedBox(height:17.h),
                    SizedBox(
                      height: 29.h,
                      width: MediaQuery.of(context).size.width,
                      child: Row(mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(color: AppColors.heavyBlueColor,height: 2.h,width: 150.w,),
                          Text('or'.tr,style: TextStyle(fontSize: 16.sp,color: AppColors.orBlueColor)),
                          Container(color: AppColors.heavyBlueColor,height: 2.h,width: 150.w,),
                        ],
                      ),
                    ),
                    SizedBox(height:23.h),
                    AdvertisersButton(text: 'newAccount'.tr, onPressed: (){
                           Get.toNamed('/registerPhone',);
                    },key: ValueKey('register'),),
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
