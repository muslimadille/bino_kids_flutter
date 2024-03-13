import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../models/custom_dropdown_model.dart';


class CustomDropDown extends StatefulWidget {
  final String title;
  final List<CustomDropDownModel>items;
  final CustomDropDownModel? selectedValue;
  final bool? isEnable;
  final Function(CustomDropDownModel model) onSelect;
  const CustomDropDown({
    required this.title,
    required this.items,
    required this.onSelect,
    required this.selectedValue,
    this.isEnable,
    Key? key}) : super(key: key);

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  List<CustomDropDownModel>items=[];
  CustomDropDownModel? selectedValue;
  @override
  void initState() {
    items.clear();
    items.addAll(widget.items);
    if(widget.selectedValue!=null){
      selectedValue=items.where((element) => element.title==widget.selectedValue!.title).first;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.fromBorderSide(
              BorderSide(
                width:1,
                color:Colors.black,
              )
          )
      ),
      padding:EdgeInsets.symmetric(
          vertical:1.h,
          horizontal:1.w),
      child: DropdownButton<CustomDropDownModel>(
        hint: Text(widget.title,style:TextStyle(
          fontFamily: GoogleFonts.getFont('Tajawal').fontFamily,
            fontSize: 9.sp,color:Colors.grey,fontWeight:FontWeight.w700  )),
        isExpanded: true,
        isDense:true ,
        menuMaxHeight: 180.h,
        underline: SizedBox.shrink(),
        icon:Icon(Icons.arrow_drop_down,size: 20,color: Colors.black,),
        style:TextStyle(
            fontFamily: GoogleFonts.getFont('Tajawal').fontFamily,
            fontSize: 9.sp,color:Colors.black,fontWeight:FontWeight.w700  ),
        value: selectedValue,
        onChanged: (widget.isEnable??true)?(CustomDropDownModel? value) {
          widget.onSelect(value!);
          setState(() {
            selectedValue=value;
          });
        }:null,
        items: items
            .map<DropdownMenuItem<CustomDropDownModel>>((CustomDropDownModel value) {
          return DropdownMenuItem<CustomDropDownModel>(
            value: value,
            child: Text(value.title,style:TextStyle(fontSize: 9.sp,fontWeight:FontWeight.w700  )),
          );
        }).toList(),
      ),
    );
  }
}
