import 'package:advertisers/chat/view/pages/chat_page.dart';
import 'package:advertisers/chat/view/pages/chat_recent_page.dart';
import 'package:advertisers/lang/localization_get.dart';
import 'package:advertisers/users_module/view/screens/baka_page.dart';
import 'package:advertisers/notifications/view/pages/notifications_page.dart';
import 'package:advertisers/notifications_settings/view/pages/notifications_settings_page.dart';
import 'package:advertisers/users_module/view/screens/login_page.dart';
import 'package:advertisers/wallet_module/wallet_page.dart';
import 'package:advertisers/wallet_module/widgets/wallet_intro/wallet_intro_page.dart';
import 'package:advertisers/users_module/view/screens/forget_password_for_phone.dart';
import 'package:advertisers/users_module/view/screens/login_page.dart';
import 'package:advertisers/users_module/view/screens/register_account_type.dart';
import 'package:advertisers/users_module/view/screens/register_new_advertiser_tab_bar.dart';
import 'package:advertisers/users_module/view/screens/register_new_client_user.dart';
import 'package:advertisers/users_module/view/screens/register_phone.dart';
import 'package:advertisers/users_module/view/screens/registr_new_client_tab_bar.dart';
import 'package:advertisers/users_module/view/screens/verification_code_page.dart';
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
        designSize: const Size(375.0,812.0),
        builder:()=>GetMaterialApp(
          debugShowCheckedModeBanner: false,
          locale: LocalizationService.locale,
          fallbackLocale: LocalizationService.fallbackLocale,
         // fallbackLocale: LocalizationService.locale,

          translations: LocalizationService(),
          initialRoute: '/loginPage',
          getPages: [
            GetPage(name: '/', page: () =>LoginPage()),
            GetPage(name: '/NotificationsPage', page: () =>NotificationsPage()),
            GetPage(name: '/NotificationsSettingsPage', page: () =>NotificationsSettingsPage()),
            GetPage(name: '/WalletPage', page: () =>WalletPage()),
            GetPage(name: '/ChatPage', page: () =>ChatPage()),
            GetPage(name: '/ChatRecentPage', page: () =>ChatRecentPage()),
            GetPage(name: '/forgetPasswordForPhone', page: () =>ForgetPasswordForPhone()),
            GetPage(name: '/verificationCodePage', page: () =>VerificationCodePage()),
            GetPage(name: '/registerPhone', page: () =>RegisterPhone()),
            GetPage(name: '/registerAccountType', page: () =>RegisterAccountType()),
            GetPage(name: '/bakaPage', page: () =>BakaPage()),
            GetPage(name: '/registerNewClientTapBar', page: () =>RegisterNewClientTapBar()),
            GetPage(name: '/registerNewAdvertiserTapBar', page: () =>RegisterNewAdvertiserTapBar()),
          ],
          theme: ThemeData(
            fontFamily: 'Arabic-Regular',
          ),
        ));
  }
}