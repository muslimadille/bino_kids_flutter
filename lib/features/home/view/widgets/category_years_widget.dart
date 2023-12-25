import 'dart:async';

import 'package:bino_kids/features/home/model/main_categories_model.dart';
import 'package:bino_kids/features/home/model/sub_categories_model.dart';
import 'package:bino_kids/features/home/view_model/category_years_helper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../common/utils/constants/app_font_size.dart';

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
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 2.w),
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4, // Number of columns in the grid
                            crossAxisSpacing: 2.w, // Spacing between columns
                            mainAxisSpacing: 2.w, // Spacing between rows
                          ),
                          itemCount: subCategorySnapshot.data!.data.length, // Number of items in the grid
                          itemBuilder: (BuildContext context, int subCategoryIndex) {
                            return
                              Column(
                                children: [
                                  ClipOval(child: Image.network(
                                    subCategorySnapshot.data!.data[subCategoryIndex].imageNameList.isNotEmpty?
                                    subCategorySnapshot.data!.data[subCategoryIndex].imageNameList[0].imagePath:"",
                                  fit: BoxFit.cover,
                                  height: 7.h,width:7.h,)),
                                  SizedBox(height: 0.3.h,),
                                  Text(subCategorySnapshot.data!.data[subCategoryIndex].name
                                    ,textAlign: TextAlign.center,style: TextStyle(fontSize: AppFontSize.small),)
                                ],
                              );
                          },
                        ),
                      ):SizedBox();
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
