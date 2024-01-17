import 'dart:async';
import 'dart:convert';

import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
import 'package:bino_kids/features/home/model/sub_categories_model.dart';
import 'package:bino_kids/features/product/model/filter_model.dart';
import 'package:bino_kids/features/product/model/price_model.dart';
import 'package:bino_kids/features/product/model/products_with_filter_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../model/product_model.dart';
import '../repository/product_repository.dart';

mixin productWithFiltersHelper{
  final GlobalKey<ScaffoldState> drawerKey =  GlobalKey<ScaffoldState>();
  late final ScrollController categoryController;
  final List<SubCategoryDataModel> subcategoriesList=[];
   bool isModelType=false;
   Filters? filters;
   Price?prices;
  Map<String, List<int>> selectedFilters={};

  late final StreamController<int> categoryStreamController;
  late final StreamController<List<ProductModel>?> productsStreamController;

  int? selectedCategoryId;
  int selectedIndex=0;
  int pageIndex=0;
  int pageSize=20;
  onInit()async{
    initSelectedCategory();
    categoryStreamController=StreamController<int>.broadcast();
    productsStreamController=StreamController<List<ProductModel>?>.broadcast();
    categoryController=ScrollController();
    scrollToIndex();
    getProducts(selectedFilters: {});
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
    selectedFilters={};
    selectedCategoryId=subcategoriesList[index].id;
    categoryStreamController.add(index);
    getProducts(selectedFilters: {});
    scrollToIndex();
  }
  getProducts({required Map<String, List<int>> selectedFilters})async{
    productsStreamController.add(null);
    final response=await ProductRepository().getProductsWithFilter(modelTypeID: subcategoriesList[selectedIndex].id,selectedFilters: selectedFilters);
    ProductsWithFilterModel productsWithFilterModel=productsWithFilterModeFromJson(jsonEncode(response.data));
    filters=productsWithFilterModel.filters;
    prices=productsWithFilterModel.price;
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