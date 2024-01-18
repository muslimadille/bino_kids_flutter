import 'dart:convert';

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
     getProducts();
  }
  getProducts()async{
    final response=await ProductRepository().getProductsWithFilter(modelTypeID:selectedModel!.nodeId,moduleId:selectedModel!.moduleId);
    ProductsWithFilterModel productsWithFilterModel=productsWithFilterModeFromJson(jsonEncode(response.data));
    modelList.clear();
    modelList.addAll(productsWithFilterModel.modelList??[]);
    notifyListeners();
  }
}