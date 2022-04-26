import 'package:advertisers/lang/localization_get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

enum Show {
  recent,
  content,
}

class ChatAndTitle extends StatelessWidget {
  final Show show;
  ChatAndTitle({Key? key, required this.show,required this.name,required this.image}) : super(key: key);
  final LocalizationService _localizationService = LocalizationService();
 late String name,image;
  @override
  Widget build(BuildContext context) {
    return show == Show.content
        ? SizedBox(
           height: 45,
          child: Card(
              color: Colors.grey[200],
              elevation: 3,
              child: Row(
                children: [
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(Get.locale?.languageCode ==
                            const Locale('en').languageCode
                        ? math.pi
                        : 0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: SvgPicture.asset(
                          'images/back-light (1).svg',
                          color: Colors.blue,
                          height: 19.5,width: 5.13,fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                   CircleAvatar(
                    radius: 17,
                    foregroundImage: NetworkImage(
                     image??' ',
    ),
                  ),
                   SizedBox(
                    width: 20.w,
                  ),
                  Expanded(
                    child: Text(
                      name??' ',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: SvgPicture.asset(
                      "images/chat.svg",
                      height: 21,
                    ),
                  ),
                ],
              ),
            ),
        )
        : Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        if (Get.locale?.languageCode ==
                            const Locale('en').languageCode) {
                          _localizationService.changeLocale('Arabic');
                        } else {
                          _localizationService.changeLocale('English');
                        }
                      },
                      child: Container(
                        height: 30,
                        width: 111.w,
                        alignment:Alignment.center,
                        padding: EdgeInsets.only(
                            left: 30.w,right: 30.w, top: 4,bottom: 6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: const Color(0xff4184CE)),
                        child: Text(
                          "الشات",
                          style: TextStyle(color: Colors.white, fontSize: 15.sp),
                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      "images/chat.svg",
                      height: 19.79,
                      width: 19.79.w,
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.grey.withOpacity(.5),
                height: 1,
                width: double.infinity,
              ),
            ],
          );
  }
}
