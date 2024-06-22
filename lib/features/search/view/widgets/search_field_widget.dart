import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/features/search/provider/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  bool showSugestions=false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(3.w),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: AppLocalization.isArabic?
                          BorderRadius.only(topRight:Radius.circular(5),bottomRight:Radius.circular(5))
                              :BorderRadius.only(topLeft:Radius.circular(5),bottomLeft:Radius.circular(5)),

                        ),
                        height:5.h,
                        padding: EdgeInsets.only(top:3.w,left: 4.w,right:4.w),
                        child:Consumer<SearchProvider>(
                            builder: (context,provider,_) {
                            return TextFormField(
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
                                  provider.showSearchWordsList=value.isNotEmpty;
                                  provider.notifyListeners();
                              },
                              validator:(value){
                              },
                            );
                          }
                        )),

                  ],
                ),
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
          Consumer<SearchProvider>(
            builder: (context,provider,_) {
              List<String>data=provider.searchWordsList.where((element){return element.contains(controller.text);}).toList();
              return Visibility(
                visible: provider.showSearchWordsList&&data.isNotEmpty,
                child: Container(
                  width: double.infinity,
                  height: 20.h,
                  margin: EdgeInsets.only(top: 1.h),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.fromBorderSide(
                          BorderSide(
                              width:1,
                              color:Colors.grey
                          )
                      )
                  ),
                  padding: EdgeInsets.symmetric(horizontal:2.w),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(itemBuilder: (ctx,index){
                          return Row(children: [
                            Expanded(child: InkWell(
                              onTap:(){
                                controller.text=data[index];
                                provider.showSearchWordsList=false;
                                provider.notifyListeners();
                              },
                                child: Text(data[index],))),
                            IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: (){
                               provider.deleteSearchWord(data[index]);
                            }, icon: Icon(Icons.delete))
                          ],);
                        }, separatorBuilder: (ctx,index){
                          return Container(height: 1,width: double.infinity,color: Colors.grey.withOpacity(0.5),);
                        }, itemCount: data.length),
                      ),
                    ],
                  ),
                ),

              );
            }
          )
        ],
      ),
    );
  }
}
