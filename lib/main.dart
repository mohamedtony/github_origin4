import 'package:advertisers/app_core/app_localization/app_localization.dart';
import 'package:advertisers/app_core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // account.getPreferences();
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

          translations: LocalizationService(),
          initialRoute: '/AdvertiserQrPage',
          getPages: Routes.routes,
          theme: ThemeData(
            fontFamily: 'Arabic-Regular',
          ),
        ));
  }
}