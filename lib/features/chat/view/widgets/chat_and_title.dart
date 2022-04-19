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
           height: 60,
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
                          'images/back-light.svg',
                          color: Colors.blue,
                          height: 30.h,
                        ),
                      ),
                    ),
                  ),
                   CircleAvatar(
                    radius: 25,
                    foregroundImage: NetworkImage(
                     image??' ',
    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                      name??' ',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: const Color(0xff4184CE)),
                        child: const Text(
                          "الشات",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      "images/chat.svg",
                      height: 21,
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
