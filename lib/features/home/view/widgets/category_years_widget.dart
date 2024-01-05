import 'dart:async';

import 'package:bino_kids/features/home/model/main_categories_model.dart';
import 'package:bino_kids/features/home/model/sub_categories_model.dart';
import 'package:bino_kids/features/home/view_model/category_years_helper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../common/utils/constants/app_font_size.dart';
import 'subcategories_list_widget.dart';

class CategoryYearsWidget extends StatefulWidget {
  final StreamController<MainCategoriesDataModel?>mainCategoryStreamController;
  const CategoryYearsWidget({required this.mainCategoryStreamController,Key? key}) : super(key: key);

  @override
  State<CategoryYearsWidget> createState() => _CategoryYearsWidgetState();
}

class _CategoryYearsWidgetState extends State<CategoryYearsWidget>with CategoryYearsHelper {


  @override
  void initState() {
    onInit();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MainCategoriesDataModel?>(
        stream: widget.mainCategoryStreamController.stream,
      builder: (context, snapshot) {
        return snapshot.hasData?
        (snapshot.data!.modelAgeForMainPage??[]).isNotEmpty?
        Column(
          children: [
            Container(
              width: double.infinity,
              height: 5.h,
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: ListView(
                  scrollDirection:Axis.horizontal ,
                  children: List.generate((snapshot.data!.modelAgeForMainPage??[]).length, (index){
                    return Padding(
                      padding:  EdgeInsets.all(2.w),
                      child: GestureDetector(
                        onTap: ()async{
                          await onItemClick(index: index);
                          setState(() {});
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(snapshot.data!.modelAgeForMainPage![index].text,style:
                            TextStyle(color:selectedIndex==index?Colors.black:Colors.grey,fontSize: AppFontSize.x_x_small,fontWeight: FontWeight.w500),),
                            SizedBox(height: 0.3.h,),
                            Container(color: selectedIndex==index?Colors.black:Colors.transparent,height:2,width:snapshot.data!.modelAgeForMainPage![index].text.length*2.2.w
                              ,)
                          ],),
                      ),
                    );
                  })),
            ),
            Container(
              height: 32.h,
              width: double.infinity,
              child: PageView(
                controller: pageController,
                onPageChanged: (currentpage) {
                  setState(() {
                    selectedIndex=currentpage;
                  });
                },
                children:List.generate(snapshot.data!.modelAgeForMainPage!.length, (index){

                  return FutureBuilder<SubCategoriesModel?>(
                    future: getSubCategories(moduleId:snapshot.data!.id,modelAgeId:snapshot.data!.modelAgeForMainPage![index].id  ),
                    builder: (context, subCategorySnapshot) {
                      return subCategorySnapshot.hasData?
                      SubcategoriesListWidget(items:subCategorySnapshot.data!.data,):SizedBox();
                    }
                  );
                }) ,
              ),
            )
          ],
        ):SizedBox():SizedBox();
      }
    );
  }
}
