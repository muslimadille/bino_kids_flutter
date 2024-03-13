import 'dart:async';
import 'dart:convert';

import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/helpers/cash_helper.dart';
import 'package:bino_kids/common/helpers/hive_helper.dart';
import 'package:bino_kids/common/utils/constants/app_data.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
import 'package:bino_kids/features/home/model/model_types_model.dart';
import 'package:bino_kids/features/home/model/sub_categories_model.dart';
import 'package:bino_kids/features/home/repository/home_repository.dart';
import 'package:bino_kids/features/product/model/products_screen_arquments_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

mixin CategoryYearsHelper{
  int selectedIndex=0;
  List<SubCategoryDataModel> subgategorisList=[];
  late final PageController pageController;
  late final StreamController<SubCategoriesModel?>subCategoriesModelStreamController;

  onInit(){
    subCategoriesModelStreamController=StreamController<SubCategoriesModel?>.broadcast();
    pageController=PageController();
  }
  onDispose(){
    subCategoriesModelStreamController.close();
  }
  onItemClick({required int index})async{
    selectedIndex=index;

    await pageController.animateToPage(
      selectedIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
  Future <SubCategoriesModel?>getSubCategories({required int modelAgeId, required int moduleId})async{
    try{
      subgategorisList.clear();
      String key=AppData.hive_Model_Types+modelAgeId.toString()+moduleId.toString()+(AppLocalization.isArabic?"ar":"en");
      SubCategoriesModel subCategoriesModel;

      if(await HiveHelper().isExists(boxName:key )){
         subCategoriesModel=await HiveHelper().getBoxes<SubCategoriesModel>(key) as SubCategoriesModel;
         subCategoriesModelStreamController.sink.add(subCategoriesModel);
      }
      final response=await HomeRepository().getSubCategories(modelAgeId: modelAgeId, moduleId: moduleId);
       subCategoriesModel=subCategoriesModelFromJson(jsonEncode(response.data));
      await HiveHelper().deleteBoxes(key);
      await HiveHelper().addBoxes<SubCategoriesModel>(subCategoriesModel, key);
      //CashHelper.subcategoriesMap["$modelAgeId $moduleId"]=subCategoriesModel;
      subCategoriesModelStreamController.sink.add(subCategoriesModel);
      return subCategoriesModel;
    } on DioException catch (error){
      return null;
    }
  }
  onSubcategoryClick(int id,List<SubCategoryDataModel> dataList,String?name){
    AppNavigator().push(
        routeName: AppRoutes.PRODUCTS_WITH_FILTER_SCREEN_ROUTE,
        arguments: ProductsScreenArqumentsModel(
            selectedcategoryId: id,
            subcategoriesList: dataList));

  }

}