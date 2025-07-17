import 'dart:ui';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'en_us.dart';
import 'es_es.dart';



class LanguagesManager extends Translations {
  Map<String, Map<String, String>> get keys => {
    'en_US': English,
    'en_ES': Spanish,
  };
  void changeLanguage(String langCode, String countryCode) {
    final locale = Locale(langCode, countryCode);
    Get.updateLocale(locale); // Forces immediate state update
  }
}

class LanguageController extends GetxController {
  static LanguageController instance = Get.find<LanguageController>();
  RxInt currentIndex = RxInt(0);
  RxBool isEnglish = true.obs;

  void onLanguageChanged(String lang, int index) async {
    currentIndex.value = index;
    Localization().selectedLocale(lang);
    // await UserSimplePreferences.setLanguageIndex(index);
    isEnglish.value = currentIndex.value == 0;
  }

  String getCurrentLocale() {
    final localeMap = {
      0: 'en', // English
      1: 'es', // Spanish
      // korean
    };
    return localeMap[currentIndex.value] ?? 'en';
  }
}

class Localization extends Translations {
  static Locale currentLocale = const Locale('en', 'US');
  static Locale fallBackLocale = const Locale('en', 'US');

  final List<String> languages = [
    'English',
    'Spanish',
  ];

  final List<Locale> locales = [
    const Locale('en', 'US'),
    const Locale('en', 'ES'),
  ];

  void selectedLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    currentLocale = locale;
    Get.updateLocale(currentLocale);
  }

  Locale _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < languages.length; i++) {
      if (lang == languages[i]) {
        return locales[i];
      }
    }
    return Get.locale!;
  }

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': English,
    'en_ES': Spanish,
  };
}
