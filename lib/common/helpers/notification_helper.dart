import 'dart:convert';
import 'dart:io';

import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/helpers/device_info_details.dart';
import 'package:bino_kids/common/helpers/hive_helper.dart';
import 'package:bino_kids/common/utils/constants/app_data.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
import 'package:bino_kids/features/home/model/sub_categories_model.dart';
import 'package:bino_kids/features/home/repository/home_repository.dart';
import 'package:bino_kids/features/product/model/products_screen_arquments_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../../features/product/view/screens/product_details_screen.dart';
import 'app_navigator.dart';

class NotificationHelper{

  init()async{
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
    OneSignal.initialize("044fbb84-d408-479f-af85-1062e3d700d9");
    OneSignal.Notifications.requestPermission(true);

    if(Platform.isAndroid){}
    OneSignal.Notifications.addForegroundWillDisplayListener((event){
      event.notification;
      print("notification:${event.notification.body}");

    });
    OneSignal.Notifications.addPermissionObserver((permission){
      if(permission){
        NotificationHelper().setUser();
      }else{
        OneSignal.Notifications.requestPermission(true);
      }

    });


    onNotificationClick();
  }
  ///call in login
  setUser()async{
    //await OneSignal.logout();
    String? id=await OneSignal.User.getExternalId();
    if(id==null){
      await OneSignal.login("DeviceInfoDetaileffdeviceId");
      await OneSignal.User.addTagWithKey("UserType",(AppData.USER_ROLE)=="2"?"Normal Users":"Company Users");
      await OneSignal.User.addTagWithKey("test","www");
      print("oneSignal:  user is set");
    }


  }

  onNotificationClick(){
    OneSignal.Notifications.addClickListener((event) async{
      if((event.notification.additionalData??{})["pageOrModel"]=="2"){
        ///navigate to model
        AppNavigator().push(routeName: AppRoutes.PRUDUCT_DETAILS_SCREEN_ORUTE,arguments: ProductDetailsParams(modulId:(event.notification.additionalData??{})["linkInMobile"]));
      }
      if((event.notification.additionalData??{})["pageOrModel"]=="1"){
        String moduleId=(event.notification.additionalData??{})["linkInMobile"];
        int modelAgeId=0;

        try{
          EasyLoading.show();
          String key=AppData.hive_Model_Types+modelAgeId.toString()+moduleId.toString()+(AppLocalization.isArabic?"ar":"en");
          SubCategoriesModel subCategoriesModel;

          if(await HiveHelper().isExists(boxName:key )){
      subCategoriesModel=await HiveHelper().getBoxes<SubCategoriesModel>(key) as SubCategoriesModel;
      }else{
            final response=await HomeRepository().getSubCategories(showProgress: false,modelAgeId: modelAgeId, moduleId: int.parse(moduleId));
            subCategoriesModel=subCategoriesModelFromJson(jsonEncode(response.data));
            await HiveHelper().deleteBoxes(key);
            await HiveHelper().addBoxes<SubCategoriesModel>(subCategoriesModel, key);
          }
          EasyLoading.dismiss();
          AppNavigator().push(
              routeName: AppRoutes.PRODUCTS_WITH_FILTER_SCREEN_ROUTE,
              arguments: ProductsScreenArqumentsModel(
                moduleId: int.parse(moduleId),
                  selectedcategoryName:subCategoriesModel.data[0].name ,
                  selectedcategoryId: subCategoriesModel.data[0].id,
                  subcategoriesList: subCategoriesModel.data));
      } on DioException catch (error){
          
      }

      }

    });
  }
  logout(){
    OneSignal.logout();
  }

  Future <SubCategoriesModel?>getSubCategories({required int modelAgeId, required int moduleId,bool?showProgress})async{
    try{
      String key=AppData.hive_Model_Types+modelAgeId.toString()+moduleId.toString()+(AppLocalization.isArabic?"ar":"en");
      SubCategoriesModel subCategoriesModel;

      if(await HiveHelper().isExists(boxName:key )){
        subCategoriesModel=await HiveHelper().getBoxes<SubCategoriesModel>(key) as SubCategoriesModel;
        return subCategoriesModel;
      }
      final response=await HomeRepository().getSubCategories(showProgress: showProgress,modelAgeId: modelAgeId, moduleId: moduleId);
      subCategoriesModel=subCategoriesModelFromJson(jsonEncode(response.data));
      await HiveHelper().deleteBoxes(key);
      await HiveHelper().addBoxes<SubCategoriesModel>(subCategoriesModel, key);
      return subCategoriesModel;
    } on DioException catch (error){
      return null;
    }
  }

}