import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsHelper{
  static AnalyticsHelper? _instance;

  AnalyticsHelper._internal();

  factory AnalyticsHelper(){
    return _instance ??= AnalyticsHelper._internal();
  }

  late FirebaseAnalytics analytics;
  late FirebaseAnalyticsObserver observer;

  analyticsInit() {
    analytics = FirebaseAnalytics.instance;
    observer = FirebaseAnalyticsObserver(analytics: analytics);
  }


  sendEvent({required String name,Map<String,Object>? parameters }){
    analytics.logEvent(name: name,parameters: parameters);
    // FlutterUxcam.logEvent(name);
  }

}