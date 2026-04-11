import 'package:bino_kids/common/utils/constants/app_data.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsHelper{
  static AnalyticsHelper? _instance;

  AnalyticsHelper._internal();

  factory AnalyticsHelper(){
    return _instance ??= AnalyticsHelper._internal();
  }

  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  late final FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);

  analyticsInit() {
    // No-op: analytics is now eagerly initialized.
    // Kept for backward compatibility.
  }

  /// Set user properties for all future events
  Future<void> setUserData() async {
    final userId = AppData.USER_ID;
    if (userId.isNotEmpty) {
      await analytics.setUserId(id: userId);
    }
    await analytics.setUserProperty(name: 'user_name', value: AppData.USER_NAME.isNotEmpty ? AppData.USER_NAME : null);
    await analytics.setUserProperty(name: 'user_role', value: AppData.USER_ROLE);
    await analytics.setUserProperty(name: 'user_phone', value: AppData.USER_NUMBER.isNotEmpty ? AppData.USER_NUMBER : null);
    await analytics.setUserProperty(name: 'is_verified', value: AppData.IS_VERIFIED_USER.toString());
    await analytics.setUserProperty(name: 'app_lang', value: AppData.CURRENT_LANG);
  }

  /// Get user params to attach to custom sendEvent calls
  Map<String, Object> get _userParams {
    return {
      'user_id': AppData.USER_ID,
      'user_name': AppData.USER_NAME,
      'user_phone': AppData.USER_NUMBER,
      'user_role': AppData.USER_ROLE,
    };
  }

  sendEvent({required String name, Map<String, Object>? parameters}) {
    final merged = <String, Object>{..._userParams};
    if (parameters != null) {
      merged.addAll(parameters);
    }
    analytics.logEvent(name: name, parameters: merged);
  }

  /// GA4 Standard E-Commerce Events

  /// 1. add_to_cart
  Future<void> logAddToCart({
    required String itemId,
    required String itemName,
    required String itemCategory,
    required double price,
    required int quantity,
  }) async {
    sendEvent(name: "add_to_cart_custom", parameters: {
      'item_id': itemId,
      'item_name': itemName,
      'price': price,
    });
    await analytics.logAddToCart(
      currency: 'EGP',
      value: price * quantity,
      items: [
        AnalyticsEventItem(
          itemId: itemId,
          itemName: itemName,
          itemCategory: itemCategory,
          price: price,
          quantity: quantity,
        ),
      ],
    );
  }

  /// 2. view_cart
  Future<void> logViewCart({
    required double value,
    required List<AnalyticsEventItem> items,
  }) async {
    sendEvent(name: "view_cart_custom", parameters: {
      'value': value,
    });
    await analytics.logViewCart(
      currency: 'EGP',
      value: value,
      items: items,
    );
  }

  /// 3. begin_checkout
  Future<void> logBeginCheckout({
    required double value,
    required List<AnalyticsEventItem> items,
  }) async {
    sendEvent(name: "begin_checkout_custom", parameters: {
      'value': value,
    });
    await analytics.logBeginCheckout(
      currency: 'EGP',
      value: value,
      items: items,
    );
  }

  /// 4. add_payment_info
  Future<void> logAddPaymentInfo({
    required String paymentType,
    required double value,
    required List<AnalyticsEventItem> items,
  }) async {
    sendEvent(name: "add_payment_info_custom", parameters: {
      'payment_type': paymentType,
      'value': value,
    });
    await analytics.logAddPaymentInfo(
      currency: 'EGP',
      value: value,
      paymentType: paymentType,
      items: items,
    );
  }

  /// 5. purchase (most important event)
  Future<void> logPurchase({
    required String transactionId,
    required double value,
    required double shipping,
    required String paymentType,
    required List<AnalyticsEventItem> items,
  }) async {
    sendEvent(name: "purchase_custom", parameters: {
      'transaction_id': transactionId,
      'value': value,
      'shipping': shipping,
      'payment_type': paymentType,
    });
    await analytics.logPurchase(
      currency: 'EGP',
      transactionId: transactionId,
      value: value,
      shipping: shipping,
      items: items,
      parameters: {
        'payment_type': paymentType,
      },
    );
  }

  /// Helper: Convert cart items list to AnalyticsEventItem list
  static List<AnalyticsEventItem> cartItemsToAnalyticsItems(List items) {
    return items.map((item) {
      return AnalyticsEventItem(
        itemId: (item.modelId ?? item.id ?? 0).toString(),
        itemName: item.name ?? '',
        itemCategory: item.modelType ?? '',
        price: (item.price ?? 0).toDouble(),
        quantity: (item.quantity ?? 1).toInt(),
      );
    }).toList();
  }
}
