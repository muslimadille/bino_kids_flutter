import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
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
        borderRadius:BorderRadius.only(topLeft:Radius.circular(5),topRight:Radius.circular(5)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0,0.9],
          colors: [
            Colors.black,
            Colors.grey.withOpacity(0.2),
          ],
        ),
      ),
      child: Column(children: [
        Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
            Container(

              padding: EdgeInsets.symmetric(vertical:2.w,horizontal: 2.w),
              child: Text(widget.listTitle,style: TextStyle(color: Colors.white,fontSize: AppFontSize.medium,fontWeight: FontWeight.w700),),),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 3.w),
              child: Text(tr("see_all"),style:TextStyle(color: Colors.white,fontSize: AppFontSize.x_small,fontWeight: FontWeight.w700),),
            ),

          ],
        ),
        Container(
          height: 25.h,
          width: double.infinity,
          child: MasonryGridView.count(
              shrinkWrap: true,
              itemCount:widget.products.length,
              mainAxisSpacing: 10,
              scrollDirection:Axis.horizontal ,
              crossAxisCount: 1,
              itemBuilder: (context, index) {
                return UnconstrainedBox(
                  child: GestureDetector(
                    onTap: (){
                      AppNavigator().push(routeName: AppRoutes.PRUDUCT_DETAILS_SCREEN_ORUTE,arguments: widget.products[index].guId.toString());
                    },
                      child: ProductItemWidget(
                        scale: 0.8,
                        productModel: widget.products[index], index: -1,height: 30.h,width:40.w,)),
                );
              }),
        )
      ],),);
  }
}
