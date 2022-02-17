import 'dart:io';

import 'package:get/get_rx/get_rx.dart';

class SelectedNotSelectedSortType {
  String? name;
  String? key;
  var isSelected = false.obs;

  SelectedNotSelectedSortType({
    this.name,
    this.key,
  });
}

