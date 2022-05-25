import 'package:advertisers/features/notifications/controller/notifications_controller.dart';
import 'package:advertisers/features/notifications/view/widgets/NotificationsSheet.dart';
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
import 'package:advertisers/features/home_page/app_colors.dart' as mColor;
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
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(75.0),
              child: AppBar(
                leading: InkWell(
                  onTap: (){
                    Get.toNamed("/ListPage");
                  },
                  child: Container(

                    margin: EdgeInsets.only(right: 10.0),
                    child: SvgPicture.asset(
                      'images/DrawerIcon.svg',
                      color: Colors.white,
                    ),
                  ),
                ),
                leadingWidth: 56.0,
                title: Container(
                  height: 40.0,
                  // alignment: Alignment.center,
                  child: TextField(
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),
                        prefixIcon: Container(
                          padding: EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            'images/search_icon.svg',
                          ),
                        ),
                        suffixIcon: InkWell(
                          onTap: (){
                            showBottomSheetForRequest(context, "lll");
                          },
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            child: SvgPicture.asset(
                              'images/filter_icon.svg',
                            ),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(70.0),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        //hintText: "Type in your text",
                        fillColor: Colors.white70),
                  ),
                ),
                actions: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 25,
                      ),
                      InkWell(
                        onTap: (){
                          Get.back();
                        },
                        child: SvgPicture.asset('images/arrow_back.svg',
                          // matchTextDirection: true,
                          height: 50, fit: BoxFit.fitHeight,color: Colors.white,),
                      ),

                    ],
                  ),
                ],
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [mColor.AppColors.beginColor, mColor.AppColors.endColor],
                    ),
                  ),
                ),
                elevation: 2,
                //  bottom: ,
              ),
            ),
            body: Column(children: [
             // const DefaultAppBar(notificationScreen: true),
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
                     // reverse: true,
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

  Future<void> showBottomSheetForRequest(BuildContext context,String type)  async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(10.0),
            topRight: const Radius.circular(10.0)),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          //maxChildSize: 0.8,
          //minChildSize: 100.0,
          //maxChildSize: 0.9,
          initialChildSize: 0.67,
          expand: false,
          builder: (context, scrollController) {
            return NotificationsSheet(
              scrollController: scrollController,type: type,);
          },
        );
      },
    );


    /*showMaterialModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
       // expand: true,
        isDismissible: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(10.0),
              topRight: const Radius.circular(10.0)),
        ),
       // clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (context) => BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: DraggableScrollableSheet(
            //maxChildSize: 0.8,
            //minChildSize: 100.0,

            initialChildSize: 0.67,
            expand: false,
            builder: (context, scrollController) {
              return AttatchementPage(
                  scrollController: scrollController);
            },
          )
        ),
      );*/

/*      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        isDismissible: true,
        //barrierColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(10.0),
              topRight: const Radius.circular(10.0)),
        ),
        //clipBehavior: Clip.antiAliasWithSaveLayer,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (context) =>  BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: DraggableScrollableSheet(
            //maxChildSize: 0.8,
            //minChildSize: 100.0,
            initialChildSize: 0.67,
           // expand: true,
            builder: (context, scrollController) {
              return ActivitiesBottomSheet(
                  scrollController: scrollController);
            },
          )),
      );*/

    /* showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(10.0),
              topRight: const Radius.circular(10.0)),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
            //maxChildSize: 0.8,
            //minChildSize: 100.0,

            initialChildSize: 0.67,
            expand: false,
            builder: (context, scrollController) {
              return ActivitiesBottomSheet(
                  scrollController: scrollController);
            },
          );
        },
      );*/
  }
}