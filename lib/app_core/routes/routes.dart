import 'package:advertisers/app_core/bindings/choose_baka_binding.dart';
import 'package:advertisers/app_core/bindings/data_binding.dart';
import 'package:advertisers/features/add_advertiser_channel/add_advertiser_channel.dart';
import 'package:advertisers/features/advanced_options/view/pages/advanced_options_page.dart';
import 'package:advertisers/features/advertiser_account_status/tax_settings/view/pages/advertiser_account_status_page.dart';
import 'package:advertisers/features/advertiser_qr/view/page/advertiser_qr_page.dart';
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
import 'package:advertisers/features/users_module/controller/baka_details_controller.dart';
import 'package:advertisers/features/users_module/controller/forget_password_for_phone_controller.dart';
import 'package:advertisers/features/users_module/controller/login_controller.dart';
import 'package:advertisers/features/users_module/controller/register_new_advertiser_company_controller.dart';
import 'package:advertisers/features/users_module/controller/register_new_advertiser_user_controller.dart';
import 'package:advertisers/features/users_module/controller/register_new_client_company_controller.dart';
import 'package:advertisers/features/users_module/controller/register_new_client_user_controller.dart';
import 'package:advertisers/features/users_module/controller/register_phone_controller.dart';
import 'package:advertisers/features/users_module/view/screens/baka_details.dart';
import 'package:advertisers/features/users_module/view/screens/choose_baka_page.dart';
import 'package:advertisers/features/users_module/view/screens/forget_password_for_phone.dart';
import 'package:advertisers/features/users_module/view/screens/login_page.dart';
import 'package:advertisers/features/users_module/view/screens/pay_verification.dart';
import 'package:advertisers/features/users_module/view/screens/register_account_type.dart';
import 'package:advertisers/features/users_module/view/screens/register_new_advertiser_tab_bar.dart';
import 'package:advertisers/features/users_module/view/screens/register_phone.dart';
import 'package:advertisers/features/users_module/view/screens/register_new_client_tab_bar.dart';
import 'package:advertisers/features/users_module/view/screens/start_page.dart';
import 'package:advertisers/features/users_module/view/screens/successful_paying_page.dart';
import 'package:advertisers/features/users_module/view/screens/verification_code_page.dart';
import 'package:advertisers/features/wallet_module/wallet_page.dart';
import 'package:get/get.dart';

class Routes {
  static final routes = [

    GetPage(
      name: '/',
      page: () =>ChooseBakaPage(),
      binding: ChooseBakaBinding(),

    ),
   /* GetPage(
      name: '/',

  GetPage(
  name: '/',
  page: () =>StartPage(),),
    GetPage(
      name: '/loginPage',
      page: () =>LoginPage(),
      binding: BindingsBuilder(() {
        Get.lazyPut<LoginController>(() => LoginController());
      }),

    ),*/
    GetPage(
      name: '/AdvertiserSettingsPage',
      page: () => AdvertiserSettingsPage(),

    ),
    GetPage(
      name: '/BlockedUsersPage',
      page: () => BlockedUsersPage(),

    ),
    GetPage(
      name: '/NotificationsPage',
      page: () => NotificationsPage(),

    ),
    GetPage(
      name: '/NotificationsSettingsPage',
      page: () => NotificationsSettingsPage(),

    ),
    GetPage(
      name: '/WalletPage',
      page: () => WalletPage(),

    ),
    GetPage(
      name: '/ChatPage',
      page: () => ChatPage(),

    ),
    GetPage(
      name: '/ChatRecentPage',
      page: () => ChatRecentPage(),

    ),
    GetPage(
      name: '/forgetPasswordForPhone',
      page: () => ForgetPasswordForPhone(),
      binding: BindingsBuilder(() {
  Get.lazyPut<ForgetPasswordForPhoneController>(() => ForgetPasswordForPhoneController());
  }),
    ),
    GetPage(
      name: '/verificationCodePage',
      page: () => VerificationCodePage(),
      binding: BindingsBuilder(() {
        Get.lazyPut<RegisterPhoneController>(() => RegisterPhoneController());
      }),
    ),
    GetPage(
      name: '/registerPhone',
      page: () => RegisterPhone(),
      binding: BindingsBuilder(() {
  Get.lazyPut<RegisterPhoneController>(() => RegisterPhoneController());
  })
    ),
    GetPage(
      name: '/registerAccountType',
      page: () => RegisterAccountType(),

    ),
    GetPage(
      name: '/bakaPage',
      page: () => ChooseBakaPage(),

    ),
    GetPage(
      name: '/registerNewClientTapBar',
      page: () => RegisterNewClientTapBar(),
      bindings: [ BindingsBuilder(() {
        Get.lazyPut<RegisterNewClientUserController>(() => RegisterNewClientUserController());
      }), BindingsBuilder(() {
        Get.lazyPut<RegisterNewClientCompanyController>(() => RegisterNewClientCompanyController());
      })]
    ),
    GetPage(
      name: '/registerNewAdvertiserTapBar',
      page: () => RegisterNewAdvertiserTapBar(),
        bindings: [ BindingsBuilder(() {
          Get.lazyPut<RegisterNewAdvertiserUserController>(() => RegisterNewAdvertiserUserController());
        }), BindingsBuilder(() {
          Get.lazyPut<RegisterNewAdvertiserCompanyController>(() => RegisterNewAdvertiserCompanyController());
        })]
    ),
    GetPage(
      name: '/Home',
      page: () => Home(),

    ),
    GetPage(
      name: '/DiscountPage',
      page: () => DiscountPage(),

    ),
    GetPage(
      name: '/advancedOptionsPage',
      page: () => AdvancedOptionsPage(),

    ),
    GetPage(
      name: '/AdvertisingInfluenceChannelsPage',
      page: () => AdvertisingInfluenceChannelsPage(),
      binding: DataBinding(),
    ),
    GetPage(
      name: '/TaxSettingsPage',
      page: () => TaxSettingsPage(),

    ),
    GetPage(
      name: '/bakaDetails',
      page: () => BakaDetails(),
      binding: BindingsBuilder(() {
        Get.lazyPut<BakaDetailsController>(() => BakaDetailsController());
      }),
    ),
    GetPage(
      name: '/registerPhone',
      page: () => RegisterPhone(),
      binding: BindingsBuilder(() {
        Get.lazyPut<RegisterPhoneController>(() => RegisterPhoneController());
      }),
    ),
    GetPage(
      name: '/payVerification',
      page: () => PayVerification(),

    ),
    GetPage(
      name: '/successfulPayingPage',
      page: () => SuccessfulPayingPage(),

    ),
    GetPage(
      name: '/AdvertiserQrPage',
      page: () => AdvertiserQrPage(),
    ),
    GetPage(
      name: '/AdvertiserAccountStatusPage',
      page: () => AdvertiserAccountStatusPage(),
    ),
    GetPage(
      name: '/AddAdvertiserChannel',
      page: () => AddAdvertiserChannel(),
    ),
  ];
}
