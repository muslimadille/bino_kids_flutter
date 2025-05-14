import 'package:bino_kids/features/home/model/sub_categories_model.dart';

class ProductsScreenArqumentsModel{
  final List<SubCategoryDataModel>? subcategoriesList;
  final int? selectedcategoryId;
  final String? selectedcategoryName;
  final int?moduleId;
  final int? modelAgeid;
  final int? modelGenderId;


  ProductsScreenArqumentsModel({
     this.subcategoriesList,
    this.selectedcategoryId,
    this.selectedcategoryName,
    this.moduleId,
    this.modelAgeid,
    this.modelGenderId
  });
}