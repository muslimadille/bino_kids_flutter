import 'package:bino_kids/features/home/model/banner_model.dart';
import 'package:bino_kids/features/home/model/main_categories_model.dart';
import 'package:bino_kids/features/home/model/sub_categories_model.dart';
import 'package:bino_kids/features/product/model/products_with_filter_model.dart';

class CashHelper{
  static CashHelper? _instance;

  CashHelper._internal();

  factory CashHelper() {
    return _instance??=CashHelper._internal();
  }

  static  BannerModel? bannerModel;
  static MainCategoriesModel? mainCategoriesModel;
  static Map<String,SubCategoriesModel>subcategoriesMap={};
  static ProductsWithFilterModel? homeMostWatched;
  static ProductsWithFilterModel? homeSuggestions;

  static reset() {
    bannerModel = null;
    mainCategoriesModel = null;
    subcategoriesMap.clear();
    homeMostWatched = null;
    homeSuggestions = null;
  }

}