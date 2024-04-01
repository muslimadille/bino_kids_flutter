import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/utils/constants/app_data.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
import 'package:bino_kids/common/widgets/custom_back_btn.dart';
import 'package:bino_kids/features/cart/view/widgets/cart_float_btn.dart';
import 'package:bino_kids/features/product/view/screens/product_details_screen.dart';
import 'package:bino_kids/features/product/view/widgets/product_item_widget.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sizer/sizer.dart';

import '../../model/product_model.dart';

class SeeAllScreen extends StatefulWidget {
  final SeeAllScreenParams params;
  const SeeAllScreen({
    required this.params,
    Key? key}) : super(key: key);

  @override
  State<SeeAllScreen> createState() => _SeeAllScreenState();
}

class _SeeAllScreenState extends State<SeeAllScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: CartFloatBtn(),
      body: Column(
        children: [
          SizedBox(height: 5.h,),
          Row(
            children: [
              Expanded(child:
              CustomBackBtn(title: widget.params.title)
              ),
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
          Container(color: Colors.grey[200],height: 1.h,width: double.infinity,),
          Expanded(
            child: Container(
              color:Colors.grey[200],
              child: MasonryGridView.count(
                  padding: EdgeInsets.only(top: 1.h),
                  shrinkWrap: true,
                  itemCount:widget.params.items.length ,
                  mainAxisSpacing: 10,
                  crossAxisSpacing:0,
                  crossAxisCount: 2,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: (){
                          AppNavigator().push(routeName: AppRoutes.PRUDUCT_DETAILS_SCREEN_ORUTE,arguments: ProductDetailsParams(modulId:widget.params.items[index].guId.toString(),colorId:(widget.params.items[index].colorId??0).toInt() ));
                        },
                        child: ProductItemWidget(index: index, productModel: widget.params.items[index],));
                  }),
            )
          )
        ],),);
  }

}
class SeeAllScreenParams{
  final String title;
  final List<ProductModel> items;
  SeeAllScreenParams({
    required this.title,
    required this.items
});

}
