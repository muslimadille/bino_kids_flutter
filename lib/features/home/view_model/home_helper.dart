import 'dart:async';
import 'dart:convert';

import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/helpers/cash_helper.dart';
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
      categories.clear();
      if(CashHelper.mainCategoriesModel!=null){
        Future.delayed(Duration(microseconds: 1)).then((value) {
          categories.addAll(CashHelper.mainCategoriesModel!.data);
          selectedCategoryIndex=0;
          mainCategoryStreamController.add(categories[selectedCategoryIndex]);
        });

        return CashHelper.mainCategoriesModel!;
      }
      final response=await HomeRepository().getMainCategories();
      MainCategoriesModel mainCategoriesModel=mainCategoriesModelFromJson(jsonEncode(response.data));
      categories.addAll(mainCategoriesModel.data);
      selectedCategoryIndex=0;
      mainCategoryStreamController.add(mainCategoriesModel.data[0]);

      CashHelper.mainCategoriesModel=mainCategoriesModel;
      return mainCategoriesModel;
    } on DioException catch (error){
      return null;
    }
  }
  Future <List<ProductModel>?>getMostWatched()async{
    try{
      if(CashHelper.homeMostWatched!=null){
        return CashHelper.homeMostWatched!.modelList;
      }
      final response=await HomeRepository().getMostWatched();
      ProductsWithFilterModel productsWithFilterModel=productsWithFilterModeFromJson(jsonEncode(response.data));
      CashHelper.homeMostWatched=productsWithFilterModel;
      return productsWithFilterModel.modelList;
    } on DioException catch (error){
      return null;
    }
  }
  Future <List<ProductModel>?>getSuggestions()async{
    try{
      if(CashHelper.homeSuggestions !=null){
        return CashHelper.homeSuggestions!.modelList;
      }
      final response=await HomeRepository().getSuggestions();
      ProductsWithFilterModel productsWithFilterModel=productsWithFilterModeFromJson(jsonEncode(response.data));
      CashHelper.homeSuggestions=productsWithFilterModel;
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