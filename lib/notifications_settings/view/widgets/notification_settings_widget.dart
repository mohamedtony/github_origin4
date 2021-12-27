import 'package:advertisers/notifications_settings/controller/notification_settings_controller.dart';
import 'package:advertisers/shared/gradient_check_box/gradient_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NotificationSettingsWidget extends StatelessWidget {
  final NotificationSettingsData notificationSettingsData;

  const NotificationSettingsWidget({
    Key? key,
    required this.notificationSettingsData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return

      GetBuilder<NotificationsSettingsController>(
        init: NotificationsSettingsController(),
        builder: (controller) => Container(
          // color: Colors.black54,
          child: Row(
            children: [
              Expanded(child: Row(children: [
                Image.asset(
                  "${notificationSettingsData.imageUrl}",
                  height: 45,
                ),
                SizedBox(
                  width: 4,
                ),
                Text( "${notificationSettingsData.title}",style: TextStyle(fontSize: 16,color:Color(0xff244094)),)
              ],)),
              SizedBox(
                width: 20,
              ),

              Expanded(child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text("تنبيه",style: TextStyle(fontSize: 16,),),
                SizedBox(
                  width: 10,
                ),
                controller.checkList!.contains(notificationSettingsData.id) ?  Image.asset("${'images/volume_mute.png'}",height: 55,) :  Image.asset("${'images/volume-up.png'}",height: 55,),

              ],)),
              Expanded(child: InkWell(
                onTap: (){
                  if(controller.isChecked == true){
                    controller.addRemoveCheckList(notificationSettingsData.id);
                    print("${controller.checkList!}");
                  }

                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  Text("ايميل",style: TextStyle(fontSize: 16,color:Color(0xff244094)),),
                  SizedBox(
                    width: 10,
                  ),
                controller.checkList!.contains(notificationSettingsData.id) ? selectedBigCheckBox() : unSelectedBigCheckBox(),
                    SizedBox(
                      width: 15,
                    ),

                ],),
              )),
            ],
          ),
        ),
      );


  }
}

class NotificationSettingsData {
  final int?id;
  final String imageUrl, title;
  // final VoidCallback?  onPressed;

  NotificationSettingsData({
    this.id,
    required this.imageUrl,
    required this.title,
    // this.onPressed
  });

  static List<NotificationSettingsData> notificationsSettings = [
    NotificationSettingsData(
      title: "المنصة",
      imageUrl: "images/settings_gradiant.png",
      id: 1,
    ),
    NotificationSettingsData(
      title: "الطلبات",
      imageUrl: "images/copy.png",
      id: 2,
    ),
    NotificationSettingsData(
      title: "المحفظة",
      imageUrl: "images/wallet_gradiant.png",
      id: 3,
    ),
    NotificationSettingsData(
      title: "التقييم",
      imageUrl: "images/rate.png",
      id: 4,
    ),
    NotificationSettingsData(
      title: "الموظفين",
      imageUrl: "images/person.png",
      id: 5,
    ),
    NotificationSettingsData(
      title: "الشات",
      imageUrl: "images/chat.png",
      id: 6,
    ),
    NotificationSettingsData(
      title: "التعليقات",
      imageUrl: "images/comments.png",
      id: 7,
    ),
    NotificationSettingsData(
      title: "الاشتراك",
      imageUrl: "images/subscription.png",
      id: 8,
    ),

  ];
}
