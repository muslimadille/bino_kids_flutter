import 'dart:async';
import 'dart:convert';

import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/helpers/cash_helper.dart';
import 'package:bino_kids/common/helpers/hive_helper.dart';
import 'package:bino_kids/common/helpers/notification_helper.dart';
import 'package:bino_kids/common/utils/constants/app_data.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
import 'package:bino_kids/features/home/model/main_categories_model.dart';
import 'package:bino_kids/features/home/model/model_types_model.dart';
import 'package:bino_kids/features/home/model/sub_categories_model.dart';
import 'package:bino_kids/features/product/model/product_model.dart';
import 'package:bino_kids/features/product/model/products_with_filter_model.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

import '../repository/home_repository.dart';

mixin HomeHelper{
  int selectedCategoryIndex=0;
  late final StreamController<MainCategoriesDataModel?>mainCategoryStreamController;
  List<MainCategoriesDataModel> categories=[];
  late final StreamController<List<ProductModel>?> mostWatchedStreamController;
  late final StreamController<List<ProductModel>?> sugestionsStreamController;


  onInit()async{
    NotificationHelper().setUser();
    mainCategoryStreamController=StreamController<MainCategoriesDataModel?>.broadcast();
    mostWatchedStreamController=StreamController<List<ProductModel>?>();
    sugestionsStreamController=StreamController<List<ProductModel>?>();

    getMainCategories();
    getMostWatched();
    getSuggestions();
  }
  onDispose(){
    mainCategoryStreamController.close();
    mostWatchedStreamController.close();
    sugestionsStreamController.close();
  }
  onSelectCategory(int index){
    selectedCategoryIndex=index;
    mainCategoryStreamController.add(categories[index]);
  }


  Future <MainCategoriesModel?>getMainCategories()async{
    try{
      MainCategoriesModel mainCategoriesModel;
      categories.clear();
      if(await HiveHelper().isExists(boxName: AppData.hive_Main_Categories+(AppLocalization.isArabic?"ar":"en"))){
        categories.addAll((await HiveHelper().getBoxes<MainCategoriesModel>(AppData.hive_Main_Categories+(AppLocalization.isArabic?"ar":"en")) as MainCategoriesModel).data);
        selectedCategoryIndex=0;
        mainCategoryStreamController.add(categories[0]);
        final response=await HomeRepository().getMainCategories();
         mainCategoriesModel=mainCategoriesModelFromJson(jsonEncode(response.data));
        await HiveHelper().deleteBoxes(AppData.hive_Main_Categories+(AppLocalization.isArabic?"ar":"en"));
        await HiveHelper().addBoxes<MainCategoriesModel>(mainCategoriesModel, AppData.hive_Main_Categories+(AppLocalization.isArabic?"ar":"en"));
      }else{
        final response=await HomeRepository().getMainCategories();
         mainCategoriesModel=mainCategoriesModelFromJson(jsonEncode(response.data));
        await HiveHelper().deleteBoxes(AppData.hive_Main_Categories+(AppLocalization.isArabic?"ar":"en"));
        await HiveHelper().addBoxes<MainCategoriesModel>(mainCategoriesModel, AppData.hive_Main_Categories+(AppLocalization.isArabic?"ar":"en"));
        categories.addAll(mainCategoriesModel.data);
        selectedCategoryIndex=0;
        mainCategoryStreamController.add(mainCategoriesModel.data[0]);
      }

      return mainCategoriesModel;
    } on DioException catch (error){
      return null;
    }
  }
  Future <List<ProductModel>?>getMostWatched()async{
    try{
      String boxName=AppData.hive_most_watched+(AppLocalization.isArabic?"ar":"en");
      if(await HiveHelper().isExists(boxName:boxName )){
        ProductsWithFilterModel productsWithFilterModel= await HiveHelper().getBoxes<ProductsWithFilterModel>(boxName) as ProductsWithFilterModel;
        mostWatchedStreamController.add(productsWithFilterModel.modelList);
        final response=await HomeRepository().getMostWatched();
        productsWithFilterModel=productsWithFilterBaseModelFromJson(jsonEncode(response.data)).data!;
        await HiveHelper().deleteBoxes(boxName);
        await HiveHelper().addBoxes<ProductsWithFilterModel>(productsWithFilterModel, boxName);
      }else {
      final response=await HomeRepository().getMostWatched();
      ProductsWithFilterModel productsWithFilterModel=productsWithFilterBaseModelFromJson(jsonEncode(response.data)).data!;
      //await HiveHelper().deleteBoxes(boxName);
      await HiveHelper().addBoxes<ProductsWithFilterModel>(productsWithFilterModel, boxName);
      mostWatchedStreamController.add(productsWithFilterModel.modelList);
      }} on DioException catch (error){
      return null;
    }
  }
  Future <List<ProductModel>?>getSuggestions()async{
    try{
      String boxName=AppData.hive_most_suggestions+(AppLocalization.isArabic?"ar":"en");
      if(await HiveHelper().isExists(boxName:boxName )){
        ProductsWithFilterModel productsWithFilterModel= await HiveHelper().getBoxes<ProductsWithFilterModel>(boxName) as ProductsWithFilterModel;
        sugestionsStreamController.add(productsWithFilterModel.modelList);
        final response=await HomeRepository().getSuggestions();
        productsWithFilterModel=productsWithFilterBaseModelFromJson(jsonEncode(response.data)).data!;
        await HiveHelper().deleteBoxes(boxName);
        await HiveHelper().addBoxes<ProductsWithFilterModel>(productsWithFilterModel, boxName);
      }else {
        final response=await HomeRepository().getSuggestions();
        ProductsWithFilterModel productsWithFilterModel=productsWithFilterBaseModelFromJson(jsonEncode(response.data)).data!;
        await HiveHelper().deleteBoxes(boxName);
        await HiveHelper().addBoxes<ProductsWithFilterModel>(productsWithFilterModel, boxName);
        sugestionsStreamController.add(productsWithFilterModel.modelList);
      }} on DioException catch (error){
      return null;
    }
  }
  Future <List<ProductModel>?>getNewArrivals()async{
    try{
      final response=await HomeRepository().getNewArrivals();
      ProductsWithFilterModel productsWithFilterModel=productsWithFilterModeFromJson(jsonEncode(response.data));
      return productsWithFilterModel.modelList;
    } on DioException catch (error){
      return null;
    }
  }
  Future <ModelTypesModel?>getModelTypes({required int moduleId})async{
    ModelTypesModel modelTypesModel;
    try{
      if(await HiveHelper().isExists(boxName: AppData.hive_Model_Types+moduleId.toString())){
        modelTypesModel=await HiveHelper().getBoxes<ModelTypesModel>(AppData.hive_Model_Types+moduleId.toString()) as ModelTypesModel;
      }
      final response=await HomeRepository().getModelTypes( moduleId: moduleId);
       modelTypesModel=modelTypesModelFromJson(jsonEncode(response.data));
      return modelTypesModel;
    } on DioException catch (error){
      return null;
    }
  }
  onMessageIconClick(){
    AppNavigator().push(routeName: AppRoutes.USER_MESSAGES_SCREEN_ROUTE);
  }

}