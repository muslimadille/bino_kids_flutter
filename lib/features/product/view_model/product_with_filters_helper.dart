import 'dart:async';
import 'dart:convert';

import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
import 'package:bino_kids/features/home/model/sub_categories_model.dart';
import 'package:bino_kids/features/product/model/products_with_filter_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../home/model/model_types_model.dart';
import '../model/product_model.dart';
import '../repository/product_repository.dart';

mixin productWithFiltersHelper{
  late final ScrollController categoryController;
  final List<SubCategoryDataModel> subcategoriesList=[];
   bool isModelType=false;

  late final StreamController<int> categoryStreamController;
  late final StreamController<List<ProductModel>?> productsStreamController;

  int? selectedCategoryId;
  int selectedIndex=0;
  int pageIndex=0;
  int pageSize=20;
  onInit()async{
    initSelectedCategory();
    categoryStreamController=StreamController<int>.broadcast();
    productsStreamController=StreamController<List<ProductModel>?>();
    categoryController=ScrollController();
    scrollToIndex();
    getProducts();
  }
  onDispose(){
    categoryStreamController.close();
    categoryController.dispose();
    productsStreamController.close();
  }
  void scrollToIndex() {
    Future.delayed(const Duration(milliseconds: 500)).then((value) {
      categoryController.animateTo((selectedIndex) * 24.w, duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);

    });
  }
  onSelectCategory(int index){
    selectedIndex=index;
    selectedCategoryId=subcategoriesList[index].id;
    categoryStreamController.add(index);
    getProducts();
    scrollToIndex();
  }
  getProducts()async{
    productsStreamController.add(null);
    final response=await ProductRepository().getProductsWithFilter(modelTypeID: subcategoriesList[selectedIndex].id);
    ProductsWithFilterModel productsWithFilterModel=productsWithFilterModeFromJson(jsonEncode(response.data));
    productsStreamController.add(productsWithFilterModel.modelList);
  }
   initSelectedCategory(){
    if(selectedCategoryId!=null){
      selectedIndex=subcategoriesList.indexOf(subcategoriesList.singleWhere((element) => element.id==selectedCategoryId));
    } else{
      selectedIndex=0;
    }
  }
  onItemClick({required String modelId}){
    AppNavigator().push(routeName: AppRoutes.PRUDUCT_DETAILS_SCREEN_ORUTE,arguments: modelId);
  }
}