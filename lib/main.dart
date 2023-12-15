import 'package:bino_kids/applications/mainApplication.dart';
import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/helpers/my_app_helper.dart';
import 'package:bino_kids/features/home/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: MainApplication.applicationList,
    child: const MyApp(),
  ));
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      navigatorKey: AppNavigator().navigatorKey,
      onGenerateRoute: onGenerateRoute,
      supportedLocales: const [
        Locale("en"),
        Locale("ar"),
      ],
      localizationsDelegates: localization.localizationsDelegates,
      locale: AppLocalization.isArabic ? const Locale("ar") : const Locale("en"),
      home: HomeScreen(),
    );
  }
}
