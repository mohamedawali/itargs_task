// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> ar = {
    "setting": "الاعدادات",
    "dMode": "الوضع المظلم",
    "more": "المزيد",
    "arLang": "اللغة العربية",
    "topLikes": "الاكثر اعجاب",
    "home": "الرئيسية"
  };
  static const Map<String, dynamic> en = {
    "setting": "Setting",
    "dMode": "Dark Mode",
    "more": "More",
    "arLang": "Arabic Language",
    "topLikes": "Top Likes",
    "home": "Home"
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "ar": ar,
    "en": en
  };
}
