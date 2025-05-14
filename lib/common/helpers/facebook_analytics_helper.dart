import 'dart:io';
import 'dart:math';

import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/helpers/device_info_details.dart';
import 'package:bino_kids/common/utils/constants/app_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class FacebookAnalyticsHelper {
  static FacebookAnalyticsHelper? _instance;

  FacebookAnalyticsHelper._();

  static FacebookAnalyticsHelper getInstance() {
    _instance ??= FacebookAnalyticsHelper._();
    return _instance!;
  }
  late final String extinfo_version;
  late final String app_package_name;
  late final String short_version;
  late final String long_version;
  late final String os_version;
  late final String device_model_name;
  late final String locale;
  late final String timezone_abbreviation;
  late final String carrier;
  late final String screen_width;
  late final String screen_height;
  late final String cpu_cores;
  late final String external_storage_size_in_gb;
  late final String free_space_on_external_storage_in_gb;
  late final String screen_density;
  late final String device_timezone;
  List<String> values=[];


   init(BuildContext context){
     if(values.isNotEmpty){
       return;
     }
     extinfo_version=Platform.isAndroid?'a2':'i2';
     values.add(extinfo_version);
     app_package_name='com.binokids';
     values.add(app_package_name);
     short_version='11';
     values.add(short_version);
     long_version='11.1';
     values.add(long_version);
     os_version='11.1';
     values.add(os_version);
     device_model_name=DeviceInfoDetails().deviceName;
     values.add(device_model_name);
     locale=(localization.currentLocale??Locale("ar")).languageCode.toString();
     values.add(locale);
     timezone_abbreviation='GMT+2';
     values.add(timezone_abbreviation);
     carrier=AppData.USER_NUMBER.isEmpty?"vodafone":AppData.USER_NUMBER.substring(0,2)=='010'?"vodafone":AppData.USER_NUMBER.substring(0,2)=='011'?"Etisalat":AppData.USER_NUMBER.substring(0,2)=='012'?"Mobinile":"We";
     values.add(carrier);
     screen_width=context.size!.width.toString();
     values.add(screen_width);
     screen_height=context.size!.height.toString();
     values.add(screen_height);
     cpu_cores='2';
     values.add(cpu_cores);
     external_storage_size_in_gb='8';
     values.add(external_storage_size_in_gb);
     free_space_on_external_storage_in_gb='1';
     values.add(free_space_on_external_storage_in_gb);
     screen_density=MediaQuery.of(AppNavigator().currentContext()).devicePixelRatio.toString();
     values.add(screen_density);
     device_timezone='GMT+3';
     values.add(device_timezone);

  }
  List<String> getExtraStrings(){
     return values;
  }

}