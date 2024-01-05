import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:bino_kids/common/widgets/custom_back_btn.dart';
import 'package:bino_kids/features/product/providers/product_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String modelId;
  const ProductDetailsScreen({
    required this.modelId,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
      ChangeNotifierProvider<ProductDetailsProvider>(
        create: (context) => ProductDetailsProvider(),
        builder: (buildContext,_) {
          WidgetsBinding.instance.addPostFrameCallback((_){
            buildContext.read<ProductDetailsProvider>().onInit();
            buildContext.read<ProductDetailsProvider>().getModelDetails(modelId: modelId);
          });

          return Consumer<ProductDetailsProvider>(
            builder: (context, data,_) {
              return Column(
                children: [
                  CustomBackBtn(title: "Product details",),
                  Expanded(
                    child: data.modelDetailsModel==null?SizedBox():CustomScrollView(
                      slivers: [
                        SliverAppBar(
                    automaticallyImplyLeading:false,
                          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                          elevation: 0,
                          pinned: true,
                          centerTitle: false,
                          stretch: true,
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
                                    return Image(
                                      image: NetworkImage(data.modelDetailsModel!.modelList!.imageList!.where((element) => element.colorId==data.modelDetailsModel!.modelList!.colors![data.selectedColorIndex].colorId).toList()[index].imageName??''),
                                      fit: BoxFit.cover,
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
                              Text("${data.modelDetailsModel!.modelList!.priceAfterDiscount} EGP",style: TextStyle(fontSize: AppFontSize.medium,fontWeight: FontWeight.w700),),
                              SizedBox(width: 3.w,),
                              Text("${data.modelDetailsModel!.modelList!.priceBeforeDiscount} EGP",style: TextStyle(decoration: TextDecoration.lineThrough,color: Colors.grey,fontSize: AppFontSize.x_x_small,fontWeight: FontWeight.w700),)
                            ],),
                              SizedBox(height: 1.5.h),
                              Text(data.modelDetailsModel!.modelList!.modelDiscriptionName??"",style: TextStyle(fontSize: AppFontSize.x_x_small,fontWeight: FontWeight.w400),),
                              SizedBox(height: 1.5.h),
                              Text("Colors:",style: TextStyle(fontSize: AppFontSize.x_x_small,fontWeight: FontWeight.w400),),
                              Wrap(
                                children: List.generate((data.modelDetailsModel!.modelList!.colors??[]).length, (index) {
                                return GestureDetector(
                                  onTap: (){
                                    data.onSelectColor(index);
                                  },
                                  child: Container(
                                    height: 5.h,
                                      width: 5.h,
                                      margin: EdgeInsets.all(1.w),
                                      decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius: BorderRadius.all(Radius.circular(8)),
                                          border: index==data.selectedColorIndex?Border.fromBorderSide(
                                              BorderSide(
                                                  width:1,
                                                  color:Colors.black
                                              )
                                          ):null,
                                          image:DecorationImage(
                                              alignment:Alignment.bottomCenter,
                                              fit: BoxFit.fitHeight,
                                              image: NetworkImage(data.modelDetailsModel!.modelList!.colors![index].imageName??''))
                                      )
                                  ),
                                );
                              }),),
                              Text("Sizes:",style: TextStyle(fontSize: AppFontSize.x_x_small,fontWeight: FontWeight.w400),),
                              Wrap(
                                children: List.generate((data.modelDetailsModel!.modelList!.size??[]).length, (index) {
                                  return GestureDetector(
                                    onTap: (){
                                      data.onSelectSize(index);
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
                                      child: Text(data.modelDetailsModel!.modelList!.size![index].name??"",style: TextStyle(color: index==data.selectedSizeIndex?Colors.white:Colors.black,fontSize: AppFontSize.x_small),textAlign: TextAlign.center,),
                                    ),
                                  );
                                }),)



                            ],),
                        ),)
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 4.w,),
                      IconButton(onPressed: (){},
                          padding: EdgeInsets.zero,
                          icon:Center(child: Icon(Icons.favorite_border,color: Colors.black,size: 4.5.h,)) ),
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
                          },
                          child: SizedBox(
                              width: double.infinity,
                              child: Text(
                                "ADD TO CART",
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

                  ],)
                ],
              );
            }
          );
        }
      ),),
    );
  }
}
