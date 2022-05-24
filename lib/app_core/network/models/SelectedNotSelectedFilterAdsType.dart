import 'dart:io';

import 'package:get/get_rx/get_rx.dart';

class SelectedNotSelectedFilterAdsType {
  String? name;
  String? key;
  var isSelected = false.obs;

  SelectedNotSelectedFilterAdsType({
    this.name,
    this.key,
  });
}

