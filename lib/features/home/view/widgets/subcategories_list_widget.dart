import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
import 'package:bino_kids/features/home/model/sub_categories_model.dart';
import 'package:bino_kids/features/home/view/widgets/Loaing_grid_shimmer.dart';
import 'package:bino_kids/features/home/view_model/category_years_helper.dart';
import 'package:bino_kids/features/product/model/products_screen_arquments_model.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class SubcategoriesListWidget extends StatefulWidget {
  final int moduleId;
  final int modelAgeId;
   SubcategoriesListWidget({
     required this.moduleId,
     required this.modelAgeId,
    Key? key}) : super(key: key);

  @override
  State<SubcategoriesListWidget> createState() => _SubcategoriesListWidgetState();
}

class _SubcategoriesListWidgetState extends State<SubcategoriesListWidget> with CategoryYearsHelper{

  List<SubCategoryDataModel> subgategorisList=[];
  bool isLoading=false;

@override
  void initState() {
  subgategorisList.clear();
    setState(() {
      isLoading=true;
    });
    getSubCategories(moduleId:widget.moduleId,modelAgeId: widget.modelAgeId  ).then((value) {
      setState(() {
        subgategorisList.addAll(value!.data??[]);
        isLoading=false;
      });
    });


  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return !isLoading? Padding(
    padding:  EdgeInsets.symmetric(horizontal: 2.w),
    child: GridView.builder(
      padding: EdgeInsets.only(top: 1.h) ,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // Number of columns in the grid
        crossAxisSpacing: 2.w, // Spacing between columns
        mainAxisSpacing: 2.w, // Spacing between rows
      ),
      itemCount: subgategorisList.length, // Number of items in the grid
      itemBuilder: (BuildContext context, int subCategoryIndex) {
        return
          GestureDetector(
            onTap: (){
              AppNavigator().push(
                  routeName: AppRoutes.PRODUCTS_WITH_FILTER_SCREEN_ROUTE,
                  arguments: ProductsScreenArqumentsModel(
                      selectedcategoryId: subgategorisList[subCategoryIndex].id,
                      subcategoriesList: subgategorisList));
            },
            child: Column(
              children: [
                Container(
                  height: 7.h,width:7.h,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(50),
                    image:DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(subgategorisList[subCategoryIndex].imageNameList.isNotEmpty?
                        subgategorisList[subCategoryIndex].imageNameList[0].imagePath:"",)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 3,
                        offset: Offset(0,0), // changes position of shadow
                      ),
                    ],
                  ),),
                SizedBox(height: 0.3.h,),
                Text(subgategorisList[subCategoryIndex].name
                  ,textAlign: TextAlign.center,style: TextStyle(fontSize: AppFontSize.small),)
              ],
            ),
          );
      },
    ),
        ):
    LoadingGridShimmer();
  }
}
