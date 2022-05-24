// import 'package:advertisers/features/notifications/view/widgets/appbar_widget.dart';
// import 'package:advertisers/features/notifications/view/widgets/notification_widget.dart';
// import 'package:advertisers/features/notifications/view/widgets/notifications_title.dart';
// import 'package:advertisers/shared/advertisers_appbar/advertisers_app_bar.dart';
// import 'package:flutter/material.dart';
//
// class NotificationsPage extends StatelessWidget {
//   const NotificationsPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         child: AppBarWidget(),
//         preferredSize: Size(MediaQuery.of(context).size.width, 150.0),
//       ),
//       body: Column(
//         children: [
//           NotificationsTitle(),
//           Expanded(
//               child: ListView.separated(
//             padding: const EdgeInsets.symmetric(
//               vertical: 8,
//               horizontal: 4,
//             ),
//             physics: const BouncingScrollPhysics(),
//             itemCount: NotificationData.notifications.length,
//             separatorBuilder: (_, __) => const SizedBox(
//               height: 10,
//             ),
//             itemBuilder: (_, index) => NotificationWidget(
//               notificationData: NotificationData.notifications[index],
//             ),
//           ))
//         ],
//       ),
//     );
//   }
// }
