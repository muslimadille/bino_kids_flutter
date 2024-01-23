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
  final bool? showSeeAll;
  final Axis?scrollDirection;

  const HomeHorzontalListWidget({
    required this.listTitle,
    required this.onSeeAllClick,
    required this.products,
    this.showSeeAll,
    this.scrollDirection,
    Key? key}) : super(key: key);

  @override
  State<HomeHorzontalListWidget> createState() => _HomeHorzontalListWidgetState();
}

class _HomeHorzontalListWidgetState extends State<HomeHorzontalListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 1.h),
      padding: EdgeInsets.only(top: 1.h, left: 1.w, right: 1.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 0.5],
          colors: [
            Colors.black,
            Colors.grey.withOpacity(0.1),
          ],
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color:Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                margin: EdgeInsets.symmetric(vertical: 1.h,horizontal: 2.w),
                padding: EdgeInsets.symmetric(vertical: 2.w, horizontal: 4.w),
                child: Text(
                  widget.listTitle,
                  style: TextStyle(color: Colors.black, fontSize: AppFontSize.x_small, fontWeight: FontWeight.w800),
                ),
              ),
              Visibility(
                visible: false,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Text(
                    tr("see_all"),
                    style: TextStyle(color: Colors.white, fontSize: AppFontSize.x_small, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          Container(
            height:(widget.scrollDirection??Axis.vertical)==Axis.vertical?null: 25.h,
            width: double.infinity,
            child: MasonryGridView.count(
                physics:(widget.scrollDirection??Axis.vertical)==Axis.vertical? NeverScrollableScrollPhysics():null,
                shrinkWrap: true,
                itemCount: widget.products.length,
                mainAxisSpacing: 10,
                scrollDirection: widget.scrollDirection??Axis.vertical,
                crossAxisCount: (widget.scrollDirection??Axis.vertical)==Axis.vertical?2:1,
                itemBuilder: (context, index) {
                  return UnconstrainedBox(
                    child: GestureDetector(
                        onTap: () {
                          AppNavigator().push(routeName: AppRoutes.PRUDUCT_DETAILS_SCREEN_ORUTE, arguments: widget.products[index].guId.toString());
                        },
                        child: ProductItemWidget(
                          scale: (widget.scrollDirection??Axis.vertical)==Axis.vertical?0.95:0.80,
                          productModel: widget.products[index],
                          index: (widget.scrollDirection??Axis.vertical)==Axis.vertical?index:-1,
                          height:(widget.scrollDirection??Axis.vertical)==Axis.vertical?null:30.h,
                          width:(widget.scrollDirection??Axis.vertical)==Axis.vertical?null: 48.w ,
                        )),
                  );
                }),
          )
        ],
      ),
    );
  }
}
