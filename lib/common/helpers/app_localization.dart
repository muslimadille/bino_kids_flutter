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
     localization.init(
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
    "order_details":"Order Details",
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
    "Bill number:":"  Order ID",
    "Total:":"Total:",
    "Charge value:":"Charge value:",
    "Stock notes: ":"Stock notes: ",
    "code":"Code",
    "Brand":"Brand",
    "material":"Material",
    "Age Group":"Age group",
    "Similar":"Similar",
    "success_add_to_cart":"item added to card",
    "About_us":"About us",
    "Sale":"Sale",
    "New":"New",
    "delete_account":"Delete Account",
    "contact_us":"Contact Us",
    "active_account":"Active Account",
    "otp_title_hint":"You will receive an SMS containing the activation code",
    "our_braches":"Our branches",
    "complete_order":"complete order",
    "shipping_info":"shipping information",
    "governorate":"Governorate",
    "select_governorate":"select governorate",
    "address":"address",
    "enter_address":"Enter address",
    "terms_and_condetions":"Terms and conditions",
    "agree_to":"Agree of ",
    "payment_method":"Payment method",
    "cash_on_delivery":"cash on delivery",
    "online_payment":"online payment",
    "shipping":"shipping: ",
    "discount_value":"discount value: ",
    "total_value":"total: ",
    "submit":"submit",
    "delete_account_message":"all the account data will remove from our side and you will not able to use this account again.",
    "today_deal":"Today Deal",
    "by":"By",
    "re_send":"resend",
    "otp_dont_receive_hint":"didn't receive the code? ",
    "no_notifications":"No notifications Found",
    "Notifications":"Notifications",
    "NO_INTERNET":"there is no internet connection",
    "check_connectrion":"Please check your network connection and try again.",
    "reset":"Reset",
    "forget_password_screen_title":"Forget password",
    "forget_password":"Forget password?",
    "change_password":"Change password",
    "change":"Change",
    "old_password":"Old password",
  "new_password":"New password",
    'confirm':"Confirm",
    "Total_after_shippng":"Total after shipping: ",
    "Total_after_discount":"Total after discount: ",
    "Total_before_discount":"Total before discount: ",

    "promo_code":"Promo code: ",
    "select_phone":"add mobile number",
    "enter_phone":"Enter your umber",
    "from:":"From:",
    "to:":"To:",
    "app_signi_btn_title":"Sign in with Apple",
    "update":"Update",
    "no_model_available":"this model isn't available now",
    "orderId":"Order number",
    "Quantity":"Quantity",
    "unit_price":"Unit price",
    "total_price":"Total price",
    "order_date":"Order date",
    "Total_after_discount_details":"Total after discount",


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
    "Similar":"منتجات مشابهة",
    "success_add_to_cart":"تمت الإضافة للسلة",
    "Sale":"Sale",
    "New":"جديد",
    "delete_account":"حذف الحساب",
    "contact_us":"اتصل بنا",
    "active_account":"تفعيل الحساب",
    "otp_title_hint":"ستصلك رسالة قصيرة تحتوي على كود التفعيل",
    "our_braches":"فروعنا",
    "complete_order":"إكمال الطلب",
    "shipping_info":"بيانات التوصيل",
    "governorate":"المحافظة",
    "select_governorate":"اختر المحافظة",
    "address":"العنوان",
    "enter_address":"ادخل العنوان",
    "terms_and_condetions":"الشروط والأحكام",
    "agree_to":"الموافقة علي ",
    "payment_method":"وسيلة الدفع",
    "cash_on_delivery":"الدفع عند الإستلام",
    "online_payment":"دفع إلكتروني",
    "shipping":"قيمة التوصيل: ",
    "discount_value":"قيمة الخصم: ",
    "total_value":"إجمالي المبلغ: ",
    "submit":"تأكيد",
    "delete_account_message":"سيتم حذف جميع البيانات المتعلقة بحسابك ولن تستطيع الدخول اليه مرة اخرى",
    "today_deal":"عرض اليوم",
    "by":"بواسطة",
    "re_send":"إعادة إرسال",
    "otp_dont_receive_hint":"لم يصلك الكود؟",
    "no_notifications":"لا يوجد لديك رسائل",
    "Notifications":"الرسائل",
    "NO_INTERNET":"لا يوجد اتصال بالإنترنت",
    "check_connectrion":"الرجاء فحص اتصال الشبكة والمحاولة مرة أخرى.",
    "reset":"إعادة تعيين",
    "forget_password_screen_title":"نسيت كلمة المرور",
    "forget_password":"نسيت كلمة المرور؟",
    "change_password":"تغيير كلمة المرور",
    "change":"تغيير",
    "old_password":"كلمة المرور القديمة",
    "new_password":"كلمة المرور الجديدة",
    "confirm":"تأكيد",
    "Total_after_shippng":"إجمالي القيمة بعد الشحن: ",
    "Total_after_discount":"قيمة الطلب بعد الخصم: ",
    "Total_before_discount":"قيمة الطلب قبل الخصم: ",
    "Total_after_discount_details":"الاجمالي بعد الخصم",


    "promo_code":"كود الخصم: ",
    "select_phone":"إضافة رقم الهاتف",
    "enter_phone":"أدخل رقم هاتفك",
    "from:":"من:",
    "to:":"الى:",
    "app_signi_btn_title":"تسجيل بحساب أبل",
    "update":"تحديث",
    "no_model_available":"هذا الصنف غير متاح حاليا",
    "order_details":"تفاصيل الطلب",
    "orderId":"رقم الفاتورة",
    "Quantity":"الكمية",
    "unit_price":"سعر القطعة",
    "total_price":"السعر الكلي",
    "order_date":"تاريخ الطلب",



  };
}
