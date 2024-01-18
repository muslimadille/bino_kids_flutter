import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../common/utils/constants/app_font_size.dart';

class SearchFieldWidget extends StatefulWidget {
  final Function(String value)onSearch;
  const SearchFieldWidget({
    required this.onSearch,
    Key? key}) : super(key: key);

  @override
  State<SearchFieldWidget> createState() => _SearchFieldWidgetState();
}

class _SearchFieldWidgetState extends State<SearchFieldWidget> {
  late final TextEditingController controller;
  @override
  void initState() {
    controller=TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(3.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: AppLocalization.isArabic?
                  BorderRadius.only(topRight:Radius.circular(5),bottomRight:Radius.circular(5))
                      :BorderRadius.only(topLeft:Radius.circular(5),bottomLeft:Radius.circular(5)),

                ),
                height:5.h,
                padding: EdgeInsets.only(top:3.w,left: 4.w,right:4.w),
                child:TextFormField(
                  controller:controller ,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: AppFontSize.x_x_small,
                    fontWeight: FontWeight.w400,
                  ),
                  onTapOutside: (value){
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedErrorBorder:InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                    isDense:true,
                  ),
                  keyboardType: TextInputType.emailAddress ,
                  cursorColor: Colors.black,
                  onChanged: (value){

                  },
                  validator:(value){

                  },
                )),
          ),
          Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: AppLocalization.isArabic?
                  BorderRadius.only(topLeft:Radius.circular(5),bottomLeft:Radius.circular(5)):
                  BorderRadius.only(topRight:Radius.circular(5),bottomRight:Radius.circular(5))
              ),
              height:5.h,
              padding: EdgeInsets.all(2.w),
              child: GestureDetector(
                onTap: (){
                  widget.onSearch(controller.text);
                },
                child: Icon(Icons.search,color: Colors.white,),))
        ],),
    );
  }
}
