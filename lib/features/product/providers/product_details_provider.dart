import 'dart:convert';

import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/helpers/hive_helper.dart';
import 'package:bino_kids/common/utils/constants/app_data.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
import 'package:bino_kids/common/widgets/custom_snakbar.dart';
import 'package:bino_kids/features/cart/provider/cart_provider.dart';
import 'package:bino_kids/features/cart/repository/cart_repository.dart';
import 'package:bino_kids/features/orders/model/chage_favorite_model.dart';
import 'package:bino_kids/features/product/model/model_details_model.dart';
import 'package:bino_kids/features/product/repository/product_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ProductDetailsProvider with ChangeNotifier{
  late final PageController? controller ;

  bool isDetailsLoading=false;
  ModelDetailsModel?modelDetailsModel;
  int selectedColorIndex=0;
  int selectedSizeIndex=0;
  int imageIndex=0;
  onInit(bool fromBottomSheet){
    if(!fromBottomSheet){
      controller=PageController();
    }
     isDetailsLoading=false;
    modelDetailsModel=null;
     selectedColorIndex=0;
     selectedSizeIndex=0;
     imageIndex=0;
  }
  onDispose(){
    controller!.dispose();
  }


  getModelDetails({required String modelId})async{
    String boxName=AppData.hive_Model_details_Types+(AppLocalization.isArabic?"ar":"en")+modelId;
    try{
      if(await HiveHelper().isExists(boxName:boxName )){
        modelDetailsModel= await HiveHelper().getBoxes<ModelDetailsModel>(boxName) as ModelDetailsModel;
        notifyListeners();
        final response=await ProductRepository().getModelDetails(modelId: modelId,showLoader: false);
        ModelDetailsModel subCategoriesModel=modelDetailsModelFromJson(jsonEncode(response.data));
        modelDetailsModel= subCategoriesModel;

        await HiveHelper().deleteBoxes(boxName);
        await HiveHelper().addBoxes<ModelDetailsModel>(modelDetailsModel!, boxName);
      }else{
        isDetailsLoading=true;
        notifyListeners();
        final response=await ProductRepository().getModelDetails(modelId: modelId);
        ModelDetailsModel subCategoriesModel=modelDetailsModelFromJson(jsonEncode(response.data));
        modelDetailsModel= subCategoriesModel;

        await HiveHelper().deleteBoxes(boxName);
        await HiveHelper().addBoxes<ModelDetailsModel>(modelDetailsModel!, boxName);
        isDetailsLoading=false;
        notifyListeners();
      }
    } on DioException catch (error){
      return null;
    }
  }
  onSelectColor(int index,bool fromBottomSheet){
    if(!fromBottomSheet){
      controller!.animateToPage(0, duration: Duration(milliseconds:1), curve: Curves.easeInOut);
    }
    imageIndex=0;
    selectedSizeIndex=0;
    selectedColorIndex=index;
    notifyListeners();
  }
  onSelectSize(int index,bool fromBottomSheet){

    if(!fromBottomSheet){
      controller!.animateToPage(0, duration: Duration(milliseconds:1), curve: Curves.easeInOut);
    }
    imageIndex=0;
    selectedSizeIndex=index;
    notifyListeners();
  }
  onChangeImage(int index){
    imageIndex=index;
    notifyListeners();
  }
  addItemToCart({int?colorId,int?sizeId,int?id})async{
    final response=await CartRepository().addItemToCart(
        colorId: colorId??(modelDetailsModel!.modelList!.colorId??0).toInt(),
        sizeId: sizeId??(modelDetailsModel!.modelList!.size![selectedSizeIndex].id??0).toInt(),
        id: id??modelDetailsModel!.modelList!.id??0);
    CustomSnakbar().appSnackBar(text:tr("success_add_to_cart"));
    //CartProvider().getCartItems();
    //AppNavigator().goBack();
    //AppNavigator().push(routeName: AppRoutes.HOME_SCREEN_ROUTE,arguments: 2);

  }
  changeFavourite()async{
    final responce =await ProductRepository().changeFavourite(
        modelId:modelDetailsModel!.modelList!.id??0,
        colorId:modelDetailsModel!.modelList!.colors![selectedColorIndex].colorId??0,
        sizeId: modelDetailsModel!.modelList!.size![selectedSizeIndex].id??0);
    ChangeFavouriteModel model=changeFavouriteModelFromJson(jsonEncode(responce.data));
    if(model.status==1){
      modelDetailsModel!.modelList!.colors![selectedColorIndex].isInWishList= !(modelDetailsModel!.modelList!.colors![selectedColorIndex].isInWishList??false);
      notifyListeners();
    }
  }


}