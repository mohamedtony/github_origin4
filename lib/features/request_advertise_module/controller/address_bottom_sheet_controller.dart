import 'dart:io';

import 'package:advertisers/features/home_page/model/SelectedSocialMedia.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddressBottomSheetController extends GetxController {
  late TextEditingController placeNameController;
  late TextEditingController placeAddressController;
  @override
  void onInit() {
    placeNameController = TextEditingController();
    placeAddressController = TextEditingController();
    super.onInit();
  }


  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}