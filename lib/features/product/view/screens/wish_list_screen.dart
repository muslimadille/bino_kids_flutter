import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/widgets/custom_back_btn.dart';
import 'package:bino_kids/features/product/model/model_details_model.dart';
import 'package:bino_kids/features/product/model/product_model.dart';
import 'package:bino_kids/features/product/providers/wish_list_provider.dart';
import 'package:bino_kids/features/product/view/widgets/wish_list_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../user_messages/view/widgets/no_data_widget.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<WishListProvider>().getWishList();
    return SafeArea(
      child: Consumer<WishListProvider>(builder: (context,dataModel,_){
        return Column(children: [
          Row(
            children: [
              Expanded(child: CustomBackBtn(title: tr('Wish_List'),)),
              //IconButton(onPressed: (){}, icon: Icon(Icons.grid_view)),
              IconButton(onPressed: (){
                dataModel.addAllWishListToCart();
              }, icon: Icon(Icons.add_shopping_cart)),
              IconButton(onPressed: (){
                dataModel.deleteAllWishList();
              }, icon: Icon(Icons.delete)),
            ],),
          Container(color: Colors.grey[200],width: double.infinity,height: 1,),
          Expanded(
          child: dataModel.wishlisModel!=null?
          dataModel.wishlisModel!.modelList.isNotEmpty?Container(
                color: Colors.grey[200],
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 0.7.h),
                    shrinkWrap: true,
                    itemCount:dataModel.wishlisModel!.modelList.length ,
                    itemBuilder: (context,index){
                  return WishListItemWidget(model:dataModel.wishlisModel!.modelList[index],
                    onDelete: (ModelList model) {
                      dataModel.deleteWishListItem(model.wishListId.toString());
                    },);
                }),
              ):NoDataWidget()
          :SizedBox(),
        )
        ],);
      }),
    );

  }
}
