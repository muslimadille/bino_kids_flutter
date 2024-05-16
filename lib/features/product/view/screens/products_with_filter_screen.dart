
import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
import 'package:bino_kids/common/widgets/custom_back_btn.dart';
import 'package:bino_kids/features/cart/provider/cart_provider.dart';
import 'package:bino_kids/features/cart/view/widgets/cart_float_btn.dart';
import 'package:bino_kids/features/product/model/products_screen_arquments_model.dart';
import 'package:bino_kids/features/product/view/widgets/filtter_widget.dart';
import 'package:bino_kids/features/product/view/widgets/product_item_widget.dart';
import 'package:bino_kids/features/product/view_model/product_with_filters_helper.dart';
import 'package:bino_kids/features/user_messages/view/widgets/no_data_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../common/utils/constants/app_data.dart';
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
    subcategoriesList.addAll(widget.dataModel.subcategoriesList??[]);
    selectedCategoryId=widget.dataModel.selectedcategoryId;
    selectedCategoryName=widget.dataModel.selectedcategoryName;
    moduleId=widget.dataModel.moduleId;
    modelAgeId=widget.dataModel.modelAgeid;
    modelGenderId=widget.dataModel.modelGenderId;
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
    return  Scaffold(
      key:drawerKey,
      floatingActionButton:Consumer<CartProvider>(builder: (context,dataModel,_){
        if(dataModel.cartItemsResponseModel==null){
          dataModel.getCartItems(showLoading:false);
        }
        return  CartFloatBtn();
        }
      ),
      drawer:StreamBuilder<List<ProductModel>?>(
        stream: productsStreamController.stream,
        builder: (context, snapshot) {
          return filters!=null? FilterWidget(
            selectedFilters: selectedFilters,
            filters:filters!,price: prices!,
            onDone:(values){
            selectedFilters=values;
            getProducts(selectedFilters:selectedFilters );
          } ,):SizedBox();
        }
      ),
      body: Column(
        children: [
          SizedBox(height: 5.h,),
      Row(
        children: [
        Expanded(child:
        StreamBuilder<int>(
            stream: categoryStreamController.stream,
            builder: (context, snapshot) {
              return  CustomBackBtn(title: subcategoriesList.isNotEmpty?subcategoriesList[selectedIndex].name:widget.dataModel.selectedcategoryName??"",);
          }
        )),
          //IconButton(onPressed: (){}, icon: Icon(Icons.grid_view)),
          //IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          IconButton(onPressed: (){
            if(AppData.USER_NAME.isEmpty){
              AppNavigator().push(routeName: AppRoutes.LOGIN_SCREEN_ROUTE);
            }else{
              AppNavigator().push(routeName: AppRoutes.HOME_SCREEN_ROUTE,arguments: 1);
            }
          }, icon: Icon(Icons.favorite_border)),
      ],),
          Container(color: Colors.grey[200],width: double.infinity,height: 1,),
          Visibility(
            visible: (widget.dataModel.subcategoriesList??[]).isNotEmpty,
            child: StreamBuilder<int>(
        stream: categoryStreamController.stream,
        builder: (context, snapshot) {
            return SizedBox(
              height: 13.h,
              width: double.infinity,
              child: ListView.builder(
                  controller: categoryController,
                  padding: EdgeInsets.all(2.w),
                  scrollDirection:Axis.horizontal,
                  itemCount:(widget.dataModel.subcategoriesList??[]).length ,
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
                      color: isSelected?Colors.black:Colors.grey[200],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            margin: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(topRight:Radius.circular(5),topLeft:Radius.circular(5) ),
                                image: DecorationImage(
                                    fit: BoxFit.fitHeight,
                                    image: subcategoriesList[index].imageNameList.isEmpty?
                                    CachedNetworkImageProvider(subcategoriesList[index].image??'')
                                        :CachedNetworkImageProvider(subcategoriesList[index].imageNameList.isNotEmpty?
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
          ),
          Container(color: Colors.grey[200],height: 1.h,width: double.infinity,),
          Padding(
            padding:  EdgeInsets.symmetric(vertical: 1.h,horizontal: 3.w),
            child: GestureDetector(
              onTap: (){
                if(drawerKey.currentState!.isDrawerOpen){
                  drawerKey.currentState!.closeDrawer();
                }else{
                  drawerKey.currentState!.openDrawer();
                }
              },
              child: Row(children: [
                Icon(Icons.filter_alt_outlined,color: Colors.black,),
                Text(tr("Filter"),style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: AppFontSize.x_small),),
                SizedBox(width: 5.w,),
                Container(color: Colors.grey[300],width:1,height: 3.h,),



              ],),
            )
          ),
          Container(color: Colors.grey[200],height: 1.h,width: double.infinity,),
          Expanded(
            child: StreamBuilder<List<ProductModel>?>(
              stream: productsStreamController.stream,
              builder: (context, snapshot) {
                return snapshot.hasData?
                snapshot.data!.isNotEmpty?Container(
                  color:Colors.grey[200],
                  child: MasonryGridView.count(
                    padding: EdgeInsets.only(top: 1.h),
                      shrinkWrap: true,
                      itemCount:snapshot.data!.length ,
                      mainAxisSpacing: 10,
                      crossAxisSpacing:0,
                      crossAxisCount: 2,
                      addAutomaticKeepAlives:false,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            onItemClick(modelId: snapshot.data![index].guId.toString(),colorId:(snapshot.data![index].colorId??0).toInt());
                          },
                            child:  ProductItemWidget(key:UniqueKey(),index: index, productModel: snapshot.data![index],));
                      }),
                ):NoDataWidget()
                    :SizedBox();
              }
            ),
          )
    ],),);
  }
}
