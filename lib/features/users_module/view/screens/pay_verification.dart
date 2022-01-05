import 'package:advertisers/features/users_module/app_colors.dart';
import 'package:advertisers/features/users_module/view/usedWidgets/advertisers_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PayVerification extends StatelessWidget {
  const PayVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.verifyFayrouzyFirst.withOpacity(.99),
        body: SafeArea(
            child: Container(
                height: 812.0.h,
                width: 375.0.w,
                decoration: BoxDecoration(
                  color: AppColors.verifyFayrouzyFirst,
                  gradient: LinearGradient(
                      colors: [
                        AppColors.verifyFayrouzyFirst.withOpacity(.99),
                        AppColors.verifyBlueSecond.withOpacity(.99),
                        AppColors.verifyGreenThird
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [-.7, 20.5, .5]),
                ),
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: EdgeInsetsDirectional.only(end: 32.8.w),
                            child: Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: SvgPicture.asset('images/arrow_back_register.svg',
                                  height: 47.h, fit: BoxFit.fitHeight),
                            ),
                          ),
                        ),
                      ),
                      section1(),
                      SizedBox(height: 9.h),
                      section2(),
                          SizedBox(height:9.h ,),
                          section3(),
                    ])))));
  }
}

Widget section1() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 6.h),
    child: Container(
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(6), topRight: Radius.circular(6))),
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: 15.0.w, top: 33.h),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 6,
                  backgroundColor: AppColors.circleGreyColor,
                ),
                SizedBox(
                  child: RichText(
                    text: TextSpan(
                      text: '  اسم الباقة           ',
                      style: TextStyle(
                          fontSize: 19.sp,
                          color: AppColors.changePhoneTextColor,
                          fontFamily: 'Arabic-Regular'),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'باقة التقدم',
                            style: TextStyle(
                                fontSize: 19.sp,
                                color: AppColors.fontColorBlue,
                                fontFamily: 'Arabic-Regular')),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 6,
                  backgroundColor: AppColors.circleGreyColor,
                ),
                SizedBox(
                  child: RichText(
                    text: TextSpan(
                      text: '  مدة الاشتراك       ',
                      style: TextStyle(
                          fontSize: 19.sp,
                          fontFamily: 'Arabic-Regular',
                          color: AppColors.changePhoneTextColor),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'ستة أشهر',
                            style: TextStyle(
                                fontSize: 19.sp,
                                color: AppColors.fontColorBlue,
                                fontFamily: 'Arabic-Regular')),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 6,
                  backgroundColor: AppColors.circleGreyColor,
                ),
                SizedBox(
                  child: RichText(
                    text: TextSpan(
                      text: '  المدة المجانية       ',
                      style: TextStyle(
                          fontSize: 19.sp,
                          fontFamily: 'Arabic-Regular',
                          color: AppColors.changePhoneTextColor),
                      children: <TextSpan>[
                        TextSpan(
                            text: '45',
                            style: TextStyle(
                                fontSize: 19.sp,
                                color: AppColors.fontColorBlue,
                                fontFamily: 'Arabic-Regular')),
                        TextSpan(
                            text: '  يوم',
                            style: TextStyle(
                                fontSize: 19.sp,
                                color: AppColors.fontColorBlue,
                                fontFamily: 'Arabic-Regular')),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget section2() {
  return Column(children: [
    Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 6.w,
      ),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(6), topRight: Radius.circular(6))),
        child: Padding(
          padding: EdgeInsetsDirectional.only(start: 15.0.w, top: 33.h),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 6,
                    backgroundColor: AppColors.circleGreyColor,
                  ),
                  SizedBox(
                    child: RichText(
                      text: TextSpan(
                        text: '  قيمة الاشتراك                 :   ',
                        style: TextStyle(
                            fontSize: 19.sp,
                            color: AppColors.fontColorBlue,
                            fontFamily: 'Arabic-Regular'),
                        children: <TextSpan>[
                          TextSpan(
                              text: '700',
                              style: TextStyle(
                                  fontSize: 19.sp,
                                  color: AppColors.fontColorBlue,
                                  fontFamily: 'Arabic-Regular')),
                          TextSpan(
                              text: '  ر.س',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.bakaPriceColor,
                                  fontFamily: 'Arabic-Regular')),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 6,
                    backgroundColor: AppColors.circleGreyColor,
                  ),
                  SizedBox(
                    child: RichText(
                      text: TextSpan(
                        text: '  ضريبة القيمة المضافة       :   ',
                        style: TextStyle(
                            fontSize: 19.sp,
                            fontFamily: 'Arabic-Regular',
                            color: AppColors.fontColorBlue),
                        children: <TextSpan>[
                          TextSpan(
                              text: '105',
                              style: TextStyle(
                                  fontSize: 19.sp,
                                  color: AppColors.fontColorBlue,
                                  fontFamily: 'Arabic-Regular')),
                          TextSpan(
                              text: '  ر.س',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.bakaPriceColor,
                                  fontFamily: 'Arabic-Regular')),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 6,
                    backgroundColor: AppColors.circleGreyColor,
                  ),
                  SizedBox(
                    child: RichText(
                      text: TextSpan(
                        text: '  الخصم التسويقي             :  ',
                        style: TextStyle(
                            fontSize: 19.sp,
                            fontFamily: 'Arabic-Regular',
                            color: AppColors.fontColorBlue),
                        children: <TextSpan>[
                          TextSpan(
                              text: '145',
                              style: TextStyle(
                                  fontSize: 19.sp,
                                  color: AppColors.fontColorBlue,
                                  fontFamily: 'Arabic-Regular')),
                          TextSpan(
                              text: '  ر.س',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.bakaPriceColor,
                                  fontFamily: 'Arabic-Regular')),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
    SizedBox(
      height: 2.h,
    ),
    Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 6.h,
      ),
      child: Container(
          height: 56.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(6), topRight: Radius.circular(6))),
          child: Padding(
              padding: EdgeInsetsDirectional.only(
                start: 15.0.w,
              ),
              child: Row(
                children: [
                  SizedBox(
                    child: RichText(
                      text: TextSpan(
                        text: '  صافي الفاتورة     ',
                        style: TextStyle(
                            fontSize: 19.sp,
                            fontFamily: 'Arabic-Regular',
                            fontWeight: FontWeight.bold,
                            color: AppColors.fontColorBlue),
                        children: <TextSpan>[
                          TextSpan(
                              text: '       660             رس ',
                              style: TextStyle(
                                  fontSize: 19.sp,
                                  color: AppColors.bakaPriceColor,
                                  fontFamily: 'Arabic-Regular',
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ],
              ))),
    )
  ]);
}

Widget section3() {
  return Column(children: [
    SizedBox(
      height: 2.h,
    ),
    Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 6.h,
        ),
        child: Container(
          //height: 56.h,
          width:375.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(6), topRight: Radius.circular(6))),
          child: Padding(
              padding: EdgeInsetsDirectional.only(
                start: 15.0.w,
              ),
              child: Column(children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(end: 32.w),
                  child: Text('اختر طريقة الدفع المفضلة',style: TextStyle(color: AppColors.blackColor,fontSize: 21.sp,
                      fontWeight: FontWeight.bold),),
                ),
                SizedBox(height: 26.45.h,),
                SizedBox(
                     width: 375.w,
                    child: Expanded(
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              SvgPicture.asset('images/playPay.svg',width: 20.42.w,
                                  height: 26.43.h, fit: BoxFit.fitHeight),
                              SizedBox(width: 22.64,),
                              Text('PLAY PAY'),
                            ],
                          ),
                        ),
                        CircleAvatar(radius:20 ,backgroundColor: AppColors.whiteColor,),
                        SizedBox(width: 47.w,)
                      ],
                  ),
                    ),
                ),
                SizedBox(height: 26.45.h,),
                SizedBox(
                  width: 375.w,
                  child: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              SvgPicture.asset('images/playPay.svg',width: 20.42.w,
                                  height: 26.43.h, fit: BoxFit.fitHeight),
                              SizedBox(width: 22.64,),
                              Text('STC'),
                            ],
                          ),
                        ),
                        CircleAvatar(radius:20 ,backgroundColor: AppColors.whiteColor,),
                        SizedBox(width: 47.w,)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 26.45.h,),
                SizedBox(
                  width: 375.w,
                  child: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 23.42.w,
                                height: 18.43.h,
                                child: SvgPicture.asset('images/visa.svg', fit: BoxFit.fill),
                              ),
                              SizedBox(width: 22.64,),
                              Text('فيزا'),
                            ],
                          ),
                        ),
                        CircleAvatar(radius:20 ,backgroundColor: AppColors.whiteColor,),
                        SizedBox(width: 47.w,)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 26.45.h,),
                SizedBox(
                  width: 375.w,
                  child: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 23.42.w,
                                height: 18.43.h,
                                child: SvgPicture.asset('images/visa.svg', fit: BoxFit.fill),
                              ),
                              SizedBox(width: 22.64,),
                              Text('فيزا'),
                            ],
                          ),
                        ),
                        CircleAvatar(radius:20 ,backgroundColor: AppColors.blueAccentColor,),
                        SizedBox(width: 47.w,)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 26.45.h,),
                SizedBox(
                  width: 375.w,
                  child: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              SvgPicture.asset('images/bank.svg',width: 23.42.w,
                                  height: 24.43.h, fit: BoxFit.fitHeight),
                              SizedBox(width: 22.64,),
                              Text('تحويل بنكي مباشر للمعلن'),
                            ],
                          ),
                        ),
                        CircleAvatar(radius:20 ,backgroundColor: AppColors.whiteColor,),
                        SizedBox(width: 47.w,)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 8.9.h,)
              ])),
        )),
    SizedBox(height:18.h),
    AdvertisersButton(text: 'تأكيد الدفع', onPressed: (){
      Get.toNamed('/successfulPayingPage');
    },width: 320.w,backgroundColor: AppColors.verifyButtonColor,textColor: AppColors.blueAccentColor,),
    SizedBox(height:18.h),
  ]);
}
