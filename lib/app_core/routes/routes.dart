import 'package:advertisers/app_core/bindings/choose_baka_binding.dart';
import 'package:advertisers/app_core/bindings/client_setting_binding.dart';
import 'package:advertisers/app_core/bindings/data_binding.dart';
import 'package:advertisers/features/add_advertiser_channel/add_advertiser_channel.dart';
import 'package:advertisers/features/add_advertiser_channel/controller/add_advertiser_channel_controller.dart';
import 'package:advertisers/features/advertiser_invoice_input/view/advertiser_invoice_input_page.dart';
import 'package:advertisers/features/advertiser_order_details/advertiser_order_details.dart';
import 'package:advertisers/features/advertiser_profile_order_page/advertiser_profile_order_page.dart';
import 'package:advertisers/features/advertiser_profile_order_page/controller/AdvertiserProfileOrderController.dart';
import 'package:advertisers/features/advertisers_copons/widgets/advertisers_copons.dart';
import 'package:advertisers/features/advertising_influence_channels/controller/edit_channel_advertiser_controller.dart';
import 'package:advertisers/features/advertising_influence_channels/view/page/edit_advertiser_channel.dart';
import 'package:advertisers/features/advanced_options/controller/advanced_options_controller.dart';
import 'package:advertisers/features/advanced_options/view/pages/advanced_options_page.dart';
import 'package:advertisers/features/advanced_options/view/widgets/advanced_options_widget.dart';
import 'package:advertisers/features/advertiser_account_status/tax_settings/controller/advertiser_account_status_controller.dart';
import 'package:advertisers/features/advertiser_account_status/tax_settings/view/pages/advertiser_account_status_page.dart';
import 'package:advertisers/features/advertiser_details/advertiser_details_page.dart';
import 'package:advertisers/features/advertiser_list_page/advertise_list_controller.dart';
import 'package:advertisers/features/advertiser_list_page/list_page.dart';
import 'package:advertisers/features/advertiser_qr/view/page/advertiser_qr_page.dart';
import 'package:advertisers/features/advertiser_settings_page/advertiser_settings_page.dart';
import 'package:advertisers/features/advertiser_settings_page/controller/AdvertiserSettingPageController.dart';
import 'package:advertisers/features/advertising_influence_channels/controller/advertising_influence_channels_controller.dart';
import 'package:advertisers/features/advertising_influence_channels/view/page/advertising_influence_channels_page.dart';
import 'package:advertisers/features/advertising_requests/view/advertising_requests_page.dart';
import 'package:advertisers/features/blocked_users_page/blocked_users_page.dart';
import 'package:advertisers/features/chat/view/pages/chat_page.dart';
import 'package:advertisers/features/chat/view/pages/chat_recent_page.dart';
import 'package:advertisers/features/client_order_details/client_order_details.dart';
import 'package:advertisers/features/client_order_details/controller/client_order_details_controller.dart';
import 'package:advertisers/features/client_payment_model/client_payment_model_page.dart';
import 'package:advertisers/features/client_payment_model/controller/client_payment_model_controller.dart';
import 'package:advertisers/features/client_setting_page/client_setting_page.dart';
import 'package:advertisers/features/client_setting_page/client_setting_page_controller.dart';
import 'package:advertisers/features/customer_order_invoice/controller/customer_order_invoice_controller.dart';
import 'package:advertisers/features/customer_order_invoice/view/customer_order_invoice_page.dart';
import 'package:advertisers/features/customer_order_invoice_out_puts/view/customer_order_invoice_out_puts.dart';
import 'package:advertisers/features/discounts/view/pages/discount_page.dart';
import 'package:advertisers/features/employees/controller/employees_controller.dart';
import 'package:advertisers/features/employees/view/AddEmployeePage.dart';
import 'package:advertisers/features/employees/view/EmployeeArchivePage.dart';
import 'package:advertisers/features/employees/view/ShowEmployeePage.dart';
import 'package:advertisers/features/employees/view/employees_page.dart';
import 'package:advertisers/features/gallery/gallery_page.dart';
import 'package:advertisers/features/help_and_support/guides_videos/controller/guides_videos_controller.dart';
import 'package:advertisers/features/help_and_support/guides_videos/guides_videos_page.dart';
import 'package:advertisers/features/help_and_support/help_and_support_page.dart';
import 'package:advertisers/features/help_and_support/partener_success_page/controller/partener_success_controller.dart';
import 'package:advertisers/features/help_and_support/partener_success_page/partner_success_page.dart';
import 'package:advertisers/features/help_and_support/redundancy_questions_page/controller/redundancy_questions_controller.dart';
import 'package:advertisers/features/help_and_support/redundancy_questions_page/redudndancy_questions_page.dart';
import 'package:advertisers/features/home_page/view/pages/home_bottom_navigation.dart';
import 'package:advertisers/features/my_ads/view/my_ads_page.dart';
import 'package:advertisers/features/my_comments_advertiser/view/comments_page.dart';
import 'package:advertisers/features/my_orders/controller/my_orders_controller.dart';
import 'package:advertisers/features/my_orders/view/my_orders_page.dart';
import 'package:advertisers/features/my_orders_and_my_orders_archive/my_orders_and_my_orders_archive.dart';
import 'package:advertisers/features/my_orders_archive/controller/my_orders_archive_controller.dart';
import 'package:advertisers/features/my_orders_archive/view/my_orders_archive_page.dart';
import 'package:advertisers/features/notifications/view/pages/notifications_page.dart';
import 'package:advertisers/features/notifications_settings/view/pages/notifications_settings_page.dart';
import 'package:advertisers/features/reason_rejecting_advertisement/controller/reason_rejecting_advertisement_controller.dart';
import 'package:advertisers/features/reason_rejecting_advertisement/view/page/reason_rejecting_advertisement.dart';
import 'package:advertisers/features/request_advertise_module/view/pages/request_advertise_page.dart';
import 'package:advertisers/features/tajer_order_details/tajer_order_details.dart';
 import 'package:advertisers/features/tax_settings/view/pages/tax_settings_page.dart';
import 'package:advertisers/features/users_module/controller/baka_details_controller.dart';
import 'package:advertisers/features/users_module/controller/choose_baka_controller.dart';
import 'package:advertisers/features/users_module/controller/forget_password_for_phone_controller.dart';
import 'package:advertisers/features/users_module/controller/login_controller.dart';
import 'package:advertisers/features/users_module/controller/newPasswordController.dart';
import 'package:advertisers/features/users_module/controller/register_new_advertiser_company_controller.dart';
import 'package:advertisers/features/users_module/controller/register_new_advertiser_user_controller.dart';
import 'package:advertisers/features/users_module/controller/register_new_client_company_controller.dart';
import 'package:advertisers/features/users_module/controller/register_new_client_user_controller.dart';
import 'package:advertisers/features/users_module/controller/register_phone_controller.dart';
import 'package:advertisers/features/users_module/view/screens/baka_details.dart';
import 'package:advertisers/features/users_module/view/screens/baka_payments_table.dart';
import 'package:advertisers/features/users_module/view/screens/choose_baka_page.dart';
import 'package:advertisers/features/users_module/view/screens/forget_password_for_phone.dart';
import 'package:advertisers/features/users_module/view/screens/login_page.dart';
import 'package:advertisers/features/users_module/view/screens/new_password_page.dart';
import 'package:advertisers/features/users_module/view/screens/pay_verification.dart';
import 'package:advertisers/features/users_module/view/screens/register_account_type.dart';
import 'package:advertisers/features/users_module/view/screens/register_new_advertiser_tab_bar.dart';
import 'package:advertisers/features/users_module/view/screens/register_phone.dart';
import 'package:advertisers/features/users_module/view/screens/register_new_client_tab_bar.dart';
import 'package:advertisers/features/users_module/view/screens/start_page.dart';
import 'package:advertisers/features/users_module/view/screens/successful_paying_page.dart';
import 'package:advertisers/features/users_module/view/screens/verification_code_page.dart';
import 'package:advertisers/features/wallet_module/controllers/charge_controller.dart';
import 'package:advertisers/features/wallet_module/controllers/points_controller.dart';
import 'package:advertisers/features/wallet_module/controllers/process_controller.dart';
import 'package:advertisers/features/wallet_module/controllers/withdraw_controller.dart';
import 'package:advertisers/features/wallet_module/wallet_page.dart';
import 'package:advertisers/features/wallet_module/widgets/point_widgets/point_widget.dart';
import 'package:advertisers/features/wallet_module/widgets/processes_widgets/processes_widget.dart';
import 'package:advertisers/features/wallet_module/widgets/pulls_widgets/pulls_widget.dart';
import 'package:advertisers/features/wallet_module/widgets/shipping_widgets/shipping_widget.dart';
import 'package:advertisers/features/wallet_module/widgets/wallet_intro/controller/wallet_intro_controller.dart';
import 'package:advertisers/features/wallet_module/widgets/wallet_intro/wallet_intro_page.dart';
import 'package:advertisers/reason_rejecting_advertisement_customer/view/page/reason_rejecting_advertisement_customer.dart';
import 'package:get/get.dart';

class Routes {
  static final routes = [

    GetPage(
        name: '/ClientPaymentModelPage',
        page: () =>ClientPaymentModelPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<ClientPaymentModelController>(() => ClientPaymentModelController());

        })),
    // GetPage(
    //   name: '/',

    GetPage(
      name: '/',
      page: () =>StartPage(),),
    GetPage(
      name: '/loginPage',
      page: () =>LoginPage(),
      binding: BindingsBuilder(() {
        Get.lazyPut<LoginController>(() => LoginController());
      }),

    ),

    GetPage(
      name: '/EditAdvertiserChannel',
      page: () =>EditAdvertiserChannel(),
      binding: BindingsBuilder(() {
        Get.lazyPut<EditChannelAdvertiserController>(() => EditChannelAdvertiserController());
      }),

    ),
    GetPage(
      name: '/newPasswordPage',
      page: () =>NewPasswordPage(),
      binding: BindingsBuilder(() {
        Get.lazyPut<NewPasswordController>(() => NewPasswordController());
      }),

    ),
    GetPage(
      name: '/AdvertiserSettingsPage',
      page: () => AdvertiserSettingsPage(),
      binding: BindingsBuilder(() {
        Get.lazyPut<AdvertiserSettingPageController>(() => AdvertiserSettingPageController());
      }),
    ),
    // GetPage(
    //   name: '/AdvancedOptionsPage',
    //   page: () => AdvancedOptionsPage(),
    //   binding: BindingsBuilder(() {
    //     Get.lazyPut<AdvancedOptionsController>(() => AdvancedOptionsController());
    //   }),
    // ),
    GetPage(
      name: '/BakaPaymentsTable',
      page: () => BakaPaymentsTable(),
    ),
    GetPage(
      name: '/GalleryPage',
      page: () => GalleryPage(),
    ),
    GetPage(
      name: '/BlockedUsersPage',
      page: () => BlockedUsersPage(),
    ),
    GetPage(
      name: '/RedudndancyQuestionsPage',
      page: () => RedudndancyQuestionsPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<RedundancyQuestionsController>(() => RedundancyQuestionsController());

        })),
    GetPage(
      name: '/PartnerSuccessPage',
      page: () => PartnerSuccessPage(),
  binding: BindingsBuilder(() {
  Get.lazyPut<PartnerSuccessController>(() => PartnerSuccessController());

  })),
    GetPage(
      name: '/HelpAndSupportPage',
      page: () => HelpAndSupportPage(),

    ),
    GetPage(
      name: '/GuidesVideosPage',
      page: () => GuidesVideosPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<GuidesVideosController>(() => GuidesVideosController());

        })),
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
        name: '/chooseBakaPage',
        page: () => ChooseBakaPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<ChooseBakaController>(() => ChooseBakaController());
        })),
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
          Get.lazyPut<RegisterNewAdvertiserUserController>(() => RegisterNewAdvertiserUserController(),fenix:true);
        }), BindingsBuilder(() {
          Get.lazyPut<RegisterNewAdvertiserCompanyController>(() => RegisterNewAdvertiserCompanyController(),fenix: true);
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
    // GetPage(
    //   name: '/advancedOptionsPage',
    //   page: () => AdvancedOptionsPage(),
    //
    // ),
    //   GetPage(
    //     name: '/AdvertisingInfluenceChannelsPage',
    //     page:() => AdvertisingInfluenceChannelsPage(),
    //     binding:BindingsBuilder(() {
    // Get.lazyPut<AdvertisingInfluenceChannelsController>(() => AdvertisingInfluenceChannelsController());
    // }),),
    //   GetPage(
    //     name: '/TaxSettingsPage',
    //     page: () => TaxSettingsPage(),
    //
    //   ),
    GetPage(
      name: '/chooseBakaDetails',
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
    //   GetPage(
    //     name: '/AdvertiserAccountStatusPage',
    //     page: () => AdvertiserAccountStatusPage(),
    // binding: BindingsBuilder(() {
    // Get.lazyPut<AdvertiserAccountStatusController>(() => AdvertiserAccountStatusController());
    // })),
    GetPage(
        name: '/AddAdvertiserChannel',
        page: () => AddAdvertiserChannel(),
        binding: BindingsBuilder(() {
          Get.lazyPut<AddAdvertiserChannelController>(() => AddAdvertiserChannelController());
        })),
    GetPage(
        name: '/CustomerOrderInvoicePage',
        page: () => CustomerOrderInvoicePage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<CustomerOrderInvoiceController>(() => CustomerOrderInvoiceController());
        })),
    // GetPage(
    //   name: '/MyOrdersArchivePage',
    //   page: () => MyOrdersArchivePage(),
    // ),
    GetPage(
      name: '/CommentsPage',
      page: () => CommentsPage(),
    ),
    GetPage(
      name: '/MyAdsPage',
      page: () => MyAdsPage(),
    ),

    GetPage(
        name: '/MyOrdersAndMyOrdersArchive',
        page: () => MyOrdersAndMyOrdersArchive(),
        bindings: [ BindingsBuilder(() {
          Get.lazyPut<MyOrdersController>(() => MyOrdersController());
        }), BindingsBuilder(() {
          Get.lazyPut<MyOrdersArchiveController>(() => MyOrdersArchiveController());
        })]
    ),
    GetPage(
      name: '/AdvertiserDetailsPage',
      page: () => AdvertiserDetailsPage(),
    ),
    GetPage(
      name: '/clientSettingPage',
      page: () => ClientSettingPage(),
      // binding: ClientSettingBinding()
      binding: BindingsBuilder(() {
        Get.lazyPut<ClientSettingPageController>(() => ClientSettingPageController());
      }),
    ),
    GetPage(
      name: '/AdvertisingRequestsPage',
      page: () => AdvertisingRequestsPage(),
    ),
    GetPage(
      name: '/RequestAdvertisePage',
      page: () => RequestAdvertisePage(),
    ),
    GetPage(
      name: '/ListPage',
      page: () => ListPage(),
      binding: BindingsBuilder(() {
        Get.lazyPut<AdvertiseListController>(() => AdvertiseListController());
      }),
    ),
    GetPage(
      name: '/ReasonRejectingAdvertisement',
      page: () => ReasonRejectingAdvertisement(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ReasonRejectingAdvertisementController>(() => ReasonRejectingAdvertisementController());
      }),
    ),
    GetPage(
      name: '/ReasonRejectingAdvertisementCustomer',
      page: () => ReasonRejectingAdvertisementCustomer(),

    ),
    GetPage(
      name: '/CustomerOrderInvoiceOutPutsPage',
      page: () => CustomerOrderInvoiceOutPutsPage(),

    ),
    GetPage(
      name: '/AdvertiserInvoiceInputs',
      page: () => AdvertiserInvoiceInputs(),

    ),
    GetPage(
      name: '/AdvertiserOrderDetails',
      page: () => AdvertiserOrderDetails(),

    ),
    GetPage(
      name: '/TajerOrderDetails',
      page: () => TajerOrderDetails(),
    ),

    GetPage(
      name: '/AddEmployeePage',
      page: () => AddEmployeePage(),
    ),
    GetPage(
      name: '/EmployeesPage',
      page: () => EmployeesPage(),
    ),
    GetPage(
      name: '/WalletIntroPage',
      page: () => WalletIntroPage(),
      binding: BindingsBuilder(() {
        Get.lazyPut<WalletIntroController>(() => WalletIntroController());
      }),
    ),
    GetPage(
      name: '/PointsWidget',
      page: () => PointsWidget(),
      binding: BindingsBuilder(() {
        Get.lazyPut<PointsController>(() => PointsController());
      }),
    ),
    GetPage(
      name: '/ProcessesWidget',
      page: () => ProcessesWidget(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ProcessesController>(() => ProcessesController());
      }),
    ),
    GetPage(
      name: '/ShippingWidget',
      page: () => ShippingWidget(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ChargeController>(() => ChargeController());
      }),
    ),
    GetPage(
      name: '/PullsWidget',
      page: () => PullsWidget(),
      binding: BindingsBuilder(() {
        Get.lazyPut<WithdrawController>(() => WithdrawController());
      }),
    ),
    GetPage(
      name: '/ShowEmployeePage',
      page: () => ShowEmployeePage(),
    ),
    GetPage(
      name: '/EmployeeArchivePage',
      page: () => EmployeeArchivePage(),
    ),
    GetPage(
      name: '/CientOrderDetails',
      page: () => CientOrderDetails(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ClientOrderDetailsController>(() => ClientOrderDetailsController());
      }),
    ),


    GetPage(
      name: '/AdvertiserProfileOrderPage',
      page: () => AdvertiserProfileOrderPage(),
      binding: BindingsBuilder(() {
        Get.lazyPut<AdvertiserProfileOrderController>(() => AdvertiserProfileOrderController());
      }),

    ),
    GetPage(
      name: '/AdvertisersCopons',
      page: () => AdvertisersCopons(),
      /*binding: BindingsBuilder(() {
        Get.lazyPut<AdvertiserProfileOrderController>(() => AdvertiserProfileOrderController());
      }),*/

    ),

  ];
}
