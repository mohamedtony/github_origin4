import 'package:advertisers/app_core/app_localization/app_localization.dart';
import 'package:advertisers/app_core/network/service.dart';
import 'package:advertisers/app_core/routes/routes.dart';
//import 'package:advertisers/shared/network/service.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:logger/logger.dart';


//final logger = Logger();
String token='';
final FirebaseMessaging firebaseMessaging= FirebaseMessaging.instance;
RestClient? client;
Dio? dio;
 late FirebaseAuth auth;
late var storage;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // account.getPreferences();
  await Firebase.initializeApp();

  dio = Dio();
  dio?.options.headers['Content-Type'] = 'application/json';
  dio?.interceptors.add(InterceptorsWrapper(
    onError: (DioError e, ErrorInterceptorHandler handler){
      final r = e.response;
      Logger().i(e.response);
      if (r != null && r.statusCode == 401) {
        //dio.interceptors.requestLock.lock();
        //dio.interceptors.responseLock.lock();
        print("in_status_401");
        /*if (context == null) {
          print("context_is_null");
        }
        Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (BuildContext context) => LoginPage(),
            ),
                (route) => false);
        return e;
      }*/
    }}
  ));


  //dio?.options.headers['Content-Type'] = 'multipart/form-data';
/*  dio?.options = BaseOptions(
      receiveTimeout: 30000,
      connectTimeout: 30000,
      contentType: 'application/json',
      *//* If needed headers *//*
      headers: {
        'Authorization': 'Bearer  40|UrWNjwnaUs6pK4RjcNztJpB6kK97LlnbKzCEeTpd',
        //'X-ApiKey': 'ZGslzIzEyMw==',
        'Content-Type': 'application/json'
      }
  );*/
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

  @override
  void initState() {

    firebaseMessaging.getToken().then((String? token) {

      print('>>>>>>>>>>>>>$token');
    });


    // var locale=const Locale('ar', 'EG');
    // Get.updateLocale(locale);
    storage=GetStorage();

    super.initState();

  }



  @override
  Widget build(BuildContext context) {

    return  ScreenUtilInit(
      //this line belongs to ali don't touch just commit it if you want
        designSize: const Size(375, 812),
        builder:()=>GetMaterialApp(
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
          translations: LocalizationService(),
          initialRoute: '/',
          getPages: Routes.routes,
          theme: ThemeData(
            fontFamily: 'Arabic-Regular',
          ),
        ));
  }
}

// advertising_channels_sheet.dart
// attatchements_sheet.dart
// discount_coupon_sheet.dart
// notice_sheet.dart
// urls_bottom_sheet.dart