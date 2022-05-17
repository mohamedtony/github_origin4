import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:advertisers/NotificationDownloadingService.dart';
import 'package:advertisers/app_core/FirebaseDynamicLinkes.dart';
import 'package:advertisers/app_core/app_localization/app_localization.dart';
import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/responses/CreateAdvertiseRequestResponse.dart';
import 'package:advertisers/app_core/network/service.dart';
import 'package:advertisers/app_core/routes/routes.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:logger/logger.dart';
import 'features/employees/view/AddEmployeePage.dart';
//import 'firebase_options.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:dio/dio.dart' as myDio;
//final logger = Logger();
late String token;
final FirebaseMessaging firebaseMessaging= FirebaseMessaging.instance;
RestClient? client;
Dio? dio;
 late FirebaseAuth auth;
late var storage;

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  //await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

/// Create a [AndroidNotificationChannel] for heads up notifications
late AndroidNotificationChannel channel;

/// Initialize the [FlutterLocalNotificationsPlugin] package.
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
Future<void> initializeService() async {
  final service = FlutterBackgroundService();
  await service.configure(
    androidConfiguration: AndroidConfiguration(
      // this will executed when app is in foreground or background in separated isolate
      onStart: onStart,

      // auto start service
      autoStart: false,
      isForegroundMode: false,

    ),
    iosConfiguration: IosConfiguration(
      // auto start service
      autoStart: true,

      // this will executed when app is in foreground in separated isolate
      onForeground: onStart,

      // you have to enable background fetch capability on xcode project
      onBackground: onIosBackground,
    ),
  );
  service.startService();
}

bool onIosBackground(ServiceInstance service) {
  WidgetsFlutterBinding.ensureInitialized();
  print('FLUTTER BACKGROUND FETCH');

  return true;
}

void onStart(ServiceInstance service) {
  if (service is AndroidServiceInstance) {
    /*service.on('update').listen((event) {
      print('in updateeeeeee');
    });*/

    service.on('setAsForeground').listen((event) async {

      service.setAsForegroundService();
      service.setForegroundNotificationInfo(
          title: "طلبات الاعلان",
          content: "جارى رفع مرفقات طلبكم....."
      );
      print("setAsForegroundsetAsForegroundsetAsForegroundsetAsForeground");
      List<myDio.MultipartFile>? imageFideoFiles = [];


      for(var m in event!["attachments[]"]){
        var mFile =  await myDio.MultipartFile.fromFile(m,
            filename: m
                .split(Platform.pathSeparator)
                .last);
        imageFideoFiles.add(mFile);
      }

      event["attachments[]"]=imageFideoFiles;
      /*final service = FlutterBackgroundService();
      var isRunning = await service.isRunning();
      if (isRunning) {
        service.invoke("stopService");
      } else {
        service.startService();
      }*/
      Repository repo = Repository();
      //repo.postWithImageMultipart()
      repo.postWithImageMultipart<CreateAdvertiseRequestResponse>(
          path: 'requests/upload_files',
          fromJson: (json) => CreateAdvertiseRequestResponse.fromJson(json),
          json: event,
          onSuccess: (res) async {
            //Navigator.of(context).pop();
            //Get.back();
            Logger().i(res.toJson());
            //service.stopSelf();
           /* service.invoke(
              'update',
              {
                "current_date": DateTime.now().toIso8601String(),
                "device": "device",
              },
            );*/

           // service.stopSelf();
            service.setAsBackgroundService();
            //service.invoke("stopService");
            NotificationService().cancelNotification();
            if (res.message != null) {
              /*ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('تم إنشاء طلبك بنجاح !', style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontFamily: 'Arabic-Regular'),),
              ));*/
            }
            /*Navigator.of(context).pop();
            Navigator.of(context).pop();
            Get.delete<RequestAdvertiseController>();
            Get.delete<FindAdvertiseController>();*/
            //Get.offAllNamed('/Home');
          },onProgress: (prog,max){
        NotificationService().showNotification(prog,max);
      },
          onError: (err, res) {
            //Navigator.of(context).pop();
            // Get.back();
            Logger().i(err);
            service.invoke("stopService");
            NotificationService().cancelNotification();
          });
    });

    service.on('setAsBackground').listen((event) async {
      print("setAsBackgroundsetAsBackgroundsetAsBackgroundsetAsBackground");
      //NotificationService().showNotification(0,2);
      service.setAsBackgroundService();
      //if(event!=null) {
        print("mmMap${event!["ads_request_id"]}");
     // }
      service.setForegroundNotificationInfo(
          title: "My App Service",
          content: "Updated at ${DateTime.now()}"
      );


      List<myDio.MultipartFile>? imageFideoFiles = [];


      for(var m in event["attachments[]"]){
        var mFile =  await myDio.MultipartFile.fromFile(m,
            filename: m
                .split(Platform.pathSeparator)
                .last);
        imageFideoFiles.add(mFile);
      }

      event["attachments[]"]=imageFideoFiles;
      /*final service = FlutterBackgroundService();
      var isRunning = await service.isRunning();
      if (isRunning) {
        service.invoke("stopService");
      } else {
        service.startService();
      }*/
      Repository repo = Repository();
      //repo.postWithImageMultipart()
      repo.postWithImageMultipart<CreateAdvertiseRequestResponse>(
          path: 'requests/upload_files',
          fromJson: (json) => CreateAdvertiseRequestResponse.fromJson(json),
          json: event,
          onSuccess: (res) async {
            //Navigator.of(context).pop();
            //Get.back();
            Logger().i(res.toJson());
            //service.stopSelf();
            NotificationService().cancelNotification();
            if (res.message != null) {
              /*ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('تم إنشاء طلبك بنجاح !', style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontFamily: 'Arabic-Regular'),),
              ));*/
            }
            /*Navigator.of(context).pop();
            Navigator.of(context).pop();
            Get.delete<RequestAdvertiseController>();
            Get.delete<FindAdvertiseController>();*/
            //Get.offAllNamed('/Home');
          },onProgress: (prog,max){
        NotificationService().showNotification(prog,max);
      },
          onError: (err, res) {
            //Navigator.of(context).pop();
           // Get.back();
            Logger().i(err);
          });

    });
  }

  service.on('stopService').listen((event) {
    service.stopSelf();
  });
  service.invoke(
    'update',
    {
      "current_date": DateTime.now().toIso8601String(),
      "device": "device",
    },
  );
  // bring to foreground
  /*Timer.periodic(const Duration(seconds: 1), (timer) async {
    if (service is AndroidServiceInstance) {
      service.setForegroundNotificationInfo(
        title: "My App Service",
        content: "Updated at ${DateTime.now()}"
      );
    }

    /// you can see this log in logcat
    print('FLUTTER BACKGROUND SERVICE: ${DateTime.now()}');

    // test using external plugin
    final deviceInfo = DeviceInfoPlugin();
    String? device;
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      device = androidInfo.model;
    }

    if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      device = iosInfo.model;
    }

    service.invoke(
      'update',
      {
        "current_date": DateTime.now().toIso8601String(),
        "device": device,
      },
    );
  });*/
}


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeService();
  await Firebase.initializeApp();
  await NotificationService().init();
   FirebaseDynamicLinkService.initDynamicLink();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      'This channel is used for important notifications.', // description
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    /// Create an Android Notification Channel.
    ///
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
  await FlutterDownloader.initialize();
  FlutterDownloader.registerCallback(downloadCallback);
  dio = Dio();
  dio?.options.headers['Content-Type'] = 'application/json';
  //dio?.options.headers['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8';

  dio?.interceptors.add(InterceptorsWrapper(
    /*onResponse: ( r ,ResponseInterceptorHandler handler){
      Logger().i(r);
      //return r;
    },*/
    onError: (DioError e, ErrorInterceptorHandler handler){
      final r = e.response;
      //Logger().i(e.response);
      if(r!=null)
      print("MyCode" + r.statusCode.toString());
      print("MyCode" + r!.statusMessage!.toString());
      if (r != null && r.statusCode == 401) {
        print("in_status_401");
    }}
  ));



  client = RestClient(dio!);
  //client.getTasks().then((it) => logger.i(it));

  await GetStorage.init();
  await Firebase.initializeApp();

  auth = FirebaseAuth.instance;



  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Color(0xff4391D4)
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.white
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;

  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  static final navigatorKey =GlobalKey<NavigatorState>();
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  @override
  void initState() {

    firebaseMessaging.getToken().then((String? token1) {
     setState(() {
       token=token1??'';
     });
      print('>>>>>>>>>>>>>$token1');
    });


    // var locale=const Locale('ar', 'EG');
    // Get.updateLocale(locale);
    storage=GetStorage();

    super.initState();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    //WidgetsBinding.instance?.addPostFrameCallback((_) {
      FirebaseMessaging.instance
          .getInitialMessage()
          .then((RemoteMessage? message) {
        if (message != null) {


        }
      });

      FirebaseMessaging.onMessage.listen((RemoteMessage message) async{
        print('MMMMMMMMMMMMMMMMMMMMM$message');
        print(message.notification.toString()??' ');
        print("DDDDDDDDDDDDDDDDDD${message.data.toString()??' '}");
       late BuildContext? context1 = navigatorKey.currentState?.overlay?.context;
        await showDialog(
            context:context1?? context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(message.notification!.title!??' '),
                content: Text(message.notification!.body!??' '),
                actions: [
                  TextButton(
                    child: Text("Ok"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text("go"),
                    onPressed: () {
                      Navigator.of(context).pop();
                      if(message.data["model_type"]==": ads_request") {
                        Get.toNamed('/AdvertiserDetailsPage?requestId=${message
                            .data["model_id"]}');
                      }
                     // Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
        // RemoteNotification? notification = message.notification;
        // AndroidNotification? android = message.notification?.android;
        // if (notification != null && android != null && !kIsWeb) {
        //   flutterLocalNotificationsPlugin.show(
        //     notification.hashCode,
        //     notification.title,
        //     notification.body,
        //     NotificationDetails(
        //       android: AndroidNotificationDetails(
        //         channel.id,
        //         channel.name,
        //         channel.description,
        //         // TODO add a proper drawable resource to android, for now using
        //         //      one that already exists in example app.
        //         icon: 'launch_background',
        //       ),
        //     ),
        //   );
        // }

      });

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        print('AAAAAAAAAAAAAAAAAAAAAAAAAA${message.data}');
        print('A new onMessageOpenedApp event was published!');
        if(message.data["model_type"]=="ads_request") {
          Get.toNamed('/AdvertiserDetailsPage?requestId=${message
              .data["model_id"]}');
        }
        //   Navigator.pushNamed(
        //     context,
        //     '/message',
        //     arguments: MessageArguments(message, true),
        //   );
      });
  }

  // Future<void> sendPushMessage() async {
  //   if (token == null) {
  //     print('Unable to send FCM message, no token exists.');
  //     return;
  //   }
  //
  //   try {
  //     await http.post(
  //       Uri.parse('https://api.rnfirebase.io/messaging/send'),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //       body: constructFCMPayload(_token),
  //     );
  //     print('FCM request for device sent!');
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Future<void> onActionSelected(String value) async {
    switch (value) {
      case 'subscribe':
        {
          print(
            'FlutterFire Messaging Example: Subscribing to topic "fcm_test".',
          );
          await FirebaseMessaging.instance.subscribeToTopic('fcm_test');
          print(
            'FlutterFire Messaging Example: Subscribing to topic "fcm_test" successful.',
          );
        }
        break;
      case 'unsubscribe':
        {
          print(
            'FlutterFire Messaging Example: Unsubscribing from topic "fcm_test".',
          );
          await FirebaseMessaging.instance.unsubscribeFromTopic('fcm_test');
          print(
            'FlutterFire Messaging Example: Unsubscribing from topic "fcm_test" successful.',
          );
        }
        break;
      case 'get_apns_token':
        {
          if (defaultTargetPlatform == TargetPlatform.iOS ||
              defaultTargetPlatform == TargetPlatform.macOS) {
            print('FlutterFire Messaging Example: Getting APNs token...');
            String? token = await FirebaseMessaging.instance.getAPNSToken();
            print('FlutterFire Messaging Example: Got APNs token: $token');
          } else {
            print(
              'FlutterFire Messaging Example: Getting an APNs token is only supported on iOS and macOS platforms.',
            );
          }
        }
        break;
      default:
        break;
    }
  }



  @override
  Widget build(BuildContext context) {

    return  ScreenUtilInit(
      //this line belongs to ali don't touch just commit it if you want
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder:()=>GetMaterialApp(
          navigatorKey: navigatorKey,
          routingCallback: (r){
           // r!.route.;
           // r.route.navigator.
           // print("routingCall"+r!.toString());
            //Get.back();
          },
          onUnknownRoute: (r){
            print("onUnknownRoute");
          },
          localizationsDelegates: const [
            // THIS CLASS WILL BE ADDED LATER
            // A class which loads the translations from JSON files
            // Built-in localization of basic text for Material widgets
            GlobalMaterialLocalizations.delegate,
            // Built-in localization for text direction LTR/RTL
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate
          ],
          supportedLocales: const [
             Locale('ar'),
          ],
          debugShowCheckedModeBanner: false,
          locale: const Locale('ar'),
          // locale: LocalizationService.locale,
          fallbackLocale: LocalizationService.fallbackLocale,
         // fallbackLocale: LocalizationService.locale,
          builder: EasyLoading.init(),
            //home: MyHomePage(title: "mmmm",),
          translations: LocalizationService(),
          initialRoute: '/',
          getPages: Routes.routes,
          theme: ThemeData(
            fontFamily: 'Arabic-Regular',
          ),
        ));
  }
  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }
  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
     // developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }
  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
    if(_connectionStatus==ConnectivityResult.none){
    Get.snackbar(
      "تنبيه",
      "يجب الاتصال بالانترنت",
      icon: const Icon(Icons.person, color: Colors.red),
      backgroundColor: Colors.yellow,
      snackPosition: SnackPosition.BOTTOM,);
  }
  }
}
 void downloadCallback(
String id, DownloadTaskStatus status, int progress) {
if (true) {
print(
'Background Isolate Callback: task ($id) is in status ($status) and process ($progress)');
}
final SendPort send =
IsolateNameServer.lookupPortByName('downloader_send_port')!;
send.send([id, status, progress]);
}

// advertising_channels_sheet.dart
// attatchements_sheet.dart
// discount_coupon_sheet.dart
// notice_sheet.dart
// urls_bottom_sheet.dart