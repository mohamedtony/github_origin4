import 'package:advertisers/features/help_and_support/help_and_support_card.dart';
import 'package:advertisers/shared/widget_and_title/widget_and_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HelpAndSupportPage extends StatelessWidget {
  const HelpAndSupportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          WidgetAndTitle(
            title: "قنوات الإعلان والتأثير",
            iconWidget: SvgPicture.asset(
              "images/lamba.svg",
              height: 23,
              color: Color(0xc44184ce),
            ),
          ),
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
                HelpAndSupportCard(image: 'images/lamba.svg',title: 'الأسئلة المتكررة',),
                HelpAndSupportCard(image: 'images/lamba.svg',title: 'الدعم والتواصل',)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                HelpAndSupportCard(image: 'images/lamba.svg',title: 'شركاء النجاح',),
                HelpAndSupportCard(image: 'images/lamba.svg',title: 'فديوهات تعريفية',)
              ],
            ),
          )
        ],
      ),
    );
  }
}
