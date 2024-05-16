import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:bino_kids/features/product/model/filter_model.dart';
import 'package:bino_kids/features/product/model/price_model.dart';
import 'package:bino_kids/features/product/view/widgets/filter_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FilterWidget extends StatefulWidget {
  final Filters filters;
  final Price price;
  Map<String,List<int>>selectedFilters;
  final Function(Map<String,List<int>>selectedFilters) onDone;
   FilterWidget({
    required this.price,
    required this.filters,
    required this.onDone,
    required this.selectedFilters,
    Key? key}) : super(key: key);

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  late  RangeValues rangeValues;
  Map<String,List<int>>selectedFilters={
    "Gender":[],
    "Season":[],
    "ModelAge":[],
    "Material":[],
    "Description":[],
    "Price":[]
  };


  onSelect(String key,int id){
    if((selectedFilters[key]??[]).contains(id)){
      selectedFilters[key]!.removeAt(selectedFilters[key]!.indexOf(id));
    }else{
      if(selectedFilters[key]==null){
        selectedFilters[key]=[];
      }
      selectedFilters[key]!.add(id);
    }
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    rangeValues=RangeValues(double.parse((widget.price.minPrice.toString())),double.parse((widget.price.maxPrice.toString())));
    if(widget.selectedFilters.isNotEmpty){
      selectedFilters=widget.selectedFilters;
    }    super.didChangeDependencies();
  }
  @override
  void didUpdateWidget(covariant FilterWidget oldWidget) {
    rangeValues=RangeValues(double.parse((widget.price.minPrice.toString())),double.parse((widget.price.maxPrice.toString())));
    if(widget.selectedFilters.isNotEmpty){
      selectedFilters=widget.selectedFilters;
    }
    super.didUpdateWidget(oldWidget);
  }
  @override
  void initState() {
    rangeValues=RangeValues(double.parse((widget.price.minPrice.toString())),double.parse((widget.price.maxPrice.toString())));
    if(widget.selectedFilters.isNotEmpty){
      selectedFilters=widget.selectedFilters;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(height: 5.h,),
          Text(tr("Filter"),style: TextStyle(fontSize: AppFontSize.medium,fontWeight: FontWeight.w700),),
          SizedBox(height: 2.h,),
          Container(width:double.infinity,color: Colors.grey,height: 1,),
          SizedBox(height: 3.h,),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 2.h),
              children: <Widget>[
                FilterItemWidget(filterTypeModel: widget.filters.gender,
                  selectedItems: (selectedFilters["Gender"]??[]) ,
                  onSelect: (values){
                    selectedFilters["Gender"]=values;
                  },),
                FilterItemWidget(
                  filterTypeModel: widget.filters.modelAge,
                  selectedItems: (selectedFilters["ModelAge"]??[]) ,
                  onSelect: (values){
                    selectedFilters["ModelAge"]=values;
                  },),
                FilterItemWidget(
                  filterTypeModel: widget.filters.material,
                  selectedItems: (selectedFilters["Material"]??[]) ,
                  onSelect: (values){
                    selectedFilters["Material"]=values;
                  },),
                FilterItemWidget(
                  filterTypeModel: widget.filters.description,
                  selectedItems: (selectedFilters["Description"]??[]) ,
                  onSelect: (values){
                    selectedFilters["Description"]=values;
                  },
                ),
                Text(tr("price"),style: TextStyle(fontWeight: FontWeight.w500,fontSize: AppFontSize.x_small),),
                Row(
                  children: [
                    Text(rangeValues.start.toInt().toString()),
                    Expanded(
                      child: RangeSlider(
                        activeColor: Colors.black,
                        inactiveColor: Colors.grey,
                        labels: RangeLabels(rangeValues.start.toString(),rangeValues.end.toString()),
                        max: (widget.price.maxPrice??0).toDouble(),min:(widget.price.minPrice??0).toDouble(),onChanged: (values){
                        selectedFilters["Price"]=[values.start.toInt(),values.end.toInt()];
                        rangeValues=values;
                        setState(() {});
                      }, values: rangeValues,),
                    ),
                    Text(rangeValues.end.toInt().toString()),

                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 2.h,),
          Container(width:double.infinity,color: Colors.grey,height: 1,),
          SizedBox(height: 2.h,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(child:SizedBox(),),
            GestureDetector(
              onTap: (){
                  selectedFilters={};
                  widget.onDone(selectedFilters);
                  AppNavigator().goBack();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 0.8.h,horizontal:3.w),
                decoration:  BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.fromBorderSide(
                        BorderSide(
                            width:1,
                            color:Colors.grey
                        )
                    )
                ),
                child: Text(tr("clear"),textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: AppFontSize.x_x_small),),),
            ),
            SizedBox(width: 2.w,),
            GestureDetector(
              onTap: (){
                widget.onDone(selectedFilters);
                AppNavigator().goBack();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 0.8.h,horizontal:3.w),
                decoration:  BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Text(tr("Done"),textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: AppFontSize.x_x_small),),),
            ),
              SizedBox(width: 2.w,),
            ],),
          SizedBox(height: 5.h,),

        ],
      ),
    );
  }

}
