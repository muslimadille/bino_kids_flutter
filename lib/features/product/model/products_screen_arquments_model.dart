import 'package:bino_kids/features/home/model/sub_categories_model.dart';

class ProductsScreenArqumentsModel{
  final List<SubCategoryDataModel> subcategoriesList;
  final int? selectedcategoryId;
  ProductsScreenArqumentsModel({
    required this.subcategoriesList,
    this.selectedcategoryId
  });
}