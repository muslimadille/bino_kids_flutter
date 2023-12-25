import 'dart:async';
import 'dart:convert';

import 'package:bino_kids/features/home/model/main_categories_model.dart';
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
}