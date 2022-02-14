import 'package:flutter/material.dart';

class AppColors {
//=========================================================================================

//                         By Mohamed T. Hammad

//=========================================================================================
  static const Color activitiesDropDown = Color(0xFF182A5E);
  static const Color buttonDropDown = Color(0xFF378CC3);
  static const Color activitiesSheetRounded = Color(0xFFD5C7E9);
  static const Color activitiesSheetTextColor = Color(0xFF726B65);
  static const Color activitiesSheetTextBg = Color(0xFFFBD098);
  static const Color white = Color(0xFFFFFFFF);
  static const Color editProfileTextColorOpa = Color(0xFF244094);
  static const Color editProfileTextColor = Color(0xFF244094);
  static const Color filterAdvertiserColor = Color(0xFF21449F);
  static const Color addPhotoBottom2 = Color(0xFF4D7CC7);
  static const Color editProfileContainerColor = Color(0xFF46BEDC);
  static const Color selectedCity = Color(0xFF3689C2);
  static const Color addPhotoBottom = Color(0xFF64F5B1);
  static const Color dividerBottom = Color(0xFFD97D54);
  static const Color saveButtonBottomSheet = Color(0xFFE8E8E8);
  static const Color cancelButtonBottomSheet = Color(0xFFE8E8E8);
  static const Color bottomSheetTabColorRounded = Color(0xFFFF8B08);
  static const Color selectableColor = Color(0xFFFFAD31);
  static const Color dropDownFill = Color(0xFFDD784B);
  static const Color bottomSheetTabColor = Color(0xFFF5F5F5);
  static const Color searchAdsColor = Color(0xFF427FD1);
  static const Color beginSearchAds = Color(0xFFF9F9F9);
  static const Color endSearchAds = Color(0xFFF3F3F3);
  static const Color adVertiserPageDataColor = Color(0xFF041D67);
  static const Color dottedColor = Color(0xFFBEE9F2);
  static const Color borderDropDownColor = Color(0xFF46C2DC);
  static const Color coponPercentColorText = Color(0xFF6574A1);
  static const Color copyCodeColor = Color(0xFFAB99D5);
  static const Color dropFilterColor = Color(0xFF887FCE);
  static const Color unseletabColor = Color(0xFF707070);
  static const Color coponPercentColor = Color(0xFFF3F3F3);
  static const Color bgTabColor = Color(0xFFE9E9E9);
  static const Color advertiseNameColor = Color(0xFF132E82);
  static const Color unSelectedLabelColor = Color(0xFF6C84C8);
  static const Color selectedLabelColor = Color(0xFFFF87DD);
  static const Color beginColor = Color(0xFF48DBE1);
  static const Color endColor = Color(0xFF4166CD);
  static const Color tabColor = Color(0xFF4184CE);
  static const Color indicatorColor = Color(0xFFD97D54);
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}
