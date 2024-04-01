import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:bino_kids/features/product/view/widgets/product_item_widget.dart';
import 'package:bino_kids/features/search/provider/search_provider.dart';
import 'package:bino_kids/features/search/view/widgets/search_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../home/view/widgets/subcategories_list_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  double hieght=0;

  @override
  void initState() {
    context.read<SearchProvider>().onInit();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Consumer<SearchProvider>(
      builder: (context,model,_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Row(
            children: [
              IconButton(onPressed: (){
                AppNavigator().goBack();
              }, icon: Icon(Icons.arrow_back,textDirection:AppLocalization.isArabic?TextDirection.rtl:TextDirection.ltr ,)),
              Expanded(child: SearchFieldWidget(onSearch: (String value) async{
                await model.getSearch(searchWord: value);
              },)),
            ],
          ),
          Container(width: double.infinity,height: 1,color: Colors.grey,),
            Padding(
              padding:  EdgeInsets.all(2.w),
              child: Wrap(
                children:List.generate(model.searchKeys.length, (index){
                  return GestureDetector(
                    onTap: (){
                      model.onSelectModel(model.searchKeys[index]);
                    },
                    child: Container(
                      margin:  EdgeInsets.symmetric(vertical:0.5.h,horizontal: 1.w),
                      padding:  EdgeInsets.symmetric(vertical:0.8.h,horizontal: 2.w),
                      decoration:  BoxDecoration(
                        color: model.selectedModel==model.searchKeys[index]?Colors.black:Colors.white,
                        border: Border.fromBorderSide(
                            BorderSide(
                                width:1,
                                color:Colors.grey
                            )
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(5) ),
                      ),
                      child: Text("${model.searchKeys[index].searchName}",style: TextStyle(color: model.selectedModel==model.searchKeys[index]?Colors.white:Colors.black,fontSize: AppFontSize.small),textAlign: TextAlign.center,),),
                  );
                }),),
            ),
            model.selectedModel!=null?Expanded(
              child: model.selectedModel!.toPage==3?
        SubcategoriesListWidget(
            moduleId: model.selectedModel!.moduleId,modelAgeId:0):
              Container(
                color:Colors.grey[200],
                child: MasonryGridView.count(
                    padding: EdgeInsets.only(top: 1.h),
                    shrinkWrap: true,
                    itemCount:model.modelList.length ,
                    mainAxisSpacing: 10,
                    crossAxisSpacing:0,
                    crossAxisCount: 2,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: (){
                            //onItemClick(modelId: snapshot.data![index].guId.toString());
                          },
                          child: ProductItemWidget(index: index, productModel: model.modelList[index],));
                    }),
              ),
            ):SizedBox()

        ],);
      }
    ),),);
  }
}
