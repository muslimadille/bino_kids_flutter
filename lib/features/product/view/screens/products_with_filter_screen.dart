import 'dart:math';

import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:bino_kids/common/widgets/custom_back_btn.dart';
import 'package:bino_kids/features/home/model/model_types_model.dart';
import 'package:bino_kids/features/home/model/sub_categories_model.dart';
import 'package:bino_kids/features/product/model/products_screen_arquments_model.dart';
import 'package:bino_kids/features/product/view/widgets/product_item_widget.dart';
import 'package:bino_kids/features/product/view_model/product_with_filters_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sizer/sizer.dart';

import '../../model/product_model.dart';

class ProductWithFiltersScreen extends StatefulWidget {
  final ProductsScreenArqumentsModel dataModel;

  const ProductWithFiltersScreen({
    required this.dataModel,
    Key? key}) : super(key: key);

  @override
  State<ProductWithFiltersScreen> createState() => _ProductWithFiltersScreenState();
}

class _ProductWithFiltersScreenState extends State<ProductWithFiltersScreen>with productWithFiltersHelper {
  @override
  void initState() {
    subcategoriesList.addAll(widget.dataModel.subcategoriesList);
    selectedCategoryId=widget.dataModel.selectedcategoryId;
    onInit();
    super.initState();
  }
  @override
  void dispose() {
    onDispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: Column(
        children: [
          SizedBox(height: 5.h,),
      Row(
        children: [
        Expanded(child: CustomBackBtn(title: subcategoriesList[selectedIndex].name,)),
          //IconButton(onPressed: (){}, icon: Icon(Icons.grid_view)),
          //IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border)),
      ],),
      StreamBuilder<int>(
        stream: categoryStreamController.stream,
        builder: (context, snapshot) {
          return SizedBox(
            height: 13.h,
            width: double.infinity,
            child: ListView.builder(
                controller: categoryController,
                padding: EdgeInsets.all(2.w),
                scrollDirection:Axis.horizontal,
                itemCount:widget.dataModel.subcategoriesList.length ,
                itemBuilder: (context,index){
                  bool isSelected=(selectedIndex==index);
              return GestureDetector(
                onTap: (){
                  onSelectCategory(index);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                  width: 20.w,
                  height: 13.h,
                  decoration: BoxDecoration(
                    color: isSelected?Colors.black:Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0,0), // changes position of shadow
                      ),
                    ],

                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(topRight:Radius.circular(8),topLeft:Radius.circular(8) ),
                              image: DecorationImage(
                                  fit: BoxFit.fitHeight,
                                  image: subcategoriesList[index].imageNameList.isEmpty?
                                  NetworkImage(subcategoriesList[index].image??'')
                                      :NetworkImage(subcategoriesList[index].imageNameList.isNotEmpty?
                                  subcategoriesList[index].imageNameList[0].imagePath:""))),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
                        child: Text(subcategoriesList[index].name,textAlign: TextAlign.center,style:
                        TextStyle(color: isSelected?Colors.white:Colors.black,fontSize: AppFontSize.small,fontWeight: FontWeight.w400),),
                      ),
                    ],),
                ),
              );
            }),
          );
        }
      ),
          Container(color: Colors.grey[200],height: 1.h,width: double.infinity,),
          Padding(
            padding:  EdgeInsets.symmetric(vertical: 1.h,horizontal: 3.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              GestureDetector(
                onTap: (){

                },
                child: Row(children: [
                  Container(color: Colors.grey[200],width:1,height: 3.h,),
                  SizedBox(width: 5.w,),
                  Text("Filter",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600),),
                  Icon(Icons.filter_alt_outlined,color: Colors.grey,),
                ],),
              )
            ],),
          ),
          Container(color: Colors.grey[200],height: 1.h,width: double.infinity,),
          Expanded(
            child: StreamBuilder<List<ProductModel>?>(
              stream: productsStreamController.stream,
              builder: (context, snapshot) {
                return snapshot.hasData?
                MasonryGridView.count(
                  padding: EdgeInsets.only(top: 1.h),
                    shrinkWrap: true,
                    itemCount:snapshot.data!.length ,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          onItemClick(modelId: snapshot.data![index].guId.toString());
                        },
                          child: ProductItemWidget(index: index, productModel: snapshot.data![index],));
                    }):SizedBox();
              }
            ),
          )
    ],),);
  }
}
