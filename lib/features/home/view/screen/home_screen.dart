import 'dart:math';

import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:bino_kids/features/home/model/main_categories_model.dart';
import 'package:bino_kids/features/home/view/widgets/category_years_widget.dart';
import 'package:bino_kids/features/home/view/widgets/search_widget.dart';
import 'package:bino_kids/features/home/view/widgets/slider_widget.dart';
import 'package:bino_kids/features/home/view_model/home_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sizer/sizer.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>with HomeHelper {
  @override
  void initState() {
    onInit();
    super.initState();
  }
  final GlobalKey<ScaffoldState> drawerKey =  GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:drawerKey,
      drawer:Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(child:
            Center(child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.w),
              child: Image.asset("assets/images/app_name_icon.png"),
            )) ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Handle item 1 tap
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Handle item 2 tap
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body:SafeArea(
        child: Column(
          children: [
            SizedBox(height: 3.h,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.mail_outline,color: Colors.black,size: 8.w,)),
                const Expanded(child: HomeSearchWidget()),
                IconButton(onPressed: (){
                  if(drawerKey.currentState!.isDrawerOpen){
                    drawerKey.currentState!.closeDrawer();
                  }else{
                    drawerKey.currentState!.openDrawer();
                  }
                }, icon: Icon(Icons.menu_outlined,color: Colors.black,size: 8.w,)),
              ],),
            Container(
              width: double.infinity,
              height: 5.h,
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: FutureBuilder<MainCategoriesModel?>(
                  future: getMainCategories(),
                  builder: (context, snapshot) {
                    return snapshot.hasData?ListView(
                        scrollDirection:Axis.horizontal ,
                        children: List.generate(snapshot.data!.data.length, (index){
                          return Padding(
                            padding:  EdgeInsets.all(2.w),
                            child: StreamBuilder<MainCategoriesDataModel?>(
                                stream: mainCategoryStreamController.stream,
                                builder: (context, tabSnapshot) {
                                  return GestureDetector(
                                    onTap: (){
                                      onSelectCategory(index);
                                    },
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(snapshot.data!.data[index].name,style:
                                        TextStyle(color:selectedCategoryIndex==index?Colors.black:Colors.grey,fontSize: AppFontSize.x_x_small,fontWeight: FontWeight.w500),),
                                        SizedBox(height: 0.3.h,),
                                        Container(color: selectedCategoryIndex==index?Colors.black:Colors.transparent,height:2,width:snapshot.data!.data[index].name.length*2.2.w
                                          ,)
                                      ],),
                                  );
                                }
                            ),
                          );
                        })):SizedBox();
                  }
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 2.w,right: 2.w),
                  child: Column(
                    children: [

                      SliderWidget(),
                      CategoryYearsWidget(mainCategoryStreamController: mainCategoryStreamController,),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.symmetric(vertical:2.w,horizontal: 5.w),
                            margin: EdgeInsets.all(2.w),
                            child: Text("Most Viewed",style: TextStyle(color: Colors.white,fontSize: AppFontSize.x_x_small,fontWeight: FontWeight.w700),),),
                        ],
                      ),
                      MasonryGridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 50,
                          mainAxisSpacing: 10,
                          crossAxisCount: 2,
                          itemBuilder: (context, index) {
                            int randomHeight = Random().nextInt(6);
                            return UnconstrainedBox(
                                child: Container(
                                    width: 45.w,
                                    height: index.isOdd?40.h:35.h,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          spreadRadius: 3,
                                          blurRadius: 3,
                                          offset: Offset(0,0), // changes position of shadow
                                        ),
                                      ],

                                    ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                    Expanded(
                                      child: Container(
                                        width: double.infinity,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(topRight:Radius.circular(10),topLeft:Radius.circular(10) ),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(images[randomHeight]))),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                          Container(margin: EdgeInsets.all(2.w),
                                              padding: EdgeInsets.all(2.w),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.grey[200], // You can set your desired color
                                              ),
                                              child: Icon(Icons.add_shopping_cart,size: 5.w,))
                                        ],),
                                      ),
                                    ),
                                    SizedBox(height: 1.h,),
                                    Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: 2.w),
                                      child: Text("255.5 EGP",style: TextStyle(fontSize: AppFontSize.x_small,fontWeight: FontWeight.w700),),
                                    ),
                                    SizedBox(height: 0.5.h,),
                                    Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: 2.w),
                                      child: Text("SIMPLE CLASSIC EUROPEAN KIDS' STYL",style: TextStyle(
                                        color:Colors.grey,
                                          fontSize: AppFontSize.small,fontWeight: FontWeight.w400),),
                                    ),
                                      SizedBox(height: 2.h,),
                                    ],),
                                ),
                            );
                          })
                  ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ) ,);
  }
  List<String> images=[
    "https://i.pinimg.com/564x/08/d5/df/08d5df702ca3608fc667a76b12a1e838.jpg",
    "https://i.pinimg.com/564x/ba/ea/61/baea616df540407c6be8c8b76d6c747d.jpg",
    "https://i.pinimg.com/564x/fb/e1/a6/fbe1a6b6cabbe0c55527ea104a5e3f49.jpg",
    "https://i.pinimg.com/564x/79/7f/e8/797fe89218e9c63fb665b0aebc3567e2.jpg",
    "https://i.pinimg.com/564x/cb/be/14/cbbe1422f0f765e89f49f48ca9f7d27a.jpg",
    "https://i.pinimg.com/564x/da/2c/41/da2c419224badaff556c5439d9f3fa4e.jpg"
  ];
}
