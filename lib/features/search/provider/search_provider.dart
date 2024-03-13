import 'dart:convert';

import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
import 'package:bino_kids/features/product/model/product_model.dart';
import 'package:bino_kids/features/product/model/products_with_filter_model.dart';
import 'package:bino_kids/features/product/repository/product_repository.dart';
import 'package:bino_kids/features/search/model/search_model.dart';
import 'package:flutter/cupertino.dart';
import '../repository/search_repository.dart';

class SearchProvider with ChangeNotifier{
  List<SearchDataModel> searchKeys=[];
  SearchDataModel? selectedModel;
  List<ProductModel> modelList=[];
  onInit(){
    searchKeys.clear();
    selectedModel=null;
    modelList.clear();
  }

  getSearch({required String searchWord})async{
    final response=await SearchRepository().getSearch(searchWord:searchWord);
    SearchModel searchModel=searchModelFromJson(jsonEncode(response.data));
    searchKeys.clear();
    searchKeys.addAll(searchModel.data);
    notifyListeners();
  }
  onSelectModel(SearchDataModel? model){
     selectedModel=model;
     notifyListeners();
     if(selectedModel!.toPage==1){
    AppNavigator().push(routeName: AppRoutes.PRUDUCT_DETAILS_SCREEN_ORUTE,arguments: (selectedModel!.modelGuid).toString());
    }else if(selectedModel!.toPage==2){
       getProducts();
     }else if(selectedModel!.toPage==3){
       notifyListeners();
     }

  }
  getProducts()async{
    modelList.clear();
    notifyListeners();
    final response=await ProductRepository().getProductsWithFilter(
        modelTypeID:selectedModel!.nodeId,moduleId:selectedModel!.moduleId,);
    ProductsWithFilterModel productsWithFilterModel=productsWithFilterBaseModelFromJson(jsonEncode(response.data)).data!;
    modelList.clear();
    modelList.addAll(productsWithFilterModel.modelList??[]);
    notifyListeners();
  }
}