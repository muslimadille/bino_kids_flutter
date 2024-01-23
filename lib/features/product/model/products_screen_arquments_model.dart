import 'package:bino_kids/features/home/model/sub_categories_model.dart';

class ProductsScreenArqumentsModel{
  final List<SubCategoryDataModel>? subcategoriesList;
  final int? selectedcategoryId;
  final String? selectedcategoryName;

  ProductsScreenArqumentsModel({
     this.subcategoriesList,
    this.selectedcategoryId,
    this.selectedcategoryName
  });
}