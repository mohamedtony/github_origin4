import 'package:advertisers/app_core/network/models/NotificationsModel.dart';
import 'package:advertisers/features/notifications/controller/notifications_controller.dart';
import 'package:advertisers/features/notifications/view/widgets/colors.dart';
import 'package:advertisers/features/notifications/view/widgets/default_alert_dialog.dart';
//import 'package:advertisers/features/notifications/view/widgets/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class NotificationItem extends StatelessWidget {
  final BuildContext context;
  final NotificationsController controller;
  final NotificationsModel notificationModel;
  final int index;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final Future<bool> Function(DismissDirection)? confirmDismiss;
  const NotificationItem(
      this.context,
      this.notificationModel,this.controller,
      this.index, {
        Key? key,
        this.onTap,
        this.onLongPress,
        this.confirmDismiss,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //controller.selectedIndex.value=index;
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Padding(
        padding: const EdgeInsetsDirectional.all(5),
        child: Dismissible(
          key: UniqueKey(),
          confirmDismiss: confirmDismiss,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17.r),
              color: notificationModel.seen!=null&& notificationModel.seen==true? AppColors.light
                 :
              AppColors.defaultGrey,
              boxShadow: [
                BoxShadow(
                    color: AppColors.notificationContainerShadow,
                    offset: const Offset(0, 3),
                    blurRadius: 10)
              ],
            ),
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.topStart,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            height: 24.h,
                            width: 155.w,
                            decoration: BoxDecoration(
                                color: AppColors.notificationTitle,
                                borderRadius: BorderRadius.circular(12)),
                            child: Text(
                              notificationModel.title??' ',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontFamily: 'Jannat',
                                  color: AppColors.defaultText),
                            ),
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 44.sp,
                                height: 44.sp,
                                decoration: const BoxDecoration(
                                  color: AppColors.notificationTitle,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Container(
                                width: 38.sp,
                                height: 38.sp,
                                padding: EdgeInsets.all(10.sp),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          AppColors.appBarGradient1,
                                          AppColors.appBarGradient2
                                        ])),
                                ///icons along with notification type
                                child: SvgPicture.asset(
                                    notificationModel.model_type=='chat'?'images/notification/chat-notification.svg':notificationModel.model_type=='ads_request'?
                                'images/notification/orders-notification.svg':notificationModel.model_type=='comment'?'images/notification/comments-notification.svg':
                                    notificationModel.model_type=='ads'?'images/notification/ads-notification.svg': notificationModel.model_type=='subscription'?
                                    'images/notification/subscriptions-notification.svg': notificationModel.model_type=='wallet'?'images/notification/wallet-notification.svg':
                                    notificationModel.model_type=='employee'?'images/notification/hiring-notification.svg':notificationModel.model_type=='withdraw'?'images/notification/payment-notification.svg':''),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        // notificationModel.dateTime,
                         notificationModel.created_at?.substring(0,19)??' ',
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: AppColors.darkGrey,
                            fontFamily: 'Jannat'),
                      ),
                      const SizedBox(width: 30)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: 60.sp, bottom: 7, end: 30),
                    child: RichText(
                      text: TextSpan(
                          style: const TextStyle(
                              color: AppColors.darkGrey,
                              fontSize: 14,
                              fontFamily: 'Jannat'),
                          children: [
                            TextSpan(text: notificationModel.body),
                            TextSpan(
                                text:'', //notificationModel.underlinedText,
                                style: const TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 2,
                                )),
                          ]),
                    ),
                  ),
                  const SizedBox(height: 5),
                  if (notificationModel.model_type == "employee")
                  //  if (notificationModel.profileData != null)
                    Container(
                      height: 46.h,
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsetsDirectional.only(
                          start: 60, bottom: 20),
                      decoration: BoxDecoration(
                          color: AppColors.light,
                          borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(39.r),
                            bottomStart: Radius.circular(39.r),
                            topEnd: Radius.circular(17.r),
                            bottomEnd: Radius.circular(17.r),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.notificationContainerShadow,
                                offset: const Offset(0, 3),
                                blurRadius: 10)
                          ]),
                      child: Row(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0x12000000),
                                    offset: Offset(2, 2),
                                    blurRadius: 4)
                              ],
                            ),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  notificationModel.user!.image??' '),
                                  //notificationModel.profileData!.image),
                              radius: 15.r,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                           // notificationModel.profileData!.name,
                            notificationModel.user!.username??' ',
                            style: TextStyle(
                                color: AppColors.defaultText,
                                fontSize: 12.sp,
                                fontFamily: 'Jannat'),
                          ),
                          const Spacer(),
                          GetBuilder<NotificationsController>(
                            builder: (controller) {
                              return InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return const DefaultAlertDialog();
                                      });
                                 // controller.read(index);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15.w, vertical: 5.h),
                                  decoration: BoxDecoration(
                                    color: AppColors.defaultGrey,
                                    borderRadius: BorderRadius.circular(17),
                                    boxShadow: [
                                      BoxShadow(
                                          color: AppColors
                                              .notificationContainerShadow,
                                          offset: const Offset(0, 3),
                                          blurRadius: 10)
                                    ],
                                  ),
                                  child: Text(
                                    'التفاصيل',
                                    style: TextStyle(
                                        color: AppColors.defaultText,
                                        decoration: TextDecoration.underline,
                                        decorationThickness: 2,
                                        decorationColor: AppColors.defaultText,
                                        fontSize: 12.sp,
                                        fontFamily: 'Jannat'),
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(width: 35),
                        ],
                      ),
                    )
                ]),
                Visibility(
                  visible: notificationModel.starred==1?true:false,

                  child: Padding(
                    padding:
                    const EdgeInsetsDirectional.only(bottom: 4, end: 4),
                    child: Icon(
                      Icons.star,
                      color: const Color(0xFFF29423),
                      size: 15.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}