import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:bino_kids/features/product/model/model_details_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class WishListItemWidget extends StatelessWidget {
  final ModelList model;
  final Function(ModelList model) onDelete;
  const WishListItemWidget({
    required this.model,
    required this.onDelete,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),

        ),
      padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 2.w),
      margin:EdgeInsets.symmetric(vertical: 0.5.h,horizontal: 2.w),
      child: Row(
        children: [
          Image.network(model.imageUrl??model.colors![0].imageName??"",
            width:10.h,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 2.w,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Expanded(child: Text("${model.modelCode??""}-${model.modelMaterialName??""}-${model.modelDiscriptionName??""}"??'',style: TextStyle(fontSize: AppFontSize.x_small,fontWeight:FontWeight.w500),)),
                  GestureDetector(onTap: (){
                    onDelete(model);
                  },child:Icon(Icons.cancel)),
                ],),
                Wrap(
                  children: [
                    Text("${(model.priceBeforeDiscount ??0)} ${tr("EGP")}",style: TextStyle(fontSize: AppFontSize.x_small,color: Colors.red,fontWeight: FontWeight.w500),),
                    SizedBox(width: 2.w,),
                    Text("${(model.priceAfterDiscount ??0)} ${tr("EGP")}",style: TextStyle(fontSize: AppFontSize.x_small,color: Colors.grey,fontWeight: FontWeight.w500),),
                  ],),
                SizedBox(height:0.1.h),
                Row(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                  Padding(
                    padding:  EdgeInsets.only(top:1.h),
                    child: Text("Colors:",style: TextStyle(fontSize: AppFontSize.small,fontWeight: FontWeight.w400),),
                  ),
                  Expanded(
                    child: Wrap(
                      children: List.generate((model.colors??[]).length, (index) {
                        return GestureDetector(
                          onTap: (){

                          },
                          child: Container(
                              height:4.h,
                              width: 4.h,
                              margin: EdgeInsets.all(1.w),
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  image:DecorationImage(
                                      alignment:Alignment.bottomCenter,
                                      fit: BoxFit.fitHeight,
                                      image: NetworkImage(model.colors![index].imageName??''))
                              )
                          ),
                        );
                      }),),
                  ),
                ],),
                Row(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                  Padding(
                    padding:  EdgeInsets.only(top:1.h),
                    child: Text("Sizes:",style: TextStyle(fontSize: AppFontSize.small,fontWeight: FontWeight.w400),),
                  ),
                  Expanded(
                    child: Wrap(
                      children: List.generate((model.size??[]).length, (index) {
                        return GestureDetector(
                          onTap: (){
                          },
                          child: Container(
                            margin: EdgeInsets.all(1.w),
                            padding: EdgeInsets.symmetric(vertical: 0.5.h,horizontal: 2.w),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              border: Border.fromBorderSide(
                                  BorderSide(
                                      width:1,
                                      color:Colors.grey
                                  )
                              ),
                            ),
                            child: Text(model.size![index].name??"",style: TextStyle(color:Colors.black,fontSize: AppFontSize.small),textAlign: TextAlign.center,),
                          ),
                        );
                      }),),
                  ),
                ],)

              ],),
          ),
        ],),
    );
  }
}
