import 'package:get/get.dart';

class TermsController extends GetxController {
  bool checked = false;
  void termsCheckBox(bool value) {
    checked = value;
    validate();
  }

  bool valid = true;
  void validate() {
    if (checked == true) {
      valid = true;
      update();
    } else {
      valid = false;
      update();
    }
  }
}