import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/helpers/my_app_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with MyAppHelper{
  Iterable<LocalizationsDelegate<dynamic>>? delegates=[];
  @override
  void initState() {
    super.initState();

    AppLocalization().onInit();
    localization.onTranslatedLanguage = (local){

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
        useMaterial3: true,
      ),
      navigatorKey: AppNavigator().navigatorKey,
      onGenerateRoute: onGenerateRoute,
      supportedLocales: [
        Locale("en"),
        Locale("ar"),
      ],
      localizationsDelegates: localization.localizationsDelegates,
      locale: AppLocalization.isArabic?Locale("ar"):Locale("en"),
      home:  MyHomePage(),
    );
  }
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: ()async {
              if(localization.currentLocale==Locale("ar")){
                localization.translate('en');
              }else{
                localization.translate('ar');
              }
            },
            child: Row(
              children: [
                Icon(Icons.access_time_rounded),
                Text(AppLocalization.translate('title')),
              ],
            ),),
        ],
      ) ,
    );
  }
}
