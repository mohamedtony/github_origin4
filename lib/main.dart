import 'package:advertisers/app_core/app_localization/app_localization.dart';
import 'package:advertisers/app_core/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get_storage/get_storage.dart';

late FirebaseAuth auth;
late var storage;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  auth = FirebaseAuth.instance;
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

          translations: LocalizationService(),
          initialRoute: '/',
          getPages: Routes.routes,
          theme: ThemeData(
            fontFamily: 'Arabic-Regular',
          ),
        ));
  }
}
