import 'package:advertisers/features/add_advertiser_channel/controller/add_advertiser_channel_controller.dart';
import 'package:advertisers/features/advertising_influence_channels/controller/advertising_influence_channels_controller.dart';
import 'package:advertisers/features/request_advertise_module/controller/address_bottom_sheet_controller.dart';
import 'package:advertisers/features/users_module/controller/baka_details_controller.dart';
import 'package:advertisers/features/users_module/controller/choose_baka_controller.dart';
import 'package:advertisers/features/users_module/controller/forget_password_for_phone_controller.dart';
import 'package:advertisers/features/users_module/controller/login_controller.dart';
import 'package:advertisers/features/users_module/controller/register_new_advertiser_company_controller.dart';
import 'package:advertisers/features/users_module/controller/register_new_advertiser_user_controller.dart';
import 'package:advertisers/features/users_module/controller/register_new_client_user_controller.dart';
import 'package:advertisers/features/users_module/controller/register_new_client_company_controller.dart';
import 'package:advertisers/features/users_module/controller/register_phone_controller.dart';
import 'package:advertisers/features/users_module/view/screens/new_password_page.dart';
import 'package:advertisers/features/wallet_module/wallet_controller.dart';
import 'package:get/get.dart';

class DataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WalletController());
    Get.lazyPut(() => BakaDetailsController());
    Get.lazyPut(() => ForgetPasswordForPhoneController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => RegisterNewAdvertiserCompanyController());
    Get.lazyPut(() => RegisterNewAdvertiserUserController());
    Get.lazyPut(() => RegisterNewClientUserController());
    Get.lazyPut(() => RegisterNewClientCompanyController());
    Get.lazyPut(()=>RegisterPhoneController());
    Get.lazyPut(() => ChooseBakaController());
    Get.lazyPut(() => NewPasswordPage());
    Get.lazyPut(() => AdvertisingInfluenceChannelsController());
    Get.lazyPut(() =>AddAdvertiserChannelController());



  }
}
