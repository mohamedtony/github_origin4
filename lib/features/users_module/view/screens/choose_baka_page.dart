

import 'package:advertisers/features/users_module/app_colors.dart';
import 'package:advertisers/features/users_module/controller/choose_baka_controller.dart';
import 'package:advertisers/features/users_module/view/cards/baka_advertiser_caed_with_bg.dart';
import 'package:advertisers/features/users_module/view/cards/baka_advertiser_card.dart';
import 'package:advertisers/features/users_module/view/usedWidgets/advertisers_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ChooseBakaPage extends StatelessWidget {
   ChooseBakaPage({Key? key}) : super(key: key);
  final ChooseBakaController _chooseBakaController = Get.find();

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
            borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight:  Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 25.0, // soften the shadow
                spreadRadius: 5.0, //extend the shadow
                offset: Offset(
                  0.0, // Move to right 10  horizontally
                  15.0, // Move to bottom 10 Vertically
                ),
              )
            ],
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
                  mainAxisSize: MainAxisSize.max,
                    children:[
                     Obx(()=> _chooseBakaController.subscriptionBaka.isNotEmpty?ListView.builder(
                         itemCount: _chooseBakaController.subscriptionBaka.length,
                         shrinkWrap: true,
                         itemBuilder: (BuildContext context,int index){
                           return Column(
                             children: [
                               Padding(
                                 padding: EdgeInsets.symmetric(horizontal:6.5.w,vertical: 3.62.h),
                                 child: InkWell(
                                     onTap: (){
                                       // _chooseBakaController.indexClicked=index;
                                       _chooseBakaController.changeIndex(index,_chooseBakaController.subscriptionBaka.value[index].id!);
                                     },
                                     //child:_chooseBakaController.indexClicked==index?BakaAdvertiserCardBG(subscriptionBaka:_chooseBakaController.subscriptionBaka.value[index],bakaName: 'الباقة الاساسية',slash:true, domain: 'مجانية لمدة سنة سنة',price: '500',imageStr: 'images/mainBaka.png',):BakaAdvertiserCard(subscriptionBaka:_chooseBakaController.subscriptionBaka.value[index],bakaName: 'الباقة الاساسية',slash:true, domain: 'مجانية لمدة سنة',price: '500',imageStr: 'images/mainBaka.png',)),
                                     child:BakaAdvertiserCardBG(subscriptionBaka:_chooseBakaController.subscriptionBaka.value[index],bakaName: 'الباقة الاساسية',slash:true, domain: 'مجانية لمدة سنة سنة',price: '500',imageStr: 'images/mainBaka.png',index:index))
                               ),
                               SizedBox(height: 5.h,),
                             ],
                           );
                         }
                     ):Container(
                       margin: EdgeInsets.only(top:30),
                         child: CircularProgressIndicator())),

                      /*Padding(
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
                      ),*/
                      SizedBox(height: 97.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AdvertisersButton(text: 'أختر باقة', onPressed: (){
                            if(_chooseBakaController.selectedBakaId!=-1) {
                              Get.toNamed('/chooseBakaDetails');
                            }else{
                              //Get.snackbar( '',"يرجى اختيار الباقة !");
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: const Text('يرجى اختيار الباقة !',style: TextStyle(color: AppColors.whiteColor,fontSize: 17,fontFamily: 'Arabic-Regular'),),
                                ));
                            }
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
