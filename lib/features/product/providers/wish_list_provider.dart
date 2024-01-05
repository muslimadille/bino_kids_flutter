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
}