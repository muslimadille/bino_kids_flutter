import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:bino_kids/features/cart/view/screens/cart_items_screen.dart';
import 'package:bino_kids/features/home/view/screen/home_screen.dart';
import 'package:bino_kids/features/product/view/screens/wish_list_screen.dart';
import 'package:bino_kids/features/profile/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';



mixin HomeTabsHelper {
  int selectedIndex = 0;
   final List<Widget> screens = [
    HomeScreen(),
    WishListScreen(showBack: true,),
    CartItemsScreen(),
  ProfileScreen(),
  ];
  List<BottomNavigationBarItem> tabs = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home_outlined,
        color: Colors.grey[400],
      ),
      label: AppLocalization.translate("HOME_TAB_TITLE"),
      activeIcon: const Icon(
        Icons.home,
        color: Colors.black,
      ),
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.favorite_border,
        color: Colors.grey[400],
      ),
      label: AppLocalization.translate("CATEGORY_TAB_TITLE"),
      activeIcon: const Icon(
        Icons.favorite,
        color: Colors.black,
      ),
    ),

    BottomNavigationBarItem(
      icon: Icon(
        Icons.shopping_cart_outlined,
        color: Colors.grey[400],
      ),
      label: AppLocalization.translate("CART_TAB_TITLE"),
      activeIcon: const Icon(
        Icons.shopping_cart,
        color: Colors.black,
      ),
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.person_outline,
        color: Colors.grey[400],
      ),
      label: AppLocalization.translate("ME_TAB_TITLE"),
      activeIcon: const Icon(
        Icons.person,
        color: Colors.black,
      ),
    ),
  ];

  void onClick({required int index}) {
    switch (index) {
      case 0:
        {}
        break;
      default:
        {}
    }
  }
}
