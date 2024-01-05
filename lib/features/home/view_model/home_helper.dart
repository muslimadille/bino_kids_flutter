import 'dart:async';
import 'dart:convert';

import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
import 'package:bino_kids/features/home/model/main_categories_model.dart';
import 'package:bino_kids/features/home/model/model_types_model.dart';
import 'package:bino_kids/features/home/model/sub_categories_model.dart';
import 'package:bino_kids/features/product/model/product_model.dart';
import 'package:bino_kids/features/product/model/products_with_filter_model.dart';
import 'package:dio/dio.dart';

import '../repository/home_repository.dart';

mixin HomeHelper{
  int selectedCategoryIndex=0;
  late final StreamController<MainCategoriesDataModel?>mainCategoryStreamController;
  List<MainCategoriesDataModel> categories=[];

  onInit()async{
    mainCategoryStreamController=StreamController<MainCategoriesDataModel?>.broadcast();
    await getMainCategories();
  }
  onDispose(){
    mainCategoryStreamController.close();
  }
  onSelectCategory(int index){
    selectedCategoryIndex=index;
    mainCategoryStreamController.add(categories[index]);
  }


  Future <MainCategoriesModel?>getMainCategories()async{
    try{
      final response=await HomeRepository().getMainCategories();
      MainCategoriesModel mainCategoriesModel=mainCategoriesModelFromJson(jsonEncode(response.data));
      categories.addAll(mainCategoriesModel.data);
      mainCategoryStreamController.add(mainCategoriesModel.data[0]);
      selectedCategoryIndex=0;
      return mainCategoriesModel;
    } on DioException catch (error){
      return null;
    }
  }
  Future <List<ProductModel>?>getMostWatched()async{
    try{
      final response=await HomeRepository().getMostWatched();
      ProductsWithFilterModel productsWithFilterModel=productsWithFilterModeFromJson(jsonEncode(response.data));
      return productsWithFilterModel.modelList;
    } on DioException catch (error){
      return null;
    }
  }
  Future <List<ProductModel>?>getSuggestions()async{
    try{
      final response=await HomeRepository().getSuggestions();
      ProductsWithFilterModel productsWithFilterModel=productsWithFilterModeFromJson(jsonEncode(response.data));
      return productsWithFilterModel.modelList;
    } on DioException catch (error){
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
    try{
      final response=await HomeRepository().getModelTypes( moduleId: moduleId);
      ModelTypesModel modelTypesModel=modelTypesModelFromJson(jsonEncode(response.data));
      return modelTypesModel;
    } on DioException catch (error){
      return null;
    }
  }
  onMessageIconClick(){
    AppNavigator().push(routeName: AppRoutes.USER_MESSAGES_SCREEN_ROUTE);
  }

}