import 'package:advertisers/app_core/bindings/data_binding.dart';
import 'package:advertisers/features/advanced_options/view/pages/advanced_options_page.dart';
import 'package:advertisers/features/advertiser_settings_page/advertiser_settings_page.dart';
import 'package:advertisers/features/advertising_influence_channels/view/page/advertising_influence_channels_page.dart';
import 'package:advertisers/features/blocked_users_page/blocked_users_page.dart';
import 'package:advertisers/features/chat/view/pages/chat_page.dart';
import 'package:advertisers/features/chat/view/pages/chat_recent_page.dart';
import 'package:advertisers/features/discounts/view/pages/discount_page.dart';
import 'package:advertisers/features/home_page/view/pages/home_bottom_navigation.dart';
import 'package:advertisers/features/notifications/view/pages/notifications_page.dart';
import 'package:advertisers/features/notifications_settings/view/pages/notifications_settings_page.dart';
import 'package:advertisers/features/tax_settings/view/pages/tax_settings_page.dart';
import 'package:advertisers/features/users_module/view/screens/baka_details.dart';
import 'package:advertisers/features/users_module/view/screens/baka_page.dart';
import 'package:advertisers/features/users_module/view/screens/forget_password_for_phone.dart';
import 'package:advertisers/features/users_module/view/screens/login_page.dart';
import 'package:advertisers/features/users_module/view/screens/pay_verification.dart';
import 'package:advertisers/features/users_module/view/screens/register_account_type.dart';
import 'package:advertisers/features/users_module/view/screens/register_new_advertiser_tab_bar.dart';
import 'package:advertisers/features/users_module/view/screens/register_phone.dart';
import 'package:advertisers/features/users_module/view/screens/registr_new_client_tab_bar.dart';
import 'package:advertisers/features/users_module/view/screens/verification_code_page.dart';
import 'package:advertisers/features/wallet_module/wallet_page.dart';
import 'package:get/get.dart';

class Routes {
  static final routes = [
    GetPage(
      name: '/',
      page: () => LoginPage(),
      binding: DataBinding(),
    ),
    GetPage(
      name: '/AdvertiserSettingsPage',
      page: () => AdvertiserSettingsPage(),
      binding: DataBinding(),
    ),
    GetPage(
      name: '/BlockedUsersPage',
      page: () => BlockedUsersPage(),
      binding: DataBinding(),
    ),
    GetPage(
      name: '/NotificationsPage',
      page: () => NotificationsPage(),
      binding: DataBinding(),
    ),
    GetPage(
      name: '/NotificationsSettingsPage',
      page: () => NotificationsSettingsPage(),
      binding: DataBinding(),
    ),
    GetPage(
      name: '/WalletPage',
      page: () => WalletPage(),
      binding: DataBinding(),
    ),
    GetPage(
      name: '/ChatPage',
      page: () => ChatPage(),
      binding: DataBinding(),
    ),
    GetPage(
      name: '/ChatRecentPage',
      page: () => ChatRecentPage(),
      binding: DataBinding(),
    ),
    GetPage(
      name: '/ForgetPasswordForPhone',
      page: () => ForgetPasswordForPhone(),
      binding: DataBinding(),
    ),
    GetPage(
      name: '/VerificationCodePage',
      page: () => VerificationCodePage(),
      binding: DataBinding(),
    ),
    GetPage(
      name: '/RegisterPhone',
      page: () => RegisterPhone(),
      binding: DataBinding(),
    ),
    GetPage(
      name: '/RegisterAccountType',
      page: () => RegisterAccountType(),
      binding: DataBinding(),
    ),
    GetPage(
      name: '/BakaPage',
      page: () => BakaPage(),
      binding: DataBinding(),
    ),
    GetPage(
      name: '/RegisterNewClientTapBar',
      page: () => RegisterNewClientTapBar(),
      binding: DataBinding(),
    ),
    GetPage(
      name: '/RegisterNewAdvertiserTapBar',
      page: () => RegisterNewAdvertiserTapBar(),
      binding: DataBinding(),
    ),
    GetPage(
      name: '/Home',
      page: () => Home(),
      binding: DataBinding(),
    ),
    GetPage(
      name: '/DiscountPage',
      page: () => DiscountPage(),
      binding: DataBinding(),
    ),
    GetPage(
      name: '/AdvancedOptionsPage',
      page: () => AdvancedOptionsPage(),
      binding: DataBinding(),
    ),
    GetPage(
      name: '/AdvertisingInfluenceChannelsPage',
      page: () => AdvertisingInfluenceChannelsPage(),
      binding: DataBinding(),
    ),
    GetPage(
      name: '/TaxSettingsPage',
      page: () => TaxSettingsPage(),
      binding: DataBinding(),
    ),
    GetPage(
      name: '/BakaDetails',
      page: () => BakaDetails(),
      binding: DataBinding(),
    ),
    GetPage(
      name: '/PayVerification',
      page: () => PayVerification(),
      binding: DataBinding(),
    ),
  ];
}
