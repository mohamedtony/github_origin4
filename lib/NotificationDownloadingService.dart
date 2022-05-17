import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class NotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static final NotificationService _notificationService =
  NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  NotificationService._internal();

  Future<void> init() async {
    final AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('ic_launcher');

    final IOSInitializationSettings initializationSettingsIOS =
    IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
     // onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );

    final InitializationSettings initializationSettings =
    InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS,
        macOS: null);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
  }


  Future selectNotification(String? payload) async {
    //Handle notification tapped logic here
  }

  Future<void> showNotification(int pp,int max) async {

      AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
        '12345',   //Required for Android 8.0 or after
        'channelName: String', //Required for Android 8.0 or after
        'channelDescription: String', //Required for Android 8.0 or after
        importance: Importance.max,
        priority: Priority.max,
      playSound: true,
      autoCancel: false,
      showProgress: true,
      ongoing: true,
      progress: pp,
      maxProgress: max
    );
     NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
        12345,
        "طلبات الاعلان",
        "جارى رفع مرفقات طلبكم....",
        platformChannelSpecifics,
        payload: 'data',
    );

  }

  void cancelNotification(){
    flutterLocalNotificationsPlugin.cancel(12345);
  }
  

}