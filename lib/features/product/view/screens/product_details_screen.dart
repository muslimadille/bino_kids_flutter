import 'package:bino_kids/common/helpers/analytics_helper.dart';
import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/utils/constants/app_data.dart';
import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
import 'package:bino_kids/common/widgets/custom_back_btn.dart';
import 'package:bino_kids/features/cart/provider/cart_provider.dart';
import 'package:bino_kids/features/home/view/widgets/home_horozental_list_widget.dart';
import 'package:bino_kids/features/product/model/product_model.dart';
import 'package:bino_kids/features/product/providers/product_details_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductDetailsParams productParams;
  const ProductDetailsScreen({
    required this.productParams,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
      ChangeNotifierProvider<ProductDetailsProvider>(
        create: (context) => ProductDetailsProvider(),
        builder: (buildContext,_) {
          WidgetsBinding.instance.addPostFrameCallback((_){
            buildContext.read<ProductDetailsProvider>().onInit(false,productParams.colorId);
            buildContext.read<ProductDetailsProvider>().getModelDetails(modelId: productParams.modulId??"");
          });

          return Consumer<ProductDetailsProvider>(
            builder: (context, data,_) {
              return Column(
                children: [
                  CustomBackBtn(title:tr("Product_details"),),
                  Container(color: Colors.grey[200],width: double.infinity,height: 1,),
                  Expanded(
                    child: data.modelDetailsModel==null?SizedBox():CustomScrollView(
                      physics:const BouncingScrollPhysics(),
                      slivers: [
                        SliverAppBar(
                    automaticallyImplyLeading:false,
                          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                          elevation: 0,
                          pinned: true,
                          centerTitle: false,
                          stretch: true,
                          floating: false,
                          expandedHeight: 50.h,
                          flexibleSpace:  FlexibleSpaceBar(
                            stretchModes: [StretchMode.zoomBackground],
                            background:data.modelDetailsModel!.modelList!.imageList!.isNotEmpty?Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                PageView(
                                  controller: data.controller,
                                  onPageChanged: (index) {
                                    data.onChangeImage(index);
                                  },
                                  children:List.generate(data.modelDetailsModel!.modelList!.imageList!.where((element) => element.colorId==data.modelDetailsModel!.modelList!.colors![data.selectedColorIndex].colorId).toList().length, (index){
                                    return InkWell(
                                      onTap: (){
                                        AppNavigator().push(routeName: AppRoutes.IMAGES_SCREEN_ROUTE,arguments:data.modelDetailsModel!.modelList!.imageList!.where((element) => element.colorId==data.modelDetailsModel!.modelList!.colors![data.selectedColorIndex].colorId).toList() );
                                      },
                                      child: Image(
                                        image: CachedNetworkImageProvider(data.modelDetailsModel!.modelList!.imageList!.where((element) => element.colorId==data.modelDetailsModel!.modelList!.colors![data.selectedColorIndex].colorId).toList()[index].imageName??''),
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  }) ,
                                ),
                                Positioned(bottom:1.h,
                                    child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 0.8.h,horizontal: 5.w),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.7),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  child: Text("${data.imageIndex+1}/${data.modelDetailsModel!.modelList!.imageList!.where((element) => element.colorId==data.modelDetailsModel!.modelList!.colors![data.selectedColorIndex].colorId).toList().length}",style:
                                    TextStyle(color: Colors.white,fontSize: AppFontSize.small),),
                                ))
                              ],
                            ):Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.w),
                              child: Shimmer.fromColors(
                                baseColor: Colors.white60,
                                highlightColor: Colors.white,
                                child: Container(
                                  width: double.infinity,
                                  height: 20.h,
                                  decoration: BoxDecoration(
                                    color: Colors.white60,
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(child: Padding(
                          padding:  EdgeInsets.all(4.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Row(children: [
                              Text("${(data.modelDetailsModel!.modelList!.priceAfterDiscount??0).toInt()} ${tr("EGP")}",style: TextStyle(color: Colors.red,fontSize: AppFontSize.medium,fontWeight: FontWeight.w800),),
                              SizedBox(width: 3.w,),
                              Visibility(visible: (data.modelDetailsModel!.modelList!.priceBeforeDiscount??0)>0,
                                  child: Text("${(data.modelDetailsModel!.modelList!.priceBeforeDiscount??0).toInt()} ${tr("EGP")}",style: TextStyle(decoration: TextDecoration.lineThrough,color: Colors.grey,fontSize: AppFontSize.x_x_small,fontWeight: FontWeight.w700),))
                            ],),
                              SizedBox(height: 1.5.h),
                              Text(data.modelDetailsModel!.modelList!.modelDiscriptionName??"",style: TextStyle(fontSize: AppFontSize.large,fontWeight: FontWeight.w800),),
                              SizedBox(height: 1.5.h),
                              Row(
                                children: [
                                  Text("${tr("code")}: ",style: TextStyle(fontSize: AppFontSize.x_x_small,fontWeight: FontWeight.w800),),
                                  Text((data.modelDetailsModel!.modelList!.modelCode??""),style: TextStyle(fontSize: AppFontSize.x_small,fontWeight: FontWeight.w500),),
                                ],
                              ),
                              SizedBox(height: 1.5.h),
                              Row(
                                children: [
                                  Text("${tr("Brand")}: ",style: TextStyle(fontSize: AppFontSize.x_x_small,fontWeight: FontWeight.w800),),
                                  Text((data.modelDetailsModel!.modelList!.modelTradeMarkName??""),style: TextStyle(fontSize: AppFontSize.x_small,fontWeight: FontWeight.w500),),
                                ],
                              ),
                              SizedBox(height: 1.5.h),
                              Row(
                                children: [
                                  Text("${tr("material")}: ",style: TextStyle(fontSize: AppFontSize.x_x_small,fontWeight: FontWeight.w800),),
                                  Text((data.modelDetailsModel!.modelList!.modelMaterialName??""),style: TextStyle(fontSize: AppFontSize.x_small,fontWeight: FontWeight.w500),),
                                ],
                              ),
                              SizedBox(height: 1.5.h),
                              Row(
                                children: [
                                  Text("${tr("Age Group")}: ",style: TextStyle(fontSize: AppFontSize.x_x_small,fontWeight: FontWeight.w800),),
                                  Text((data.modelDetailsModel!.modelList!.modelAgeName??""),style: TextStyle(fontSize: AppFontSize.x_small,fontWeight: FontWeight.w500),),
                                ],
                              ),
                              SizedBox(height: 1.5.h),
                              Text(tr("Colors:"),style: TextStyle(fontSize: AppFontSize.x_x_small,fontWeight: FontWeight.w800),),
                              Wrap(
                                children: List.generate((data.modelDetailsModel!.modelList!.colors??[]).length, (index) {
                                  var item=(data.modelDetailsModel!.modelList!.colors??[])[index];
                                return GestureDetector(
                                  onTap: (){
                                    data.onSelectColor(index,false);
                                  },
                                  child: Padding(
                                    padding:  EdgeInsets.all(1.w),
                                    child: Column(
                                      children: [
                                        Container(
                                            height: 5.h,
                                            width: 5.h,
                                            margin: EdgeInsets.all(1.w),
                                            decoration: BoxDecoration(
                                                color: Colors.grey[200],
                                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                                border: index==data.selectedColorIndex?Border.fromBorderSide(
                                                    BorderSide(
                                                        width:1,
                                                        color:Colors.black
                                                    )
                                                ):null,
                                                image:DecorationImage(
                                                    alignment:Alignment.bottomCenter,
                                                    fit: BoxFit.fitHeight,
                                                    image: CachedNetworkImageProvider(item.imageName??''))
                                            )
                                        ),
                                        SizedBox(height:0.5.h,),
                                        Text(item.colorName??'',style: TextStyle(fontSize: AppFontSize.small*0.9),)
                                      ],
                                    ),
                                  ),
                                );
                              }),),
                              Text(tr("Sizes:"),style: TextStyle(fontSize: AppFontSize.x_x_small,fontWeight: FontWeight.w800),),
                              Wrap(
                                children: List.generate(((data.modelDetailsModel!.modelList!.colors??[])[data.selectedColorIndex].sizesOfThisColorList??[]).length, (index) {
                                  return GestureDetector(
                                    onTap: (){
                                      if(AppData.USER_ROLE=="2"){
                                        data.onSelectSize(index,false);
                                      }
                                    },
                                    child: Container(
                                        margin: EdgeInsets.all(1.w),
                                      padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 4.w),
                                      decoration: BoxDecoration(
                                            color: index==data.selectedSizeIndex?Colors.black:Colors.white,
                                            borderRadius: BorderRadius.all(Radius.circular(8)),
                                            border: Border.fromBorderSide(
                                                BorderSide(
                                                    width:1,
                                                    color:Colors.grey
                                                )
                                            ),
                                        ),
                                      child: Text(((data.modelDetailsModel!.modelList!.colors??[])[data.selectedColorIndex].sizesOfThisColorList??[])[index].name??"",style: TextStyle(color: index==data.selectedSizeIndex?Colors.white:Colors.black,fontSize: AppFontSize.x_small),textAlign: TextAlign.center,),
                                    ),
                                  );
                                }),),

                              Visibility(
                                  visible: data.modelDetailsModel!.modelList!.similar!.isNotEmpty,
                                  child:
                                  HomeHorzontalListWidget(
                                  showSeeAll:false,
                                    scrollDirection: Axis.horizontal,
                                    listTitle: tr('Similar'), onSeeAllClick: (){}, products:data.modelDetailsModel!.modelList!.similar??[],)

                              )



                            ],),
                        ),)
                      ],
                    ),
                  ),
                  data.modelDetailsModel==null?SizedBox():Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 4.w,),
                      IconButton(onPressed: (){
                        if(AppData.USER_NAME.isEmpty){
                          AppNavigator().push(routeName: AppRoutes.LOGIN_SCREEN_ROUTE);
                        }else{
                          data.changeFavourite();
                        }

                      },
                          padding: EdgeInsets.zero,
                          icon:Center(child: Icon(
                            (data.modelDetailsModel!.modelList!.colors![data.selectedColorIndex].isInWishList??false)?
                            Icons.favorite:
                            Icons.favorite_border,color:
                          Colors.black,size: 4.5.h,)) ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor:Colors.black,
                            disabledBackgroundColor: Colors.black,
                            disabledForegroundColor: Colors.black,
                            disabledMouseCursor: SystemMouseCursors.forbidden,
                            padding: EdgeInsets.symmetric(vertical:1.5.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: ()async{
                            await data.addItemToCart();

                            /*if(AppData.USER_NAME.isEmpty){
                              AppNavigator().push(routeName: AppRoutes.LOGIN_SCREEN_ROUTE);
                            }else{
                              await data.addItemToCart();
                            }*/
                          },
                          child: SizedBox(
                              width: double.infinity,
                              child: Text(
                                tr("ADD TO CART"),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: AppFontSize.x_x_small,
                                    fontWeight: FontWeight.w700
                                ),
                              )
                          ),
                        ),
                      ),
                    ),

                  ],),
                  SizedBox(height: 1.5.h),
                ],
              );
            }
          );
        }
      ),),
    );
  }
}
class ProductDetailsParams{
  String modulId;
  int? colorId;
  ProductDetailsParams({required this.modulId,this.colorId});
}
