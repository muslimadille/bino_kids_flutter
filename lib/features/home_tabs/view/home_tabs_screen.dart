import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:bino_kids/features/home_tabs/view_model/home_tabs_helper.dart';
import 'package:flutter/material.dart';

class HomeTabsScreen extends StatefulWidget {
  const HomeTabsScreen({Key? key}) : super(key: key);

  @override
  State<HomeTabsScreen> createState() => _HomeTabsScreenState();
}

class _HomeTabsScreenState extends State<HomeTabsScreen> with HomeTabsHelper {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:screens[selectedIndex],
      bottomNavigationBar:BottomNavigationBar(
      backgroundColor: Colors.white,
      elevation: 20,
      currentIndex: selectedIndex,
      onTap: (int index){
          setState(() {
            selectedIndex=index;
          });
      },
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(
          color: Colors.black,
          fontSize: AppFontSize.x_small,
          fontWeight: FontWeight.w500
      ),
      unselectedLabelStyle: TextStyle(
          color: Colors.grey[400],
          fontSize: AppFontSize.x_small,
          fontWeight: FontWeight.w500
      ),
      selectedFontSize: AppFontSize.x_small,
      unselectedFontSize: AppFontSize.x_small,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey[400],
      items: [
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
      ],
    ),
    );
  }
}
