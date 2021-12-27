import 'package:advertisers/notifications/view/widgets/appbar_widget.dart';
import 'package:advertisers/notifications/view/widgets/notification_widget.dart';
import 'package:advertisers/notifications/view/widgets/notifications_title.dart';
import 'package:advertisers/notifications_settings/controller/notification_settings_controller.dart';
import 'package:advertisers/notifications_settings/view/widgets/notification_settings_widget.dart';
import 'package:advertisers/notifications_settings/view/widgets/notifications_settings_title.dart';
import 'package:advertisers/shared/advertisers_appbar/advertisers_app_bar.dart';
import 'package:advertisers/shared/radio_buttons/radio_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsSettingsPage extends StatelessWidget {
  const NotificationsSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarWidget(
          isSearchBar: true,
          isNotification: false,
          isBack: true,
          isSideMenu: false,
          // isFilter: false,
          // searchBarBigLeft: false,
          searchHint: "ابحث باسم العميل / رقم الطلب",

        ),
        preferredSize: Size(MediaQuery.of(context).size.width, 150.0),
      ),
      body: Column(
        children: [
          NotificationsSettingsTitle(),
          Padding(padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          child:  GetBuilder<NotificationsSettingsController>(
            init: NotificationsSettingsController(),
            builder: (controller) => InkWell(
              onTap: (){
                controller.changeChecked();
                print("${controller.isChecked}");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                 controller.isChecked == true ? selectedRadio() : unSelectedRadio(),
                  SizedBox(
                    width:10,
                  ),
                  Text("تعديل",style: TextStyle(fontSize: 16,color:Color(0xff244094)),)
                ],
              ),
            ),
          ),




          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: ListView.separated(
            padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 4,
            ),
            physics: const BouncingScrollPhysics(),
            itemCount: NotificationSettingsData.notificationsSettings.length,
            separatorBuilder: (_, __) => const SizedBox(
                height: 10,
            ),
            itemBuilder: (_, index) => NotificationSettingsWidget(
                notificationSettingsData: NotificationSettingsData.notificationsSettings[index],
            ),
          ),
              )),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 15,
              left: 35,
              right: 35,
              top: 5
            ),
            child: Row(
              children: [
                Expanded(child: InkWell(onTap: (){

                },
                  child: Container(
                    height: 40,
                    child: Center(
                      child: Text("حفظ",style: TextStyle(color: Color(0xff4391D4),fontSize: 18,fontWeight: FontWeight.bold),),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xffE8E8E8),
                    ),
                  ),)),

                SizedBox(
                  width: 20,
                ),
                Expanded(child: InkWell(onTap: (){

                },
                  child: Container(
                    height: 40,
                    child: Center(
                      child: Text("رجوع",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xff4391D4),

                    ),
                  ),)) ,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
