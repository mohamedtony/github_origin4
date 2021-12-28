import 'package:advertisers/users_module/app_colors.dart';
import 'package:advertisers/users_module/controller/forget_password_for_phone_controller.dart';
import 'package:advertisers/users_module/controller/register_phone_controller.dart';
import 'package:advertisers/users_module/view/usedWidgets/advertisers_button.dart';
import 'package:advertisers/users_module/view/usedWidgets/advertisers_phone.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart'as svg;
class RegisterPhone extends StatelessWidget {
  RegisterPhone({Key? key}) : super(key: key);
  final RegisterPhoneController _registerPhoneController=Get.put(RegisterPhoneController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Scaffold(
          backgroundColor: AppColors.whiteColor,
          body: SafeArea(
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.topCenter,
                decoration:const BoxDecoration(
                  color:AppColors.verifyFayrouzyFirst,
                  gradient: LinearGradient(colors: [AppColors.verifyFayrouzyFirst,AppColors.verifyBlueSecond,AppColors.verifyGreenThird],
                      begin: Alignment.topCenter,end: Alignment.bottomCenter ,stops:[0,1.6,.9]),
                ),
                child: Form(
                //  key: _registerPhoneController.registerPhoneFormKey,
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
                              child: SvgPicture.asset('images/arrow_back.svg',height: 47.h,fit: BoxFit.fitHeight,cacheColorFilter: false,),

                            ),
                          ) ,
                        ),

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
                          child: Text('platform'.tr,style: TextStyle(fontSize: 20.sp,color: AppColors.whiteColor,fontFamily: 'elmessiri-Regular'),),),
                        SizedBox(height: 151.58.h,),
                        // SizedBox(
                        //   width: MediaQuery.of(context).size.width,
                        //   child:Padding(
                        //     padding:  EdgeInsets.all(16.0.w),
                        //     child: Align(
                        //       alignment: AlignmentDirectional.centerStart,
                        //       child: Text('forgetPassword'.tr,style: TextStyle(fontSize:17.sp,color: AppColors.heavyBlueColor,fontWeight: FontWeight.bold)),
                        //     ),
                        //   ) ,
                        // ),
                        Obx(()=>AdvertisersPhone(hintText: 'phone'.tr,initialSelection: _registerPhoneController.countryCode.value,
                          onChanged: (countryCodeVal){
                            _registerPhoneController.countryCode.value=countryCodeVal.code!;
                          },controller: _registerPhoneController.phoneController,
                          onSaved: (value){
                            _registerPhoneController.phone=value!;
                          },
                          validator: (value){
                            return _registerPhoneController.validatePhone(value!);
                          }, )),

                        const SizedBox(height: 25,),


                        // Padding(
                        //   padding: EdgeInsetsDirectional.only(end:31.w),
                        //   child: Align(
                        //       alignment: AlignmentDirectional.centerEnd,
                        //       child: SizedBox(child: Text('forgetPassword'.tr,style: TextStyle(color:AppColors.heavyBlueColor,decoration: TextDecoration.underline,fontSize: 15.sp),))),
                        // ),
                        SizedBox(height:32.h),
                        AdvertisersButton(text: 'register'.tr,textColor:AppColors.verifyTextColor ,backgroundColor: AppColors.verifyButtonColor, onPressed: (){_registerPhoneController.checkLogin();}),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

        ));
  }
}
