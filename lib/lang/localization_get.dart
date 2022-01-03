
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:advertisers/lang/ar_EG.dart';
import 'package:advertisers/lang/en_US.dart';
class LocalizationService extends Translations {
  // Default locale
  static final locale = Locale('ar', 'EG');

  // fallbackLocale saves the day when the locale gets in trouble
  static final fallbackLocale = Locale('ar', 'EG');

  // Supported languages
  // Needs to be same order with locales
  static final langs = [
    'English',
    'Arabic',
  ];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    Locale('en', 'US'),
    Locale('ar', 'EG'),
  ];

  // Keys and their translations
  // Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': enUS, // lang/en_us.dart
    'ar_EG': arEG, // lang/tr_tr.dart
  };

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale!);
  }

  // Finds language in `langs` list and returns it as Locale
  Locale? _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
     if (lang == langs[i]) return locales[i];
    }
    return Get.locale;
    //return locales[0];
  }
}