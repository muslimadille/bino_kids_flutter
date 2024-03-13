import 'dart:convert';

import 'package:bino_kids/features/product/model/wish_list_model.dart';
import 'package:bino_kids/features/product/repository/product_repository.dart';
import 'package:flutter/cupertino.dart';

class WishListProvider with ChangeNotifier{
  WishlisModel?wishlisModel;
  getWishList()async{
    final response=await ProductRepository().getWishList();
    wishlisModel=wishlisModelFromJson(jsonEncode(response.data));
    notifyListeners();
  }
  deleteAllWishList()async{
    final response=await ProductRepository().deleteAllWishList();
    getWishList();
  }
  addAllWishListToCart()async{
    final response=await ProductRepository().addAllWishListToCart();
    getWishList();
  }
  deleteWishListItem(String id)async{
    final response=await ProductRepository().deleteWishListItem(id);
    getWishList();
  }
  editWishListItem({
    required num modelId,
    required num sizeId,
    required num colorId,
    required num wishListId

  })async{
    final response=await ProductRepository().editWishListItem(
        modelId: modelId, sizeId: sizeId, colorId: colorId,wishListId: wishListId);
    //getWishList();
  }
}