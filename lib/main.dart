import 'package:advertisers/chat/view/pages/chat_page.dart';
import 'package:advertisers/chat/view/pages/chat_recent_page.dart';
import 'package:advertisers/lang/localization_get.dart';
import 'package:advertisers/notifications/view/pages/notifications_page.dart';
import 'package:advertisers/notifications_settings/view/pages/notifications_settings_page.dart';
import 'package:advertisers/users_module/view/screens/login_page.dart';
import 'package:advertisers/wallet_module/wallet_page.dart';
import 'package:advertisers/wallet_module/widgets/wallet_intro/wallet_intro_page.dart';
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
    var locale=const Locale('ar', 'EG');
    Get.updateLocale(locale);
    //LocalizationService().changeLocale(LocalizationService.langs.elementAt(0));
    super.initState();

  }



  @override
  Widget build(BuildContext context) {

    return  ScreenUtilInit(
      //this line belongs to ali don't touch just commit it if you want
        designSize: const Size(375.0,812.0),
        builder:()=>GetMaterialApp(
          debugShowCheckedModeBanner: false,
          locale: LocalizationService.fallbackLocale,
          fallbackLocale: LocalizationService.locale,
          translations: LocalizationService(),
          initialRoute: '/',
          getPages: [
            GetPage(name: '/', page: () =>NotificationsSettingsPage()),

          ],
          theme: ThemeData(
            fontFamily: 'Janna',
          ),
        ));
  }
}