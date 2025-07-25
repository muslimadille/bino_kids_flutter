import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:bino_kids/features/product/model/model_details_model.dart';
import 'package:bino_kids/features/product/providers/wish_list_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class WishListItemWidget extends StatefulWidget {
  final ModelList model;
  final Function(ModelList model) onDelete;
  final Function(ModelList model) onEdit;
  final Function(ModelList model) onAddToCard;


   WishListItemWidget({
    required this.model,
    required this.onDelete,
    required this.onEdit,
    required this.onAddToCard,
    Key? key}) : super(key: key);

  @override
  State<WishListItemWidget> createState() => _WishListItemWidgetState();
}

class _WishListItemWidgetState extends State<WishListItemWidget> {
  Color? selectedColor;
  @override
  void didChangeDependencies() {
    setState(() {

    });
    super.didChangeDependencies();
  }
  @override
  void didUpdateWidget(covariant WishListItemWidget oldWidget) {
    setState(() {

    });
    super.didUpdateWidget(oldWidget);
  }
  @override
  void initState() {
    if((widget.model.colors??[]).isNotEmpty){
      if (widget.model.colors!.where((element) => element.colorId == widget.model.colorId).isNotEmpty) {
        selectedColor = widget.model.colors!.where((element) => element.colorId == widget.model.modelColorId).isNotEmpty
            ? widget.model.colors!.where((element) => element.colorId == widget.model.modelColorId).isNotEmpty
                ? widget.model.colors!.where((element) => element.colorId == widget.model.modelColorId).first
                : widget.model.colors![0]
            : widget.model.colors!.where((element) => element.colorId == widget.model.colorId).first;
      } else {
        selectedColor = widget.model.colors![0];
      }
    }

    super.initState();
  }
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(selectedColor!=null?selectedColor!.imageName??"":widget.model.imageUrl??"",
            width:10.h,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 2.w,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(children: [
                  Expanded(child: Text("${widget.model.modelCode??""}-${widget.model.modelMaterialName??""}-${widget.model.modelDiscriptionName??""}"??'',style: TextStyle(fontSize: AppFontSize.x_small,fontWeight:FontWeight.w500),)),

                ],),
                Wrap(
                  children: [
                    Text("${(widget.model.priceAfterDiscount ??0)} ${tr("EGP")}",style: TextStyle(fontSize: AppFontSize.x_small,color: Colors.red,fontWeight: FontWeight.w500),),
                    SizedBox(width: 2.w,),
                    Visibility(
                      visible:(widget.model.priceBeforeDiscount ??0)>0 ,
                        child: Text("${(widget.model.priceBeforeDiscount ??0)} ${tr("EGP")}",style: TextStyle(fontSize: AppFontSize.x_small,color: Colors.grey,fontWeight: FontWeight.w500),)),
                  ],),
                Visibility(
                    visible: !(widget.model.isHasBalance??false),
                    child: Column(
                      children: [
                        SizedBox(height:1.h),
                        Text(tr("no_model_available"),style: TextStyle(color: Colors.red,fontWeight: FontWeight.w700,fontSize:
                        AppFontSize.x_small
                        ),),
                      ],
                    )),
                SizedBox(height:0.1.h),
                selectedColor==null?SizedBox():Row(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                  Padding(
                    padding:  EdgeInsets.only(top:1.h),
                    child: Text(tr("Colors:"),style: TextStyle(fontSize: AppFontSize.small,fontWeight: FontWeight.w400),),
                  ),
                  Expanded(
                    child: Wrap(
                      children: List.generate((widget.model.colors??[]).length, (index) {
                        return GestureDetector(
                          onTap: ()async{
                            widget.model.modelColorId=widget.model.colors![index].colorId??0;
                            widget.model.colorId=widget.model.colors![index].colorId??0;
                            selectedColor=widget.model.colors!.where((element) => element.colorId==widget.model.modelColorId).isNotEmpty?
                            widget.model.colors!.where((element) => element.colorId==widget.model.modelColorId).first:
                            widget.model.colors![0];
                            await context.read<WishListProvider>().editWishListItem(
                                modelId: widget.model.modelId,
                                sizeId: widget.model.sizeId,
                                colorId: widget.model.colorId??0,
                                wishListId: widget.model.wishListId);
                            setState(() {
                            });
                          },
                          child: Container(
                              height:4.h,
                              width: 4.h,
                              margin: EdgeInsets.all(1.w),
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  border: Border.fromBorderSide(
                                      BorderSide(
                                          width:1,
                                          color:widget.model.colors![index].colorId==widget.model.modelColorId||widget.model.colors![index].id==widget.model.modelColorId?Colors.black:Colors.white
                                      )
                                  ),
                                  image:DecorationImage(
                                      alignment:Alignment.bottomCenter,
                                      fit: BoxFit.fitHeight,
                                      image: CachedNetworkImageProvider(widget.model.colors![index].imageName??''))
                              )
                          ),
                        );
                      }),),
                  ),
                ],),
                selectedColor==null?SizedBox():Row(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                  Padding(
                    padding:  EdgeInsets.only(top:1.h),
                    child: Text(tr("Sizes:"),style: TextStyle(fontSize: AppFontSize.small,fontWeight: FontWeight.w400),),
                  ),
                  Expanded(
                    child: Wrap(
                      children: List.generate((selectedColor!.sizesOfThisColorList??[]).length, (index) {
                        return GestureDetector(
                          onTap: ()async{
                            widget.model.sizeId= (selectedColor!.sizesOfThisColorList??[])[index].id??0;
                            await context.read<WishListProvider>().editWishListItem(
                                modelId: widget.model.modelId,
                                sizeId: widget.model.sizeId,
                                colorId: widget.model.colorId??0,
                                wishListId: widget.model.wishListId);
                            setState(() {
                            });
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
                                      color:(selectedColor!.sizesOfThisColorList??[])[index].id==widget.model.sizeId?
                                      Colors.black:Colors.grey
                                  )
                              ),
                            ),
                            child: Text((selectedColor!.sizesOfThisColorList??[])[index].name??"",style: TextStyle(color:Colors.black,fontSize: AppFontSize.small),textAlign: TextAlign.center,),
                          ),
                        );
                      }),),
                  ),
                ],)

              ],),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            GestureDetector(onTap: (){
              widget.onDelete(widget.model);
            },child:Icon(Icons.cancel)),
            SizedBox(height: 10.h,),
            GestureDetector(onTap: (){
              widget.onAddToCard(widget.model);
            },child:Icon(Icons.add_shopping_cart)),
          ],)
        ],),
    );
  }
}
