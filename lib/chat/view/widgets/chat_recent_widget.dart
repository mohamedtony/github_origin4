import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';

class ChatRecentWidget extends StatelessWidget {
  const ChatRecentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 0,
        left: 4,
        right: 4,
      ),
      height: 110,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight:
                Get.locale?.languageCode == const Locale('en').languageCode
                    ? const Radius.circular(20.0)
                    : const Radius.circular(100.0),
            bottomRight:
                Get.locale?.languageCode == const Locale('en').languageCode
                    ? const Radius.circular(20.0)
                    : const Radius.circular(100.0),
            topLeft: Get.locale?.languageCode == const Locale('ar').languageCode
                ? const Radius.circular(20.0)
                : const Radius.circular(100.0),
            bottomLeft:
                Get.locale?.languageCode == const Locale('ar').languageCode
                    ? const Radius.circular(20.0)
                    : const Radius.circular(100.0),
          ),
        ),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: CircleAvatar(
                radius: 43,
                foregroundImage: NetworkImage(
                  'https://www.neshanstyle.com/blog/wp-content/uploads/2019/11/122-1-710x434.jpg',
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'احمد السيد اسماعيل',
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      'وعليكم السلام ورحمة الله',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 18.0,
                left: 16,
                right: 16,
                top: 8,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'منذ 3.5 ساعة',
                    style: TextStyle(
                      color: Colors.grey[600],
                      // fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    // padding: EdgeInsets.all(6),
                    height: 25.w,
                    width: 25.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xff6fd3de),
                            Color(0xff486ac7),
                          ]),
                    ),
                    child: Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
