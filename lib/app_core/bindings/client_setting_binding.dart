import 'package:advertisers/features/client_setting_page/client_setting_page_controller.dart';
import 'package:get/get.dart';
class ClientSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ClientSettingPageController());
  }
}