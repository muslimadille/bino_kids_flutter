import 'dart:ui';

import 'package:flutter_localization/flutter_localization.dart';

import '../utils/constants/app_data.dart';
import 'local_storage.dart';
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
    _initLocal();
  }

  static  String translate(String key){
    return (isArabic?AR[key]??key:EN[key]??key);
  }
  static changeLanguage(String localKey)async{
    LocalStorage().putInBox(key: AppData.LANG_STORAGE_KEY, value: localKey);
    AppData.CURRENT_LANG=localKey;
    String code=localization.currentLocale!.languageCode.toString();
     localization.translate(localKey);
  }
   _initLocal(){
    AppData.CURRENT_LANG=LocalStorage().getFromBox(key: AppData.LANG_STORAGE_KEY)??"en";
    String code=localization.currentLocale!.languageCode.toString();
    if(code=="ar"){
      localization.translate("en");
    }
    Future.delayed(Duration(milliseconds: 3)).then((value){
      localization.translate(AppData.CURRENT_LANG);
    });
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
    "Done":"Done",
    "new_order":"New Order",
    "confirmed_order":"Order Confirmed",
    "delivering_order":"Delivering",
    "delivered_order":"Order Delivered",
    "canceled_order":"Order Canceled",
    "no_data":"No Items Found",
    "search":"Search",
    "about_us":"About us",
    "privacy_policy":"Privacy policy",
    "return_policy":"Return and exchange policy",
    "shipping_pollicy":"Shipping policy",
    "Logout":"Logout",
    "SIGNIN/REGISTER >":"SIGNIN/REGISTER >",
    "ADD TO CART":"ADD TO CART",
    "user_name_field_title":"Mobile number or Email address",
    "Password":"Password",
    "Login":"Login",
    "Register":"Register",
    "Continue with Facebook":"Continue with Facebook",
    "Continue with Google":"Continue with Google",
    "Or join with":"Or join with",
    "By continuing,you are agree to our ":"By continuing,you are agree to our ",
    "Privacy ":"Privacy ",
    "And ":"And ",
    "Term&conditions":"Term&conditions",
    "Colors:":"Colors:",
    "Sizes:":"Sizes:",
    "user_name":"User Name",
    "mobile_number":"Mobile Number",
    "email":"E-mail",
    "confirm_password":"Confirm password",
    "company_name":"Company name",
    "Company_address":"Company address",
    "Company_activity":"Company activity",
    "person":"person",
    "company":"company",
    "Cart is empty":"Cart is empty",
    "save":"save",
    "Order":"Order",
    "Cart":"Cart",
    "Apply Coupon":"Apply Coupon",
    "Apply":"Apply",
    "All":"All",
    "Set Order":"Set Order",
    "Address:":"Address:",
    "Date:":"Date:",
    "Bill Status:":"Bill Status:",
    "Bill number:":"Bill number:",
    "Total:":"Total:",
    "Charge value:":"Charge value:",
    "Stock notes: ":"Stock notes: ",
    "code":"Code",
    "Brand":"Brand",
    "material":"Material",
    "Age Group":"Age group",
    "Similar":"Similar"
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
    "Done":"تطبيق",
    "new_order":"طلب جديد",
    "confirmed_order":"تم تأكيد",
    "delivering_order":"جاري التوصيل",
    "delivered_order":"تم التوصيل",
    "canceled_order":"طلب  ملغي",
    "no_data":"لا يوجد عناصر متاحة",
    "search":"بحث",
    "about_us":"اعرف عنا",
    "privacy_policy":"سياسة الخصوصية",
    "return_policy":"سياسة الاستبدال والارجاع",
    "shipping_pollicy":"سياسة الشحن",
    "Logout":"تسجيل خروج",
    "SIGNIN/REGISTER >":"تسجيل/تسجيل الدخول",
    "ADD TO CART":"اضف للسلة",
    "user_name_field_title":"رقم الموبيل او البريد الإلكتروني",
    "Password":"كلمة المرور",
    "Login":"تسجيل دخول",
    "Register":"تسجيل",
    "Continue with Facebook":"تسجيل بحساب فيسبوك",
    "Continue with Google":"تسجيل بحساب جوجل",
    "Or join with":"او سجل بإستخدام",
    "By continuing,you are agree to our ":"بالاستمرار فانت توافع علي ",
    "Privacy ":"سياسة الخصوصية",
    "And ":"و ",
    "Term&conditions":"الشروط والأحكام",
    "Colors:":"الالوان:",
    "Sizes:":"المقاسات:",
    "user_name":"اسم المستخدم",
    "mobile_number":"الهاتف",
    "email":"البريد الإلكتروني",
    "confirm_password":"تأكيد كلمة المرور",
    "company_name":"اسم الشركة",
    "Company_address":"عنوان الشركة",
    "Company_activity":"نشاط الشركة",
    "person":"حساب شخصي",
    "company":"حساب شركة",
    "Cart is empty":"لايوجد عناصر في السلة",
    "save":"وفر",
    "Order":"اطلب",
    "Cart":"السلة",
    "Apply Coupon":"استخدم الكوبون",
    "Apply":"استخدام",
    "All":"الكل",
    "Set Order":"اتمام الطلب",
    "Address:":"العنوان:",
    "Date:":'التاريخ:',
    "Bill Status:":"حالة الطلب:",
    "Bill number:":'رقم الفاتورة:',
    "Total:":"الإجمالي",
    "Charge value:":"تكلفة الشحن:",
    "Stock notes: ":'ملاحظات المخزن:',
    "code":"الكود",
    "Brand":"المنتج",
    "material":"الخامة",
    "Age Group":"الفئة العمرية",
    "Similar":"منتجات مشابهة"
  };
}
