import 'dart:async';
import 'dart:convert';

import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/helpers/hive_helper.dart';
import 'package:bino_kids/common/utils/constants/app_data.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
import 'package:bino_kids/features/home/model/sub_categories_model.dart';
import 'package:bino_kids/features/product/model/filter_model.dart';
import 'package:bino_kids/features/product/model/price_model.dart';
import 'package:bino_kids/features/product/model/products_with_filter_model.dart';
import 'package:bino_kids/features/product/view/screens/product_details_screen.dart';
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
  int?moduleId;
  int?modelAgeId;
  int?modelGenderId;


  late final StreamController<int> categoryStreamController;
  late final StreamController<List<ProductModel>?> productsStreamController;

  int? selectedCategoryId;
  String?selectedCategoryName;
  int selectedIndex=0;
  int pageIndex=0;
  int pageSize=20;
  onInit()async{
    initSelectedCategory();
    categoryStreamController=StreamController<int>.broadcast();
    productsStreamController=StreamController<List<ProductModel>?>.broadcast();
    categoryController=ScrollController();
    if(subcategoriesList.isNotEmpty){
      scrollToIndex();
    }
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
    modelGenderId=subcategoriesList[index].modelGenderId;
    categoryStreamController.add(index);
    getProducts(selectedFilters: {});
    scrollToIndex();
  }
  getProducts({required Map<String, List<int>> selectedFilters})async{

    productsStreamController.add(null);
    String boxName= (AppData.hive_Models_list_Types+(AppLocalization.isArabic?"ar":"en")+
        modelAgeId.toString()+moduleId.toString()+modelGenderId.toString()+
        (subcategoriesList.isNotEmpty?subcategoriesList[selectedIndex].id:selectedCategoryId).toString()+jsonEncode(selectedFilters));

    if(await HiveHelper().isExists(boxName:boxName )){
      ProductsWithFilterModel productsWithFilterModel= await HiveHelper().getBoxes<ProductsWithFilterModel>(boxName) as ProductsWithFilterModel;
      getFilters(productsWithFilterModel.modelList);
      prices=productsWithFilterModel.price;
      productsStreamController.add(productsWithFilterModel.modelList);
      final response=await ProductRepository().getProductsWithFilter(
        showLoader: false,
          modelAgeId: modelAgeId,
          moduleId: moduleId,
          modelGender: subcategoriesList[selectedIndex].modelGenderId,
          modelTypeID: subcategoriesList.isNotEmpty?subcategoriesList[selectedIndex].id:selectedCategoryId,
          selectedFilters: selectedFilters);

      productsWithFilterModel=productsWithFilterBaseModelFromJson(jsonEncode(response.data)).data!;

      await HiveHelper().deleteBoxes(boxName);
      await HiveHelper().addBoxes<ProductsWithFilterModel>(productsWithFilterModel, boxName);

    }else{
      final response=await ProductRepository().getProductsWithFilter(
          modelAgeId: modelAgeId,
          moduleId: moduleId,
          modelGender: subcategoriesList.isNotEmpty?subcategoriesList[selectedIndex].modelGenderId:null,
          modelTypeID: subcategoriesList.isNotEmpty?subcategoriesList[selectedIndex].id:selectedCategoryId,selectedFilters: selectedFilters);
      ProductsWithFilterModel? productsWithFilterModel=productsWithFilterBaseModelFromJson(jsonEncode(response.data)).data!;
      getFilters(productsWithFilterModel.modelList);
      await HiveHelper().deleteBoxes(boxName);
      await HiveHelper().addBoxes<ProductsWithFilterModel>(productsWithFilterModel, boxName);
      prices=productsWithFilterModel.price;
      productsStreamController.add(productsWithFilterModel.modelList);
    }
  }

   initSelectedCategory(){
    if(selectedCategoryId!=null&&subcategoriesList.isNotEmpty){
      selectedIndex=subcategoriesList.indexOf(subcategoriesList.where((element) => element.id==selectedCategoryId&&(element.name==selectedCategoryName||element.enName==selectedCategoryName||element.arName==selectedCategoryName)).first);
      modelGenderId=subcategoriesList[selectedIndex].modelGenderId;
    } else{
      selectedIndex=0;
    }
  }
  onItemClick({required String modelId,required int colorId}){
    AppNavigator().push(routeName: AppRoutes.PRUDUCT_DETAILS_SCREEN_ORUTE,arguments: ProductDetailsParams(modulId:modelId,colorId:colorId ));
  }
  getFilters(List<ProductModel>? modelList)async{
    final response=await ProductRepository().getFilter(modelAgeId: modelAgeId,
      moduleId: moduleId,
      modelGender: subcategoriesList.isNotEmpty?subcategoriesList[selectedIndex].modelGenderId:null,
      modelTypeID: subcategoriesList.isNotEmpty?subcategoriesList[selectedIndex].id:selectedCategoryId);
    ProductsWithFilterModel? fitersModel=productsWithFilterBaseModelFromJson(jsonEncode(response.data)).data;
    filters=fitersModel!.filters;
    productsStreamController.add(modelList);

  }
}