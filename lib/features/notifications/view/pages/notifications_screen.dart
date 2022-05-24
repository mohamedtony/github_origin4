import 'package:advertisers/features/notifications/controller/notifications_controller.dart';
import 'package:advertisers/features/notifications/view/widgets/app_bar.dart';
import 'package:advertisers/features/notifications/view/widgets/colors.dart';
import 'package:advertisers/features/notifications/view/widgets/constants.dart';
import 'package:advertisers/features/notifications/view/widgets/default_button.dart';
import 'package:advertisers/features/notifications/view/widgets/notification_item.dart';
import 'package:advertisers/features/notifications/view/widgets/notification_model.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

// List<NotificationModel> notifications = [
//   NotificationModel(
//     content: 'تم الموافقة علي الطلب رقم ',
//     underlinedText: '321321321',
//     dateTime: '14 نوفمبر 2020 الساعة 7.25 م',
//     type: NotificationType.platform,
//   ),
//   NotificationModel(
//       content: 'تم الموافقة علي الطلب رقم ',
//       underlinedText: '321321321',
//       dateTime: '14 نوفمبر 2020 الساعة 7.25 م',
//       type: NotificationType.orders),
//   NotificationModel(
//       content:
//       'لقد ارسل إليك المؤثر حمدي الفريدي طلباً خاصاً يريد توظيفك بإدارة حسابه الإعلاني لدى منصة ( بي ترند ) بصلاحية معينة . ويمكنك قبول طلبه أو رفضه',
//       dateTime: '14 نوفمبر 2020 الساعة 7.25 م',
//       type: NotificationType.hiring,
//       profileData: ProfileModel(
//           name: 'حمدي محمد الفريدي',
//           image:
//           'https://media.istockphoto.com/photos/horizontal-portrait-of-young-smiling-arab-man-picture-id492786318?k=20&m=492786318&s=612x612&w=0&h=vHaDy0xhVCKCs_YXhuhMuSD6dNVE2DIXPAJYc3zKmD8=')),
//   NotificationModel(
//       content: 'تم الموافقة علي الطلب رقم ',
//       underlinedText: '321321321',
//       dateTime: '14 نوفمبر 2020 الساعة 7.25 م',
//       type: NotificationType.wallet),
//   NotificationModel(
//       content: 'تم الموافقة علي الطلب رقم ',
//       underlinedText: '321321321',
//       dateTime: '14 نوفمبر 2020 الساعة 7.25 م',
//       type: NotificationType.payment),
//   NotificationModel(
//       content: 'تم الموافقة علي الطلب رقم ',
//       underlinedText: '321321321',
//       dateTime: '14 نوفمبر 2020 الساعة 7.25 م',
//       type: NotificationType.chat),
//   NotificationModel(
//       content: 'تم الموافقة علي الطلب رقم ',
//       underlinedText: '321321321',
//       dateTime: '14 نوفمبر 2020 الساعة 7.25 م',
//       type: NotificationType.comments),
//   NotificationModel(
//       content: 'تم الموافقة علي الطلب رقم ',
//       underlinedText: '321321321',
//       dateTime: '14 نوفمبر 2020 الساعة 7.25 م',
//       type: NotificationType.settings),
//   NotificationModel(
//       content: 'تم الموافقة علي الطلب رقم ',
//       underlinedText: '321321321',
//       dateTime: '14 نوفمبر 2020 الساعة 7.25 م',
//       type: NotificationType.ads),
//   NotificationModel(
//       content: 'تم الموافقة علي الطلب رقم ',
//       underlinedText: '321321321',
//       dateTime: '14 نوفمبر 2020 الساعة 7.25 م',
//       type: NotificationType.coupons),
//   NotificationModel(
//       content: 'تم الموافقة علي الطلب رقم ',
//       underlinedText: '321321321',
//       dateTime: '14 نوفمبر 2020 الساعة 7.25 م',
//       type: NotificationType.support),
//   NotificationModel(
//       content: 'تم الموافقة علي الطلب رقم ',
//       underlinedText: '321321321',
//       dateTime: '14 نوفمبر 2020 الساعة 7.25 م',
//       type: NotificationType.reports),
//   NotificationModel(
//       content: 'تم الموافقة علي الطلب رقم ',
//       underlinedText: '321321321',
//       dateTime: '14 نوفمبر 2020 الساعة 7.25 م',
//       type: NotificationType.accounts),
//   NotificationModel(
//       content: 'تم الموافقة علي الطلب رقم ',
//       underlinedText: '321321321',
//       dateTime: '14 نوفمبر 2020 الساعة 7.25 م',
//       type: NotificationType.subscriptions),
// ];

class NotificationsScreen extends StatelessWidget {
 // NotificationsController _notificationsController=Get.put(NotificationsController());
  NotificationsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationsController>(
      init: NotificationsController(),
      builder: (controller) {
        return Directionality(
          textDirection: AppConstants.appDirection,
          child: Scaffold(
            body: Column(children: [
              const DefaultAppBar(notificationScreen: true),
              notificationStatesBar(),
              Expanded(
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: SmartRefresher(
                    controller: controller.refreshController,
                    enablePullUp: true,
                    onRefresh: () async {
                      final result = await controller.getNotifications(isRefresh: true);
                      if (result) {
                        controller.refreshController.refreshCompleted();
                      } else {
                        controller.refreshController.refreshFailed();
                      }
                    },
                    onLoading: () async {
                      final result = await controller.getNotifications();
                      if (result) {
                        controller.refreshController.loadComplete();
                      } else {
                        controller.refreshController.loadFailed();
                      }
                    },
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      reverse: true,
                      itemBuilder: (context, index) {

                          return NotificationItem(context, controller.notifications[index],
                              controller,index,
                              onTap: () {

                              // controller.read(index);
                              },
                              onLongPress: () {
                                controller.selectedIndex.value=index;
                                //controller.read(index);
                               if(controller.selectedIndex.value==index){
                                 controller.starMessage(notificationId:controller.notifications[controller.selectedIndex.value].id??0);
                               }
                               // controller.pin(index);
                              },
                              confirmDismiss: (dismissDirection) {
                                controller.selectedIndex.value=index;
                                controller.confirm.value=false;
                                CoolAlert.show(
                                        context: context,
                                        type: CoolAlertType.warning,
                                        text: 'هل تريد بالفعل حذف هذه الرسالة ؟',
                                        onConfirmBtnTap: () {
                                          controller.confirm.value=true;
                                          if(controller.selectedIndex.value==index) {
                                            controller.deleteMessage(notificationId:controller.notifications[controller.selectedIndex.value].id??0);

                                          }
                                          Navigator.pop(context);
                                        },showCancelBtn: true,
                                        onCancelBtnTap: (){
                                          controller.confirm.value=false;
                                          Navigator.pop(context);
                                        });

                                // if (controller.notifications[index].pinned) {
                                //   return Future.value(false);
                                // }
                                //controller.remove(index);
                                return Future.value(controller.confirm.value);
                              });},
                      itemCount: controller.notifications.length,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        );
      },
    );
  }

  Widget notificationStatesBar() {
    return Container(
      height: 40.h,
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.defaultGrey,
        boxShadow: [
          BoxShadow(
            color: AppColors.defaultStatesBarShadow,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 20),
          DefaultButton(
              minHeight: 30,
              minWidth: 135,
              text: 'الاشعارات',
              onPressed: () {},
              textStyle: TextStyle(fontSize: 15.sp, fontFamily: 'Jannat')),
          const SizedBox(width: 5),
          const Spacer(),
          SvgPicture.asset(
            'assets/svg/notification/active-notification.svg',
            height: 22.h,
            width: 20.w,
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}