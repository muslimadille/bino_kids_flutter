import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:bino_kids/features/product/model/filter_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FilterItemWidget extends StatefulWidget {

  final FilterTypeModel filterTypeModel;
  List<int>selectedItems;
  final Function(List<int>selectedItems) onSelect;
   FilterItemWidget({
    required this.filterTypeModel,
    required this.onSelect,
    required this.selectedItems,
    Key? key}) : super(key: key);

  @override
  State<FilterItemWidget> createState() => _FilterItemWidgetState();
}

class _FilterItemWidgetState extends State<FilterItemWidget> {
  bool isSelected(int id){
    return widget.selectedItems.contains(id);
  }
  bool isExpanded=true;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: (widget.filterTypeModel.filterList??[]).isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        GestureDetector(
          onTap: (){
            setState(() {
              isExpanded=!isExpanded;
            });
          },
          child: Row(children: [
            Expanded(child: Text(widget.filterTypeModel.filterName??'',style: TextStyle(fontWeight: FontWeight.w500,fontSize: AppFontSize.x_small),)),
            Icon(isExpanded?Icons.arrow_drop_up:Icons.arrow_drop_down)
          ],),
        ),
        SizedBox(height: 1.h,),
        Visibility(
          visible: isExpanded,
            child: Wrap(
          children:List.generate(widget.filterTypeModel.filterList!.length, (index){
          return GestureDetector(
            onTap: (){
              if(isSelected(widget.filterTypeModel.filterList![index].id)){
                widget.selectedItems.removeAt(widget.selectedItems.indexOf(widget.filterTypeModel.filterList![index].id));
              }else{
                widget.selectedItems.add(widget.filterTypeModel.filterList![index].id);
              }
              widget.onSelect(widget.selectedItems);
              setState(() {
              });
            },
            child: Container(
                margin:  EdgeInsets.symmetric(vertical:0.5.h,horizontal: 1.w),
                padding:  EdgeInsets.symmetric(vertical:0.8.h,horizontal: 2.w),
                decoration:  BoxDecoration(
                  color: isSelected(widget.filterTypeModel.filterList![index].id)?Colors.black:Colors.white,
                  border: Border.fromBorderSide(
                      BorderSide(
                          width:1,
                          color:isSelected(widget.filterTypeModel.filterList![index].id)?Colors.black:Colors.grey
                      )
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8) ),
                ),
              child: Text(widget.filterTypeModel.filterList![index].text,style: TextStyle(color: isSelected(widget.filterTypeModel.filterList![index].id)?Colors.white :Colors.black,fontSize: AppFontSize.small),textAlign: TextAlign.center,),),
          );
        }),)),
          SizedBox(height: 1.h,),
        ],),
    );
  }
}
