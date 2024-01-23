import 'dart:math';

import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:bino_kids/common/widgets/costum_bottom_sheet.dart';
import 'package:bino_kids/features/product/model/product_model.dart';
import 'package:bino_kids/features/product/providers/product_details_provider.dart';
import 'package:bino_kids/features/product/view/screens/poduct_details_bottom_sheet_widget.dart';
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
  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        width: (widget.width ?? 48.w)*(widget.scale??1),
        height: (widget.height ?? ( 35.h+(Random().nextDouble()*5.h)))*(widget.scale??1),
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
                        fit: BoxFit.cover, image: NetworkImage(widget.productModel.imageUrl ?? ''))),
                  ),
                  Positioned(
                    bottom: 0,
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 0.5.h,horizontal: 0.5.w),
                        decoration:BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.all(Radius.circular(50)),),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: List.generate((widget.productModel.colors??[]).length>4?4:(widget.productModel.colors??[]).length, (index) {
                        return Container(
                            height: 2.h,
                            width: 2.h,
                            margin: EdgeInsets.all(1.w),
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
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
                                    image: NetworkImage(widget.productModel.colors![index].imageURL??''))
                            )
                        );
                    }),),
                      ))
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
                    widget.productModel.priceAfter != null ? (widget.productModel.priceAfter.toString() + tr("EGP")) : "",
                    style: TextStyle(color: Colors.red,fontSize: AppFontSize.x_small*(widget.scale??1), fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Text(
                    widget.productModel.priceBefore != null ? (widget.productModel.priceAfter.toString() + tr("EGP")) : "",
                    style: TextStyle(color: Colors.grey,fontSize: AppFontSize.small*(widget.scale??1), fontWeight: FontWeight.w500,decoration: TextDecoration.lineThrough,),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 0.5.h*(widget.scale??1),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: Text(
                      widget.productModel.description ?? widget.productModel.productData ?? '',
                      style: TextStyle(color: Colors.black, fontSize: AppFontSize.x_x_small*(widget.scale??1), fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
                GestureDetector(
                    onTap: () async{
                      context.read<ProductDetailsProvider>().onInit(true);
                      await context.read<ProductDetailsProvider>().getModelDetails(modelId: widget.productModel.guId ?? '');
                      CustomBottomSheet().displayModalBottomSheet(widget: ProductDetailsBottomSheetWidget());
                    },
                    child: Container(
                        margin: EdgeInsets.all(2.w),
                        padding: EdgeInsets.symmetric(vertical:0.5.h*(widget.scale??1),horizontal: 5.w*(widget.scale??1)),
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
