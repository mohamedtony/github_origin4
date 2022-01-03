import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NotificationWidget extends StatelessWidget {
  final NotificationData notificationData;

  const NotificationWidget({
    Key? key,
    required this.notificationData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Expanded(
          // flex: 5,
          child: SizedBox(
            // height: 105.h,
            child: Card(
              // color: Colors.grey[200],
              clipBehavior: Clip.antiAlias,
              elevation: 3,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              // RoundedRectangleBorder(
              //   borderRadius: BorderRadius.only(
              //     topRight: Get.locale?.languageCode ==
              //             const Locale('en').languageCode
              //         ? const Radius.circular(15.0)
              //         : const Radius.circular(0.0),
              //     bottomRight: Get.locale?.languageCode ==
              //             const Locale('en').languageCode
              //         ? const Radius.circular(15.0)
              //         : const Radius.circular(0.0),
              //     topLeft: Get.locale?.languageCode ==
              //             const Locale('ar').languageCode
              //         ? const Radius.circular(15.0)
              //         : const Radius.circular(0.0),
              //     bottomLeft: Get.locale?.languageCode ==
              //             const Locale('ar').languageCode
              //         ? const Radius.circular(15.0)
              //         : const Radius.circular(0.0),
              //   ),
              // ),
              child: Stack(
                children: [
                  Row(
                    children: [
 Container(
   width: 70,
 ),
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 18.0,
                                  vertical: 8,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          notificationData.title,
                                          style: TextStyle(
                                            color: Colors.blue[900],
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.sp,
                                            height: 1.3,
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          notificationData.type,
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14.sp,
                                            height: 1.3,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        SvgPicture.asset(notificationData.typeImage),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      notificationData.desc,
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.sp,
                                        height: 1.3,
                                      ),
                                    ),
                                    Align(
                                      alignment: Get.locale?.languageCode ==
                                              const Locale('en').languageCode
                                          ? Alignment.bottomRight
                                          : Alignment.bottomLeft,
                                      child: Text(
                                        notificationData.time,
                                        style: const TextStyle(
                                          color: Colors.black54,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child:                  Container(
                      height: 100.h,
                      padding: const EdgeInsets.all(1.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.only(
                          topRight:
                          Get.locale?.languageCode == const Locale('en').languageCode
                              ? const Radius.circular(0.0)
                              : const Radius.circular(25.0),
                          bottomRight:
                          Get.locale?.languageCode == const Locale('en').languageCode
                              ? const Radius.circular(0.0)
                              : const Radius.circular(25.0),
                          topLeft:
                          Get.locale?.languageCode == const Locale('ar').languageCode
                              ? const Radius.circular(0.0)
                              : const Radius.circular(25.0),
                          bottomLeft:
                          Get.locale?.languageCode == const Locale('ar').languageCode
                              ? const Radius.circular(0.0)
                              : const Radius.circular(25.0),
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey[200],
                        foregroundImage: NetworkImage(
                          notificationData.imageUrl,
                        ),
                      ),
                    ),)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class NotificationData {
  final String imageUrl, title, desc, type, typeImage, time;

  NotificationData({
    required this.imageUrl,
    required this.title,
    required this.desc,
    required this.type,
    required this.typeImage,
    required this.time,
  });

  static List<NotificationData> notifications = [
    NotificationData(
      imageUrl:
          'https://www.neshanstyle.com/blog/wp-content/uploads/2019/11/122-1-710x434.jpg',
      title: 'احمد السيد اسماعيل',
      desc: 'تم الموافقة على الطلب 313131',
      type: 'الطلبات',
      typeImage: 'images/chat.svg',
      time: 'منذ 3.5 ساعة',
    ),
    NotificationData(
      imageUrl:
          'https://www.neshanstyle.com/blog/wp-content/uploads/2019/11/122-1-710x434.jpg',
      title: 'احمد السيد اسماعيل',
      desc: 'تم الموافقة على الطلب 313131',
      type: 'الطلبات',
      typeImage: 'images/chat.svg',
      time: 'منذ 3.5 ساعة',
    ),
    NotificationData(
      imageUrl:
          'https://www.neshanstyle.com/blog/wp-content/uploads/2019/11/122-1-710x434.jpg',
      title: 'احمد السيد اسماعيل',
      desc: 'تم الموافقة على الطلب 313131',
      type: 'الطلبات',
      typeImage: 'images/chat.svg',
      time: 'منذ 3.5 ساعة',
    ),
    NotificationData(
      imageUrl:
          'https://www.neshanstyle.com/blog/wp-content/uploads/2019/11/122-1-710x434.jpg',
      title: 'احمد السيد اسماعيل',
      desc: 'تم الموافقة على الطلب 313131',
      type: 'الطلبات',
      typeImage: 'images/chat.svg',
      time: 'منذ 3.5 ساعة',
    ),
    NotificationData(
      imageUrl:
          'https://www.neshanstyle.com/blog/wp-content/uploads/2019/11/122-1-710x434.jpg',
      title: 'احمد السيد اسماعيل',
      desc: 'تم الموافقة على الطلب 313131',
      type: 'الطلبات',
      typeImage: 'images/chat.svg',
      time: 'منذ 3.5 ساعة',
    ),
    NotificationData(
      imageUrl:
          'https://www.neshanstyle.com/blog/wp-content/uploads/2019/11/122-1-710x434.jpg',
      title: 'احمد السيد اسماعيل',
      desc: 'تم الموافقة على الطلب 313131',
      type: 'الطلبات',
      typeImage: 'images/chat.svg',
      time: 'منذ 3.5 ساعة',
    ),
    NotificationData(
      imageUrl:
          'https://www.neshanstyle.com/blog/wp-content/uploads/2019/11/122-1-710x434.jpg',
      title: 'احمد السيد اسماعيل',
      desc: 'تم الموافقة على الطلب 313131',
      type: 'الطلبات',
      typeImage: 'images/chat.svg',
      time: 'منذ 3.5 ساعة',
    ),
    NotificationData(
      imageUrl:
          'https://www.neshanstyle.com/blog/wp-content/uploads/2019/11/122-1-710x434.jpg',
      title: 'احمد السيد اسماعيل',
      desc: 'تم الموافقة على الطلب 313131',
      type: 'الطلبات',
      typeImage: 'images/chat.svg',
      time: 'منذ 3.5 ساعة',
    ),
    NotificationData(
      imageUrl:
          'https://www.neshanstyle.com/blog/wp-content/uploads/2019/11/122-1-710x434.jpg',
      title: 'احمد السيد اسماعيل',
      desc: 'تم الموافقة على الطلب 313131',
      type: 'الطلبات',
      typeImage: 'images/chat.svg',
      time: 'منذ 3.5 ساعة',
    ),
  ];
}
