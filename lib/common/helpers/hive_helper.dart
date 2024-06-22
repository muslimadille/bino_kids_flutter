import 'package:bino_kids/features/home/model/main_categories_model.dart';
import 'package:bino_kids/features/home/model/model_types_model.dart';
import 'package:bino_kids/features/home/model/sub_categories_model.dart';
import 'package:bino_kids/features/product/model/filter_model.dart';
import 'package:bino_kids/features/product/model/model_details_model.dart';
import 'package:bino_kids/features/product/model/price_model.dart';
import 'package:bino_kids/features/product/model/product_model.dart';
import 'package:bino_kids/features/product/model/products_with_filter_model.dart';
import 'package:hive/hive.dart';

class HiveHelper {
  Future<bool> isExists({required String boxName}) async {
    final openBox = await Hive.openBox(boxName);
    int length = openBox.length;
    return length != 0;
  }
  addBoxes<T>(Object model, String boxName) async {
    print("adding boxes");
    final openBox = await Hive.openBox(boxName);
      openBox.add(model);
  }
  addListBoxes<T>(List<String> model, String boxName) async {
    print("adding boxes");
    final openBox = await Hive.openBox(boxName);
    openBox.addAll(model);
  }
  getListBoxes<T>(String boxName) async {
    final openBox = await Hive.openBox(boxName);
    List<dynamic>data=
    openBox.keys.map((key) {
      final value = openBox.get(key);
      return value;
    }).toList();
    return data;
  }
  deleteBoxes<T>(String boxName) async {
    print("adding boxes");
    bool isExist=await Hive.boxExists(boxName);
    if(isExist){
      await Hive.deleteBoxFromDisk(boxName);
    }
  }

  getBoxes<T>(String boxName) async {
    final openBox = await Hive.openBox(boxName);
    return openBox.getAt(0) as T;
  }
  initAdaptors(){
    Hive.registerAdapter(MainCategoriesModelAdapter());
    Hive.registerAdapter(MainCategoriesDataModelAdapter());
    Hive.registerAdapter(ModelAgeForMainPageAdapter());
    Hive.registerAdapter(ModelTypesModelAdapter());
    Hive.registerAdapter(SubCategoriesModelAdapter());
    Hive.registerAdapter(SubCategoryDataModelAdapter());
    Hive.registerAdapter(ImageNameListAdapter());
    Hive.registerAdapter(ModelDetailsModelAdapter());
    Hive.registerAdapter(ModelListAdapter());
    Hive.registerAdapter(AllSizeAdapter());
    Hive.registerAdapter(ColorAdapter());
    Hive.registerAdapter(ImageListAdapter());
    Hive.registerAdapter(ProductModelAdapter());
    Hive.registerAdapter(ProductsWithFilterBaseModelAdapter());
    Hive.registerAdapter(ProductsWithFilterModelAdapter());
    Hive.registerAdapter(FiltersAdapter());
    Hive.registerAdapter(FilterTypeModelAdapter());
    Hive.registerAdapter(FilterListItemModelAdapter());
    Hive.registerAdapter(PriceAdapter());

  }

}