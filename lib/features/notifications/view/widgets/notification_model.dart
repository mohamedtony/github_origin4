import 'package:advertisers/features/notifications/controller/notifications_controller.dart';


// class NotificationModel {
//   String content;
//   String underlinedText;
//   String dateTime;
//   NotificationType type;
//   late String title;
//   late String iconPath;
//   bool read = false;
//   bool pinned = false;
//   ProfileModel? profileData;
//   NotificationModel(
//       {required this.content,
//         required this.dateTime,
//         required this.type,
//         this.underlinedText = '',
//         this.read = false,
//         this.pinned = false,
//         this.profileData}) {
//     switch (type) {
//       case NotificationType.platform:
//         title = 'اشعارات المنصة';
//         iconPath = 'images/notification/Path 3835.svg';
//         break;
//       case NotificationType.orders:
//         title = 'اشعارات الطلبات';
//         iconPath = 'images/notification/orders-notification.svg';
//         break;
//       case NotificationType.hiring:
//         title = 'اشعارات التوطيف';
//         iconPath = 'images/notification/hiring-notification.svg';
//         break;
//       case NotificationType.wallet:
//         title = 'اشعارات المحفظة';
//         iconPath = 'images/notification/wallet-notification.svg';
//         break;
//       case NotificationType.payment:
//         title = 'اشعارات الدفع';
//         iconPath = 'images/notification/payment-notification.svg';
//         break;
//       case NotificationType.chat:
//         title = 'اشعارات الشات';
//         iconPath = 'images/notification/chat-notification.svg';
//         break;
//       case NotificationType.comments:
//         title = 'اشعارات التعليقات';
//         iconPath = 'images/notification/comments-notification.svg';
//         break;
//       case NotificationType.settings:
//         title = 'اشعارات الاعدادات';
//         iconPath = 'images/notification/settings-notification.svg';
//         break;
//       case NotificationType.ads:
//         title = 'اشعارات الاعلانات';
//         iconPath = 'images/notification/ads-notification.svg';
//         break;
//       case NotificationType.coupons:
//         title = 'اشعارات الكوبونات';
//         iconPath = 'images/notification/coupons-notification.svg';
//         break;
//       case NotificationType.support:
//         title = 'اشعارات الدعم';
//         iconPath = 'images/notification/support-notification.svg';
//         break;
//       case NotificationType.reports:
//         title = 'اشعارات التقارير';
//         iconPath = 'images/notification/reports-notification.svg';
//         break;
//       case NotificationType.accounts:
//         title = 'اشعارات الحسابات';
//         iconPath = 'images/notification/accounts-notification.svg';
//         break;
//       case NotificationType.subscriptions:
//         title = 'اشعارات الاشتراكات';
//         iconPath = 'images/notification/subscriptions-notification.svg';
//         break;
//       default:
//     }
//   }
// }
//
// class ProfileModel {
//   String image;
//   String name;
//   ProfileModel({
//     required this.image,
//     required this.name,
//   });
// }