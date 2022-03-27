import 'package:advertisers/features/help_and_support/help_and_support_card.dart';
import 'package:advertisers/features/help_and_support/title_support_widget.dart';
import 'package:advertisers/features/users_module/app_colors.dart';
import 'package:advertisers/shared/widget_and_title/widget_and_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HelpAndSupportPage extends StatelessWidget {
  const HelpAndSupportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: 60,
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
              width: MediaQuery.of(context).size.width,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: EdgeInsetsDirectional.only(end: 32.8.w),
                  child: Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: SvgPicture.asset('images/arrow_back.svg',
                        height: 47.h, fit: BoxFit.fitHeight),
                  ),
                ),
              ),
            ),
         const TitleSupportWidget(title: "الدعم والمساعدة", image: 'images/lamba.svg'),

            SizedBox(
              child:SvgPicture.asset(
                "images/help.svg",
                height: 269.43.h,
                width: 322.43.w,

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                      onTap:(){
              Get.toNamed("/RedudndancyQuestionsPage") ;
            },
                      child: HelpAndSupportCard(image: 'images/questions.svg',title: 'الأسئلة المتكررة',)),
                  InkWell(
                      onTap:(){

                      },child: HelpAndSupportCard(image: 'images/callSupport.svg',title: 'الدعم والتواصل',))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0,left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                      onTap:(){
                        Get.toNamed("/PartnerSuccessPage") ;
                      },child: HelpAndSupportCard(image: 'images/sucess.svg',title: 'شركاء النجاح',)),
                  InkWell(
                      onTap:(){
                        Get.toNamed("/GuidesVideosPage") ;
                      },child: HelpAndSupportCard(image: 'images/video-gallery-line.svg',title: 'فديوهات تعريفية',))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
