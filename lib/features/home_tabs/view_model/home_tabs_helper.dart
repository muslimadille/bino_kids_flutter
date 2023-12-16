import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:flutter/material.dart';

mixin HomeTabsHelper {
  int selectedIndex = 0;
  List<Widget> screens = [
    Center(
      child: Text("shop screen"),
    ),
    Center(
      child: Text("category screen"),
    ),
    Center(
      child: Text("new screen"),
    ),
    Center(
      child: Text("cart screenn"),
    ),
    Center(
      child: Text("me screenn"),
    ),
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
        Icons.manage_search,
        color: Colors.grey[400],
      ),
      label: AppLocalization.translate("CATEGORY_TAB_TITLE"),
      activeIcon: const Icon(
        Icons.manage_search,
        color: Colors.black,
      ),
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.new_releases_outlined,
        color: Colors.grey[400],
      ),
      label: AppLocalization.translate("NEW_TAB_TITLE"),
      activeIcon: const Icon(
        Icons.new_releases_sharp,
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
