import 'dart:math';

import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/utils/constants/app_data.dart';
import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:bino_kids/common/widgets/costum_bottom_sheet.dart';
import 'package:bino_kids/features/product/model/product_model.dart';
import 'package:bino_kids/features/product/providers/product_details_provider.dart';
import 'package:bino_kids/features/product/view/screens/poduct_details_bottom_sheet_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ProductItemWidget extends StatefulWidget {
  final int index;
  final ProductModel productModel;
  final double? height;
  final double? width;
  final double?scale;

   const ProductItemWidget({
    required this.index,
    required this.productModel,
    this.height,
    this.width,
    this.scale,
    Key? key}) : super(key: key);

  @override
  State<ProductItemWidget> createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {
  int selectedColorIndex=0;
  @override
  void didUpdateWidget(covariant ProductItemWidget oldWidget) {
    if((widget.productModel.colors??[]).length>1){
      selectedColorIndex=widget.productModel.colors!.indexOf(widget.productModel.colors!.where((element) => element.colorId==widget.productModel.colorId).first);
    }else{
      selectedColorIndex=0;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    // TODO: implement initState
    if(widget.productModel.colors!.where((element) => element.colorId==widget.productModel.colorId).isNotEmpty){
      selectedColorIndex=widget.productModel.colors!.indexOf(widget.productModel.colors!.where((element) => element.colorId==widget.productModel.colorId).first);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        width: (widget.width ?? 48.w)*(widget.scale??1),
        height: (widget.height ?? ( 35.h+((widget.index%3==0)?0:5.h)))*(widget.scale??1),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),

        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(5), topLeft: Radius.circular(5)), image: DecorationImage(
                        fit: BoxFit.cover, image: CachedNetworkImageProvider((widget.productModel.imageUrl??"")))),
                  ),
                  Visibility(
                    visible: AppData.USER_ROLE=="4"&&(widget.productModel.colorsCount??0)>1 ,
                    child: Positioned(
                      bottom: 0,
                        child: Container(
                          margin: EdgeInsets.all(0.5.w),
                          decoration:BoxDecoration(
                            color: Colors.black.withOpacity(0.2),
                            borderRadius: BorderRadius.all(Radius.circular(50)),),
                          child: Column(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: List.generate((widget.productModel.colors??[]).length>3?3:(widget.productModel.colors??[]).length, (index) {
                              return InkWell(
                                onTap: (){
                                  /*setState(() {
                                    selectedColorIndex=index;
                                  });*/
                                },
                                child: Container(
                                    height: 2.h,
                                    width: 2.h,
                                    margin: EdgeInsets.all(0.1.w),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.2),
                                        borderRadius: BorderRadius.all(Radius.circular(50)),
                                        border: Border.fromBorderSide(
                                            BorderSide(
                                                width:1,
                                                color:Colors.black
                                            )
                                        ),
                                        image:DecorationImage(
                                            alignment:Alignment.bottomCenter,
                                            fit: BoxFit.cover,
                                            image: CachedNetworkImageProvider(widget.productModel.colors![index].imageURL??''))
                                    )
                                ),
                              );
                                                    }),),
                              Visibility(
                                visible:(widget.productModel.colorsCount??0)>3 ,
                                child: Container(
                                  height: 2.h,
                                  width: 2.h,
                                  margin: EdgeInsets.all(0.1.w),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(50)),
                                      border: Border.fromBorderSide(
                                          BorderSide(
                                              width:1,
                                              color:Colors.black
                                          )
                                      ),

                                  ),
                                  child: Center(child: Text("${widget.productModel.colorsCount??0}",textAlign: TextAlign.center,style: TextStyle(fontSize:8.sp,color: Colors.black ),)),
                                ),
                              )
                            ],
                          ),
                        )),
                  ),

                ],
              ),
            ),
            Container(height: 1,color: Colors.grey[200],width: double.infinity,),
            SizedBox(
              height: (1.h)*(widget.scale??1),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Text(
                    widget.productModel.priceAfter != null ? ((widget.productModel.priceAfter??0).toInt().toString() +" "+ tr("EGP")) : "",
                    style: TextStyle(color: Colors.red,fontSize: AppFontSize.x_small*(widget.scale??1), fontWeight: FontWeight.w700),
                  ),
                ),
                Visibility(
                  visible: ((widget.productModel.priceAfter??0).toInt()!=(widget.productModel.priceBefore??0).toInt()),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: Text(
                      (widget.productModel.priceBefore??0)>0 ? ((widget.productModel.priceBefore??0).toInt().toString() +" "+ tr("EGP")) : "",
                      style: TextStyle(color: Colors.grey,fontSize: AppFontSize.small*(widget.scale??1), fontWeight: FontWeight.w500,decoration: TextDecoration.lineThrough,),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 0.3.h*(widget.scale??1),
            ),
            Row(
              children: [
                SizedBox(width:2.w),
                Visibility(
                  visible: (widget.productModel.isInTodaysDeal??false)||(widget.productModel.isInNewArrival??false)||(widget.productModel.priceBefore??0)>(widget.productModel.priceAfter??0),
                  child: Container(
                    padding: EdgeInsets.only(top:2.w,left: 2.w,right: 2.w,bottom:1.w),
                    decoration: BoxDecoration(
                      color: (widget.productModel.priceBefore??0)>(widget.productModel.priceAfter??0)?Colors.red:(widget.productModel.isInNewArrival??false)?Colors.green:(widget.productModel.isInTodaysDeal??false)?Colors.orangeAccent:Colors.red,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Text(
                      (widget.productModel.priceBefore??0)>(widget.productModel.priceAfter??0)?tr("Sale"):(widget.productModel.isInNewArrival??false)?tr("New"):
                      (widget.productModel.isInTodaysDeal??false)?tr("today_deal"):"",
                      textAlign: TextAlign.center,

                      style: TextStyle(color: Colors.white,fontSize: 10.sp,height:0.8),),

                  ),
                ),
                SizedBox(width: 2.w,),
                Flexible(
                  child: Text(
                    widget.productModel.description ?? widget.productModel.productData ?? '',
                    overflow:TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.black, fontSize: AppFontSize.x_x_small*(widget.scale??1), fontWeight: FontWeight.w800),
                  ),
                ),
                SizedBox(width:2.w),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 2.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SizedBox(
                          height: 0.5.h*(widget.scale??1),
                        ),
                        Row(
                          children: [
                            Text("${tr("Brand")}: ",style: TextStyle(fontSize: AppFontSize.small*(widget.scale??1),fontWeight: FontWeight.w800),),
                            Text((widget.productModel.modelTradeMarkName??""),style: TextStyle(fontSize: AppFontSize.small*(widget.scale??1),fontWeight: FontWeight.w500),),
                          ],
                        ),
                        Row(
                          children: [
                            Text("${tr("material")}: ",style: TextStyle(fontSize: AppFontSize.small*(widget.scale??1),fontWeight: FontWeight.w800),),
                            Text((widget.productModel.material??""),style: TextStyle(fontSize: AppFontSize.small*(widget.scale??1),fontWeight: FontWeight.w500),),
                          ],
                        ),
                        Row(
                          children: [
                            Text("${tr("Age Group")}: ",style: TextStyle(fontSize: AppFontSize.small*(widget.scale??1),fontWeight: FontWeight.w800),),
                            Text((widget.productModel.modelAgeName??""),style: TextStyle(fontSize: AppFontSize.small,fontWeight: FontWeight.w500),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                    onTap: () async{
                      context.read<ProductDetailsProvider>().onInit(true,(widget.productModel.colorId??0).toInt());
                      context.read<ProductDetailsProvider>().getModelDetails(modelId: widget.productModel.guId ?? '');
                      CustomBottomSheet().displayModalBottomSheet(widget: ProductDetailsBottomSheetWidget());
                    },
                    child: Container(
                        margin: EdgeInsets.all(2.w),
                        padding: EdgeInsets.symmetric(vertical:0.3.h*(widget.scale??1),horizontal: 3.w*(widget.scale??1)),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                            border: Border.fromBorderSide(
                                BorderSide(
                                    width:1,
                                    color:Colors.black
                                )
                            )
                        ),
                        child: Icon(
                          Icons.add_shopping_cart,
                          size: 4.w*(widget.scale??1),
                        )))
              ],
            ),
            SizedBox(
              height: 1.h*(widget.scale??1),
            ),
          ],
        ),
      ),
    );
  }
}
