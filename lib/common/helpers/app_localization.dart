import 'dart:ui';

import 'package:flutter_localization/flutter_localization.dart';
final FlutterLocalization localization = FlutterLocalization.instance;
tr(String key){
  return AppLocalization.translate(key);
}
class AppLocalization{

  static AppLocalization? _instance;

  AppLocalization._internal();

  factory AppLocalization() {
    return _instance??=AppLocalization._internal();
  }

   onInit() async{
    await localization.init(
      mapLocales: [
        const MapLocale('en', AppLocalization.EN),
        const MapLocale('ar', AppLocalization.AR),
      ],
      initLanguageCode: 'en',
    );

  }

  static  String translate(String key){
    return (isArabic?AR[key]??key:EN[key]??key);
  }
  static changeLanguage(String localKey){
    localization.translate(localKey);
  }

  static bool  get isArabic=>localization.currentLocale==const Locale("ar");

  // add your localization keys here
  static const Map<String, dynamic> EN = {
    "HOME_TAB_TITLE":"Shop",
    "CATEGORY_TAB_TITLE":"Favourite",
    "NEW_TAB_TITLE":"New",
    "CART_TAB_TITLE":"Cart",
    "ME_TAB_TITLE":"Me",
    "EGP":"EGP",
    "see_all":"See All >",
    "most_watched":"Most watched",
    "Product_details":"Product details",
    "Shipping_to":"Shipping to",
    "Suggestions":"Suggestions",
    "Wish_List":"Wish List",
    "My_orders":"My orders",
    "View_All":"View All >",
    "Hi":"Hi",
    "CHANGE_LANGUAGE":"Change Language",
    "Settings":"Settings",
    "Filter":"Filter",
    "price":"Price",
    "clear":"clear",
    "Done":"Done"
  };
  static const Map<String, dynamic> AR = {
    "HOME_TAB_TITLE":"تسوق",
    "CATEGORY_TAB_TITLE":"المفضلة",
    "NEW_TAB_TITLE":"جديد",
    "CART_TAB_TITLE":"السلة",
    "ME_TAB_TITLE":"حسابي",
    "EGP":"ج.م",
    "see_all":"مشاهدة الكل >",
    "most_watched":"الأكثر مشاهدة",
    "Product_details":"تفاصيل المنتج",
    "Shipping_to":"عنوان الشحن",
    "Suggestions":"مقترحات",
    "Wish_List":"قائمة الرغبات",
    "My_orders":"طلباتي",
    "View_All":"عرض الكل >",
    "Hi":"مرحباً ",
    "CHANGE_LANGUAGE":"تغيير اللغة",
    "Settings":"الإعدادات",
    "Filter":"خيارات العرض",
    "price":"السعر",
    "clear":"مسح",
    "Done":"تطبيق"



  };
}
