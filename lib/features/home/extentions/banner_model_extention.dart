import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
import 'package:bino_kids/features/home/model/banner_model.dart';
import 'package:bino_kids/features/product/model/products_screen_arquments_model.dart';

extension BannerModelExtention on BannerDataModel{
  void onClick(){
    switch(orintedTypeId){
      case 1:{};
      break;
      case 2:AppNavigator().push(
          routeName: AppRoutes.PRODUCTS_WITH_FILTER_SCREEN_ROUTE,
          arguments: ProductsScreenArqumentsModel(selectedcategoryId: modelTypeId??0,selectedcategoryName: modelTypeName??""));
      break;
      case 3: AppNavigator().push(routeName: AppRoutes.PRUDUCT_DETAILS_SCREEN_ORUTE,arguments: (modelId??0).toString());
      break;
    }
  }
}