import 'package:bino_kids/applications/mainApplication.dart';
import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/helpers/my_app_helper.dart';
import 'package:bino_kids/features/auth/view/screens/login_screen.dart';
import 'package:bino_kids/features/home_tabs/view/home_tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MultiProvider(
    providers: MainApplication.applicationList,
    child: const MyApp(),
  ));
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..maskType = EasyLoadingMaskType.black
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..indicatorWidget = CircularProgressIndicator(color: Colors.black,)
    ..backgroundColor = Colors.transparent
    ..boxShadow = [BoxShadow(color: Colors.transparent)]
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..userInteractions = false
    ..progressColor = Colors.black
    ..dismissOnTap = false
    ..fontSize = 20;
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with MyAppHelper {

  @override
  void initState() {
    super.initState();
    AppLocalization().onInit();
    localization.onTranslatedLanguage = (local) {
      setState(() {});
    };
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        ),
        navigatorKey: AppNavigator().navigatorKey,
        onGenerateRoute: onGenerateRoute,
        supportedLocales: const [
          Locale("en"),
          Locale("ar"),
        ],
        localizationsDelegates: localization.localizationsDelegates,
        locale: AppLocalization.isArabic ?  Locale("ar") :  Locale("en"),
        builder: EasyLoading.init(
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaleFactor: 1.0,
              ), //set desired text scale factor here
              child: child??LoginScreen(),
            );
          },
        ),
        home: LoginScreen(),
      );
    });

  }
}
