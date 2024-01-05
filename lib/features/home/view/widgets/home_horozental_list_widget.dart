import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:bino_kids/features/product/model/product_model.dart';
import 'package:bino_kids/features/product/view/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sizer/sizer.dart';

class HomeHorzontalListWidget extends StatefulWidget {
  final String listTitle;
  final Function onSeeAllClick;
  final List<ProductModel> products;
  const HomeHorzontalListWidget({
    required this.listTitle,
    required this.onSeeAllClick,
    required this.products,
    Key? key}) : super(key: key);

  @override
  State<HomeHorzontalListWidget> createState() => _HomeHorzontalListWidgetState();
}

class _HomeHorzontalListWidgetState extends State<HomeHorzontalListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 1.h),
      padding: EdgeInsets.only(top: 1.h,left: 1.w,right: 1.w),
      decoration: BoxDecoration(
        borderRadius:BorderRadius.only(topLeft:Radius.circular(10),topRight:Radius.circular(10)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0,0.5],
          colors: [
            Colors.black,
            Colors.white,
          ],
        ),
      ),
      child: Column(children: [
        Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.symmetric(vertical:2.w,horizontal: 5.w),
              margin: EdgeInsets.all(2.w),
              child: Text(widget.listTitle,style: TextStyle(color: Colors.black,fontSize: AppFontSize.x_x_small,fontWeight: FontWeight.w700),),),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 3.w),
              child: Text("See All",style:TextStyle(color: Colors.white,fontSize: AppFontSize.x_x_small,fontWeight: FontWeight.w700),),
            ),

          ],
        ),
        Container(
          height: 22.h,
          width: double.infinity,
          child: MasonryGridView.count(
              shrinkWrap: true,
              itemCount:widget.products.length,
              mainAxisSpacing: 10,
              scrollDirection:Axis.horizontal ,
              crossAxisCount: 1,
              itemBuilder: (context, index) {
                return UnconstrainedBox(
                  child: ProductItemWidget(productModel: widget.products[index], index: -1,height: 20.h,width:28.w,),
                );
              }),
        )
      ],),);
  }
}
