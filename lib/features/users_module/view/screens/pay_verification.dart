import 'package:advertisers/features/users_module/app_colors.dart';
import 'package:advertisers/features/users_module/controller/baka_details_controller.dart';
import 'package:advertisers/features/users_module/view/usedWidgets/advertisers_button.dart';
import 'package:advertisers/shared/loading_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PayVerification extends StatelessWidget {
  PayVerification({Key? key}) : super(key: key);
  final BakaDetailsController _chooseBakaController = Get.find();
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
                          section3(context),
                        ])))));
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
                    child: Obx(()=>RichText(
                      text: TextSpan(
                        text: '  اسم الباقة           ',
                        style: TextStyle(
                            fontSize: 19.sp,
                            color: AppColors.changePhoneTextColor,
                            fontFamily: 'Arabic-Regular'),
                        children: <TextSpan>[
                          TextSpan(
                              text: _chooseBakaController.createSubscriptionModel.value.subscription?.name??'',
                              style: TextStyle(
                                  fontSize: 19.sp,
                                  color: AppColors.fontColorBlue,
                                  fontFamily: 'Arabic-Regular')),
                        ],
                      ),
                    ),)
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
                              text: (_chooseBakaController.createSubscriptionModel.value.period?.months_count?.toString()??'') + ' أشهر ',
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
              _chooseBakaController.subscriptionBakaDetail.value.first_period?.free_days!=null?Row(
                children: [
                  CircleAvatar(
                    radius: 6,
                    backgroundColor: AppColors.circleGreyColor,
                  ),
                   SizedBox(
                    child: Obx(()=>RichText(
                      text: TextSpan(
                        text: '  المدة المجانية       ',
                        style: TextStyle(
                            fontSize: 19.sp,
                            fontFamily: 'Arabic-Regular',
                            color: AppColors.changePhoneTextColor),
                        children: <TextSpan>[
                          TextSpan(
                              text: _chooseBakaController.createSubscriptionModel.value.period?.free_days?.toString()??'',
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
                    ),)
                  ),
                ],
              ):SizedBox(height: 10.0,),
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
                      child: Obx(()=>RichText(
                        text: TextSpan(
                          text: '  قيمة الاشتراك                 :   ',
                          style: TextStyle(
                              fontSize: 19.sp,
                              color: AppColors.fontColorBlue,
                              fontFamily: 'Arabic-Regular'),
                          children: <TextSpan>[
                            TextSpan(
                                text: _chooseBakaController.createSubscriptionModel.value.period?.price_after_discount!=null ? _chooseBakaController.createSubscriptionModel.value.period?.price_after_discount?.toString()??'': _chooseBakaController.createSubscriptionModel.value.period?.price?.toString()??'',
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
                      )),
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
                      child: Obx(()=>RichText(
                        text: TextSpan(
                          text: '  ضريبة القيمة المضافة       :   ',
                          style: TextStyle(
                              fontSize: 19.sp,
                              fontFamily: 'Arabic-Regular',
                              color: AppColors.fontColorBlue),
                          children: <TextSpan>[
                            TextSpan(
                                text: _chooseBakaController.createSubscriptionModel.value.added_tax?.toString()??'',
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
                      )),
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
                      child: Obx(()=>RichText(
                        text: TextSpan(
                          text: '  الخصم التسويقي             :  ',
                          style: TextStyle(
                              fontSize: 19.sp,
                              fontFamily: 'Arabic-Regular',
                              color: AppColors.fontColorBlue),
                          children: <TextSpan>[
                            TextSpan(
                                text: _chooseBakaController.createSubscriptionModel.value.discount?.toString()??'',
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
                      )),
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
                      child: Obx(()=>RichText(
                        text: TextSpan(
                          text: '  صافي الفاتورة     ',
                          style: TextStyle(
                              fontSize: 19.sp,
                              fontFamily: 'Arabic-Regular',
                              fontWeight: FontWeight.bold,
                              color: AppColors.fontColorBlue),
                          children: <TextSpan>[
                            TextSpan(
                              //text: '       660             رس ',
                                text: '                   '+(_chooseBakaController.createSubscriptionModel.value.total?.toString()??'')+ ' رس  ',
                                style: TextStyle(
                                    fontSize: 19.sp,
                                    color: AppColors.bakaPriceColor,
                                    fontFamily: 'Arabic-Regular',
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      )),
                    ),
                  ],
                ))),
      )
    ]);
  }

  Widget section3(BuildContext context) {
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
            // width:375.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6), topRight: Radius.circular(6))),
            child: Padding(
                padding: EdgeInsetsDirectional.only(
                  start: 15.0.w,
                ),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.only(end: 32.w),
                        child: Text('اختر طريقة الدفع المفضلة',style: TextStyle(color: AppColors.blackColor,fontSize: 21.sp,
                            fontWeight: FontWeight.bold),),
                      ),
                      SizedBox(height: 26.45.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: (){
                              _chooseBakaController.changePayMethod('PLAY PAY',1);
                            },
                            child: Row(
                              children: [
                                SvgPicture.asset('images/playPay.svg',width: 20.42.w,
                                    height: 26.43.h, fit: BoxFit.fitHeight),
                                SizedBox(width: 22.64,),
                                Text('PLAY PAY'),
                              ],
                            ),
                          ),
                          Obx(()=>Container(
                              margin: EdgeInsets.only(left: 50.0),
                              child: CircleAvatar(radius:10 ,backgroundColor: _chooseBakaController.paymentIndex.value==1?AppColors.blueAccentColor:AppColors.whiteColor,)),),

                          //SizedBox(width: 10.0,)
                        ],
                      ),
                      SizedBox(height: 26.45.h,),
                      SizedBox(
                        // width: 375.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: (){
                                _chooseBakaController.changePayMethod('STC',2);
                              },
                              child: Row(
                                children: [
                                  SvgPicture.asset('images/playPay.svg',width: 20.42.w,
                                      height: 26.43.h, fit: BoxFit.fitHeight),
                                  SizedBox(width: 22.64,),
                                  Text('STC'),
                                ],
                              ),
                            ),
                            Obx(()=>Container(
                                margin: EdgeInsets.only(left: 50.0),
                                child: CircleAvatar(radius:10 ,backgroundColor: _chooseBakaController.paymentIndex.value==2?AppColors.blueAccentColor:AppColors.whiteColor,)),),
                            //SizedBox(width: 10.0,)
                          ],
                        ),
                      ),
                      SizedBox(height: 26.45.h,),
                      SizedBox(
                        //width: 375.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: (){
                                _chooseBakaController.changePayMethod('فيزا',3);
                              },
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
                            Obx(()=>Container(
                                margin: EdgeInsets.only(left: 50.0),
                                child: CircleAvatar(radius:10 ,backgroundColor: _chooseBakaController.paymentIndex.value==3?AppColors.blueAccentColor:AppColors.whiteColor,)),),
                            //SizedBox(width: 10.0,)
                          ],
                        ),
                      ),
                      SizedBox(height: 26.45.h,),
                      SizedBox(
                        //width: 375.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: (){
                                _chooseBakaController.changePayMethod('فيزا',4);
                              },
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
                            Obx(()=>Container(
                                margin: EdgeInsets.only(left: 50.0),
                                child: CircleAvatar(radius:10 ,backgroundColor: _chooseBakaController.paymentIndex.value==4?AppColors.blueAccentColor:AppColors.whiteColor,)),),
                            // SizedBox(width: 10.0,)
                          ],
                        ),
                      ),
                      SizedBox(height: 26.45.h,),
                      SizedBox(
                        //width: 375.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: (){
                                _chooseBakaController.changePayMethod('bank',5);
                              },
                              child: Row(
                                children: [
                                  SvgPicture.asset('images/bank.svg',width: 23.42.w,
                                      height: 24.43.h, fit: BoxFit.fitHeight),
                                  SizedBox(width: 22.64,),
                                  Text('تحويل بنكي مباشر للمعلن'),
                                ],
                              ),
                            ),
                            Obx(()=>Container(
                                margin: EdgeInsets.only(left: 50.0),
                                child: CircleAvatar(radius:10 ,backgroundColor: _chooseBakaController.paymentIndex.value==5?AppColors.blueAccentColor:AppColors.whiteColor,)),),
                            //SizedBox(width: 10.0,)
                          ],
                        ),
                      ),
                      SizedBox(height: 8.9.h,)
                    ])),
          )),
      SizedBox(height:18.h),
      AdvertisersButton(text: 'تأكيد الدفع', onPressed: (){
        //Get.toNamed('/successfulPayingPage');
        if(_chooseBakaController.paymentIndex==-1){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text('يرجى اختيار طريقة الدفع !',style: TextStyle(color: AppColors.whiteColor,fontSize: 17,fontFamily: 'Arabic-Regular'),),
          ));
          //return;
        }else{
          LoadingDailog().showLoading(context);
          _chooseBakaController.payNow(context);
        }
      },width: 320.w,backgroundColor: AppColors.verifyButtonColor,textColor: AppColors.blueAccentColor,),
      SizedBox(height:18.h),
    ]);
  }
}


