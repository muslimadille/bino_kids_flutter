import 'dart:convert';

import 'package:bino_kids/features/home/model/sub_categories_model.dart';
import 'package:bino_kids/features/home/repository/home_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

mixin CategoryYearsHelper{
  int selectedIndex=0;
  late final PageController pageController;

  onInit(){
    pageController=PageController();
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
      final response=await HomeRepository().getSubCategories(modelAgeId: modelAgeId, moduleId: moduleId);
      SubCategoriesModel subCategoriesModel=subCategoriesModelFromJson(jsonEncode(response.data));
      return subCategoriesModel;
    } on DioException catch (error){
      return null;
    }
  }

}