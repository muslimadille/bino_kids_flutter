
import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:bino_kids/features/home/model/main_categories_model.dart';
import 'package:bino_kids/features/home/model/model_types_model.dart';
import 'package:bino_kids/features/home/model/sub_categories_model.dart';
import 'package:bino_kids/features/home/view/widgets/category_years_widget.dart';
import 'package:bino_kids/features/home/view/widgets/home_horozental_list_widget.dart';
import 'package:bino_kids/features/home/view/widgets/models_types_grid_widget.dart';
import 'package:bino_kids/features/home/view/widgets/search_widget.dart';
import 'package:bino_kids/features/home/view/widgets/slider_widget.dart';
import 'package:bino_kids/features/home/view/widgets/subcategories_list_widget.dart';
import 'package:bino_kids/features/home/view_model/category_years_helper.dart';
import 'package:bino_kids/features/home/view_model/home_helper.dart';
import 'package:flutter/material.dart';
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
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(child:
                  Center(child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10.w),
                    child: Image.asset("assets/images/app_name_icon.png"),
                  )) ),
                  ListTile(
                    leading: Icon(Icons.note_alt,color: Colors.black,),
                    title: Text('About us'),
                    onTap: () {
                      Navigator.pop(context); // Close the drawer
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.note_alt,color: Colors.black,),
                    title: Text('Return privacy policy'),
                    onTap: () {
                      // Handle item 2 tap
                      Navigator.pop(context); // Close the drawer
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.note_alt,color: Colors.black,),
                    title: Text('Return and exchange policy'),
                    onTap: () {
                      // Handle item 2 tap
                      Navigator.pop(context); // Close the drawer
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.note_alt,color: Colors.black,),
                    title: Text('Return shipping policy'),
                    onTap: () {
                      // Handle item 2 tap
                      Navigator.pop(context); // Close the drawer
                    },
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout,color: Colors.red,),
              title: Text('Logout',style: TextStyle(color: Colors.red,fontSize: AppFontSize.x_x_small,fontWeight: FontWeight.w700
              ),),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            SizedBox(height: 2.h,)
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
                IconButton(onPressed: onMessageIconClick, icon: Icon(Icons.mail_outline,color: Colors.black,size: 8.w,)),
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
                                        TextStyle(color:selectedCategoryIndex==index?Colors.black:Colors.grey,fontSize: AppFontSize.x_x_small,fontWeight: FontWeight.w800),),
                                        SizedBox(height: 0.1.h,),
                                        Container(color: selectedCategoryIndex==index?Colors.black:Colors.transparent,height:3,width:snapshot.data!.data[index].name.length*2.2.w
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

                      StreamBuilder(stream: mainCategoryStreamController.stream, builder: (context,snapshot){
                        return snapshot.hasData?selectedCategoryIndex>0?
                         FutureBuilder<ModelTypesModel?>(
                            future: getModelTypes(moduleId:snapshot.data!.id),
                            builder: (context, subCategorySnapshot) {
                              return subCategorySnapshot.hasData?
                              ModelTypesGridWidget(items:subCategorySnapshot.data!.modelTypes??[],):SizedBox();
                            }
                        ):SizedBox():SizedBox();
                      }),
                      CategoryYearsWidget(mainCategoryStreamController: mainCategoryStreamController,),

                      FutureBuilder(future: getMostWatched(), builder: (context,snapshot){
                        return snapshot.hasData?
                        HomeHorzontalListWidget(listTitle: 'Most watched', onSeeAllClick: (){}, products: snapshot.data??[],)
                            :SizedBox();
                      }),
                      FutureBuilder(future: getSuggestions(), builder: (context,snapshot){
                        return snapshot.hasData?
                        HomeHorzontalListWidget(listTitle: 'Suggestions', onSeeAllClick: (){}, products:snapshot.data??[],)
                            :SizedBox();
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

}
