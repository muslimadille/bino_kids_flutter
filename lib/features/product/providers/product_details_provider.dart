import 'dart:convert';

import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
import 'package:bino_kids/features/cart/repository/cart_repository.dart';
import 'package:bino_kids/features/product/model/model_details_model.dart';
import 'package:bino_kids/features/product/repository/product_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ProductDetailsProvider with ChangeNotifier{
  late final PageController controller ;

  bool isDetailsLoading=false;
  ModelDetailsModel?modelDetailsModel;
  int selectedColorIndex=0;
  int selectedSizeIndex=0;
  int imageIndex=0;
  onInit(){
    controller=PageController();
  }
  onDispose(){
    controller.dispose();
  }


  getModelDetails({required String modelId})async{
    try{
      isDetailsLoading=true;
      notifyListeners();
      final response=await ProductRepository().getModelDetails(modelId: modelId);
      ModelDetailsModel subCategoriesModel=modelDetailsModelFromJson(jsonEncode(response.data));
      modelDetailsModel= subCategoriesModel;
      isDetailsLoading=false;
      notifyListeners();
    } on DioException catch (error){
      return null;
    }
  }
  onSelectColor(int index){
    controller.animateToPage(0, duration: Duration(milliseconds:1), curve: Curves.easeInOut);
    imageIndex=0;
    selectedSizeIndex=0;
    selectedColorIndex=index;
    notifyListeners();
  }
  onSelectSize(int index){
    controller.animateToPage(0, duration: Duration(milliseconds:1), curve: Curves.easeInOut);
    imageIndex=0;
    selectedSizeIndex=index;
    notifyListeners();
  }
  onChangeImage(int index){
    imageIndex=index;
    notifyListeners();
  }
  addItemToCart()async{
    final response=await CartRepository().addItemToCart(
        colorId: (modelDetailsModel!.modelList!.colorId??0).toInt(),
        sizeId: (modelDetailsModel!.modelList!.size![selectedSizeIndex].id??0).toInt(),
        id: modelDetailsModel!.modelList!.id??0);
    AppNavigator().push(routeName: AppRoutes.HOME_SCREEN_ROUTE,arguments: 3);

  }

}