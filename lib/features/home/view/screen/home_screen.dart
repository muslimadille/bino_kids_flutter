
import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
import 'package:bino_kids/features/auth/provider/login_provider.dart';
import 'package:bino_kids/features/home/model/main_categories_model.dart';
import 'package:bino_kids/features/home/model/model_types_model.dart';
import 'package:bino_kids/features/home/model/sub_categories_model.dart';
import 'package:bino_kids/features/home/view/widgets/Loaing_grid_shimmer.dart';
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

import '../../../../common/utils/constants/app_data.dart';
import '../widgets/drawer_wiidget.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>with HomeHelper,AutomaticKeepAliveClientMixin {
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
      drawer:HomeDrawerWidget(),
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
              child: StreamBuilder<MainCategoriesDataModel?>(
                  stream: mainCategoryStreamController.stream,
                  builder: (context, tabSnapshot) {
                    return tabSnapshot.hasData?ListView(
                        scrollDirection:Axis.horizontal ,
                        children: List.generate(categories.length, (index){
                          return Padding(
                            padding:  EdgeInsets.all(2.w),
                            child: GestureDetector(
                              onTap: (){
                                onSelectCategory(index);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(categories[index].name,style:
                                  TextStyle(color:selectedCategoryIndex==index?Colors.black:Colors.grey,fontSize: AppFontSize.x_x_small,fontWeight: FontWeight.w800),),
                                  SizedBox(height: 0.1.h,),
                                  Container(color: selectedCategoryIndex==index?Colors.black:Colors.transparent,height:3,width:categories[index].name.length*2.2.w
                                    ,)
                                ],),
                            ),
                          );
                        })):SizedBox();
                  }
              ),
            ),
            Expanded(
              child:Padding(
                padding:  EdgeInsets.all(2.w),
                child: CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                    SliverToBoxAdapter(child:SliderWidget()),
                      SliverToBoxAdapter(child:StreamBuilder<MainCategoriesDataModel?>(
                          stream: mainCategoryStreamController.stream,
                          builder: (context, snapshot) {
                            return snapshot.hasData?
                            CategoryYearsWidget(
                              moduleId:categories[selectedCategoryIndex].id ,
                              key: UniqueKey(),
                              modelAgeForMainPage: snapshot.data!.modelAgeForMainPage??[],):SizedBox(
                                height: 30.h,
                                width: double.infinity,
                                child: /*LoadingGridShimmer()*/SizedBox());
                          }
                      ),),
                      SliverToBoxAdapter(child:FutureBuilder(future: getMostWatched(), builder: (context,snapshot){
                        return snapshot.hasData?
                        HomeHorzontalListWidget(listTitle:tr("most_watched"), onSeeAllClick: (){}, products: snapshot.data??[],)
                            :SizedBox();
                      }),),
                      SliverToBoxAdapter(child:Visibility(
                        visible: AppData.USER_NAME.isNotEmpty,
                        child: FutureBuilder(future: getSuggestions(), builder: (context,snapshot){
                          return snapshot.hasData?
                          HomeHorzontalListWidget(listTitle: tr('Suggestions'), onSeeAllClick: (){}, products:snapshot.data??[],)
                              :SizedBox();
                        }),
                      )),

                    ]),
              )

            ),
          ],
        ),
      ) ,);
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

}
