import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
import 'package:bino_kids/features/home/model/sub_categories_model.dart';
import 'package:bino_kids/features/product/model/products_screen_arquments_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ModelTypesGridWidget extends StatelessWidget {
  final List<SubCategoryDataModel>items;
  const ModelTypesGridWidget({
    required this.items,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.h,
      margin: EdgeInsets.only(top: 1.h),
      padding:  EdgeInsets.symmetric(horizontal: 2.w),
      child: GridView.builder(
        padding: EdgeInsets.only(top: 1.h,bottom: 1.h),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // Number of columns in the grid
          crossAxisSpacing: 2.w, // Spacing between columns
          mainAxisSpacing: 2.w, // Spacing between rows
        ),
        itemCount: items.length, // Number of items in the grid
        itemBuilder: (BuildContext context, int subCategoryIndex) {
          return
            GestureDetector(
              onTap: (){
                AppNavigator().push(
                    routeName: AppRoutes.PRODUCTS_WITH_FILTER_SCREEN_ROUTE,
                    arguments: ProductsScreenArqumentsModel(
                        selectedcategoryId: items[subCategoryIndex].id,
                        selectedcategoryName:items[subCategoryIndex].name ,
                        subcategoriesList: items));
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
                          image: NetworkImage(items[subCategoryIndex].image??'',)),
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
                  Text(items[subCategoryIndex].name??''
                    ,textAlign: TextAlign.center,style: TextStyle(fontSize: AppFontSize.small),)
                ],
              ),
            );
        },
      ),
    );
  }
}
