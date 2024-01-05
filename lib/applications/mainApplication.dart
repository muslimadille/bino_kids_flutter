import 'package:bino_kids/applications/home_provider.dart';
import 'package:bino_kids/features/auth/provider/login_provider.dart';
import 'package:bino_kids/features/product/providers/product_details_provider.dart';
import 'package:bino_kids/features/product/providers/wish_list_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../features/cart/provider/cart_provider.dart';

class MainApplication{
  static final List<SingleChildWidget> applicationList = [
    ChangeNotifierProvider<HomeProvider>(
        lazy:false,
        create: (context) => HomeProvider()),
    ChangeNotifierProvider<CartProvider>(
        create: (context) => CartProvider()),
    ChangeNotifierProvider<WishListProvider>(
        create: (context) => WishListProvider()),
    ChangeNotifierProvider<LoginProvider>(
        create: (context) => LoginProvider()),

  ];
}

