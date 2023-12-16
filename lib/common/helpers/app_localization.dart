import 'dart:ui';

import 'package:flutter_localization/flutter_localization.dart';
final FlutterLocalization localization = FlutterLocalization.instance;

class AppLocalization{

  static AppLocalization? _instance;

  AppLocalization._internal();

  factory AppLocalization() {
    return _instance??=AppLocalization._internal();
  }

   onInit() {
    localization.init(
      mapLocales: [
        const MapLocale('en', AppLocalization.EN),
        const MapLocale('ar', AppLocalization.AR),
      ],
      initLanguageCode: 'en',
    );
  }

  static  String translate(String key){
    return isArabic?AR[key].toString():EN[key].toString();
  }

  static bool  get isArabic=>localization.currentLocale==const Locale("ar");

  // add your localization keys here
  static const Map<String, dynamic> EN = {
    "HOME_TAB_TITLE":"Shop",
    "CATEGORY_TAB_TITLE":"Category",
    "NEW_TAB_TITLE":"New",
    "CART_TAB_TITLE":"Cart",
    "ME_TAB_TITLE":"Me"
  };
  static const Map<String, dynamic> AR = {
    "HOME_TAB_TITLE":"تسوق",
    "CATEGORY_TAB_TITLE":"الأقسام",
    "NEW_TAB_TITLE":"جديد",
    "CART_TAB_TITLE":"السلة",
    "ME_TAB_TITLE":"حسابي"
  };
}
