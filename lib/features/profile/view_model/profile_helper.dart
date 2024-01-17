import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';

mixin ProfileHelper{
  List<String> orderIcons=[
    "assets/images/ic_unpaid.png",
    "assets/images/ic_processing.png",
    "assets/images/ic_shipped.png",
    "assets/images/ic_review.png",
    "assets/images/ic_returns.png"
  ];
  List<String> orderTitles=[
    "Unpaid",
    "Processing",
    "Shipped",
    "Review",
    "Returns"
  ];
  gotoOrders(){
    AppNavigator().push(routeName: AppRoutes.ALL_ORDERS_SCREEN_ROUTE);
  }
  goTOSettings(){
    AppNavigator().push(routeName: AppRoutes.SETTINGS_SCREEN_ROUTE);
  }

}