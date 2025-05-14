import 'dart:convert';

import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/helpers/hive_helper.dart';
import 'package:bino_kids/common/utils/constants/app_data.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
import 'package:bino_kids/features/product/model/product_model.dart';
import 'package:bino_kids/features/product/model/products_with_filter_model.dart';
import 'package:bino_kids/features/product/repository/product_repository.dart';
import 'package:bino_kids/features/search/model/search_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../../common/helpers/app_localization.dart';
import '../../product/view/screens/product_details_screen.dart';
import '../repository/search_repository.dart';

class SearchProvider with ChangeNotifier{
  List<SearchDataModel> searchKeys=[];
  List<String> searchWordsList=[];
  SearchDataModel? selectedModel;
  List<ProductModel> modelList=[];
  bool showSearchWordsList=false;
  onInit(){
    showSearchWordsList=false;
    getPreSearch();
    searchKeys.clear();
    selectedModel=null;
    modelList.clear();
  }

  getSearch({required String searchWord})async{
    saveSearchWord(searchWord);
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
       ProductDetailsParams model=ProductDetailsParams(modulId:(selectedModel!.modelGuid).toString() );
    AppNavigator().push(routeName: AppRoutes.PRUDUCT_DETAILS_SCREEN_ORUTE,arguments:model );
    }else if(selectedModel!.toPage==2){
       getProducts();
     }else if(selectedModel!.toPage==3){
       notifyListeners();
     }

  }
  getProducts()async{
    modelList.clear();
    EasyLoading.show();
    modelList.clear();
    final response=await ProductRepository().getProductsWithFilter(
      showLoader: false,
      modelTypeID:selectedModel!.nodeId,moduleId:selectedModel!.moduleId,);
    ProductsWithFilterModel productsWithFilterModel=productsWithFilterBaseModelFromJson(jsonEncode(response.data)).data!;
    modelList.addAll(productsWithFilterModel.modelList??[]);
    EasyLoading.dismiss();
    notifyListeners();


  }
   getPreSearch()async{
     searchWordsList.clear();
    String boxName= AppData.hive_pre_search;
    if(await HiveHelper().isExists(boxName:boxName )){
      List<dynamic> ss=(await HiveHelper().getListBoxes(boxName));
      searchWordsList.addAll(List.generate(ss.length,(index) {return  ss[index].toString();}));
    }
    notifyListeners();

  }
  saveSearchWord(String word)async{
    showSearchWordsList=false;
    notifyListeners();
    if(!searchWordsList.contains(word)){
      String boxName= AppData.hive_pre_search;
      searchWordsList.add(word);
      await HiveHelper().deleteBoxes(boxName);
      await HiveHelper().addListBoxes<List<String>>(searchWordsList, boxName);
      await getPreSearch();
    }

  }
  deleteSearchWord(String word)async{
    if(searchWordsList.contains(word)){
      String boxName= AppData.hive_pre_search;
      searchWordsList.remove(word);
      await HiveHelper().deleteBoxes(boxName);
      await HiveHelper().addListBoxes(searchWordsList, boxName);
      await getPreSearch();
    }

  }

}