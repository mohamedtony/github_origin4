import 'package:advertisers/lang/localization_get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class NotificationsSettingsTitle extends StatelessWidget {
  NotificationsSettingsTitle({
    Key? key,
  }) : super(key: key);
  final LocalizationService _localizationService = LocalizationService();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      elevation: 3,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: const Color(0xff4184CE)),
                child: const Text(
                  "اعدادات الاشعارات",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),

            SvgPicture.asset(
              "images/red_notification.svg",
              // height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
