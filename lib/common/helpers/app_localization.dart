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
    "title": 'Localization'
  };
  static const Map<String, dynamic> AR = {
    "title": 'ការធ្វើមូលដ្ឋានីយកម្ម'
  };
}
