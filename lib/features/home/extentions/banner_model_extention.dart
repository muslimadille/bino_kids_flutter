import 'dart:convert';

import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/helpers/hive_helper.dart';
import 'package:bino_kids/common/utils/constants/app_data.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
import 'package:bino_kids/features/home/model/banner_model.dart';
import 'package:bino_kids/features/home/model/sub_categories_model.dart';
import 'package:bino_kids/features/home/repository/home_repository.dart';
import 'package:bino_kids/features/product/model/products_screen_arquments_model.dart';
import 'package:bino_kids/features/product/view/screens/product_details_screen.dart';
import 'package:dio/dio.dart';

extension BannerModelExtention on BannerDataModel{
  void onClick(){
    switch(orintedTypeId){
      case 1:{};
      break;
      case 2:
        {
          /// get mmodelstyps
          getSubCategories(modelAgeId: 0, moduleId: int.parse(firstPage??"0"),).then((value){
            AppNavigator().push(
                routeName: AppRoutes.PRODUCTS_WITH_FILTER_SCREEN_ROUTE,
                arguments: ProductsScreenArqumentsModel(subcategoriesList: value!.data,selectedcategoryId: modelTypeId ?? 0, selectedcategoryName: modelTypeName ?? ""));
          });

        }
      break;
      case 3: AppNavigator().push(routeName: AppRoutes.PRUDUCT_DETAILS_SCREEN_ORUTE,arguments: ProductDetailsParams(modulId:(modelId??0).toString(),colorId:-1 ));
      break;
    }
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