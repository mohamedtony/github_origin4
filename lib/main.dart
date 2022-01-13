import 'package:advertisers/app_core/app_localization/app_localization.dart';
import 'package:advertisers/app_core/network/service.dart';
import 'package:advertisers/app_core/routes/routes.dart';
import 'package:advertisers/shared/network/service.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';


//final logger = Logger();

import 'package:get_storage/get_storage.dart';
RestClient? client;
Dio? dio;
late FirebaseAuth auth;
late var storage;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // account.getPreferences();
  dio = Dio();
  dio?.options.headers['Content-Type'] = 'application/json';
  dio?.options.headers['Content-Type'] = 'multipart/form-data';
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
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
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
          debugShowCheckedModeBanner: false,
          locale: LocalizationService.locale,
          fallbackLocale: LocalizationService.fallbackLocale,
         // fallbackLocale: LocalizationService.locale,
          builder: EasyLoading.init(),
          translations: LocalizationService(),
          initialRoute: '/chooseBakaPage',
          getPages: Routes.routes,
          theme: ThemeData(
            fontFamily: 'Arabic-Regular',
          ),
        ));
  }
}