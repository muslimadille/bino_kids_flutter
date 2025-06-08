import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:bino_kids/features/product/model/model_details_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ImagesScreen extends StatefulWidget {
  final ImagesScreenModel model;

  const ImagesScreen({
    required this.model,
    Key? key}) : super(key: key);

  @override
  State<ImagesScreen> createState() => _ImagesScreenState();
}

class _ImagesScreenState extends State<ImagesScreen> {
  int imageIndex=0;
  int colorIndex=0;

  List<ImageList> imageList=[];
  PageController? controller=PageController();
  onChangeImage(int index){
    imageIndex=index;
    setState(() {});
  }
@override
  void initState() {
  colorIndex=widget.model.colorIndex;
  imageList.addAll(widget.model.imageList.where((element) => element.colorId==widget.model.colorsList[colorIndex].colorId).toList());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:Column(
        children: [
          Expanded(
            child: Stack(
              fit:StackFit.expand,
              alignment: Alignment.bottomCenter,
              children: [
                PageView(
                  controller: controller,
                  onPageChanged: (index) {
                    onChangeImage(index);
                  },
                  children:List.generate(imageList.length, (index){
                    return InteractiveViewer(
                      boundaryMargin: EdgeInsets.all(20),
                      minScale: 0.5,
                      maxScale: 4,
                      child: Image(
                        image: CachedNetworkImageProvider(imageList[index].imageName??""),
                        fit: BoxFit.cover,
                      ),
                    );
                  }) ,
                ),
                Positioned(bottom:1.h,
                    child: Container(
                      height: 3.h,
                      width: 15.w,
                      padding: EdgeInsets.symmetric(vertical: 0.8.h,horizontal: 5.w),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text("${imageIndex+1}/${imageList.length}",style:
                      TextStyle(color: Colors.white,fontSize: AppFontSize.small),),
                    )),
                Positioned(top:3.h,
                    left: 1.w,
                    child: IconButton(
                      padding: EdgeInsets.symmetric(horizontal: 1.w),
                      onPressed: () {
                        AppNavigator().goBack();
                      },
                      icon: Icon(Icons.cancel,color: Colors.black,size: 30,),
                    ))

              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 10.h,
            child: ListView(
              scrollDirection: Axis. horizontal,
              children: List.generate(widget.model.colorsList.length, (index) {
                var item=widget.model.colorsList[index];
                return GestureDetector(
                  onTap: (){
                    imageIndex=0;
                    controller!.jumpToPage(0);
                    colorIndex=index;
                    imageList.clear();
                    imageList.addAll(widget.model.imageList.where((element) => element.colorId==widget.model.colorsList[colorIndex].colorId).toList());
                    setState(() {});
                  },
                  child: Padding(
                    padding:  EdgeInsets.all(1.w),
                    child: Column(
                      children: [
                        Container(
                            height: 5.h,
                            width: 5.h,
                            margin: EdgeInsets.all(1.w),
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                border: index==colorIndex?Border.fromBorderSide(
                                    BorderSide(
                                        width:1,
                                        color:Colors.black
                                    )
                                ):null,
                                image:DecorationImage(
                                    alignment:Alignment.bottomCenter,
                                    fit: BoxFit.fitHeight,
                                    image: CachedNetworkImageProvider(item.imageName??''))
                            )
                        ),
                        SizedBox(height:0.5.h,),
                        Text(item.colorName??'',style: TextStyle(color: Colors.white,fontSize: AppFontSize.small*0.9),)
                      ],
                    ),
                  ),
                );
              }),),
          ),
        ],
      ) ,);
  }
}

class ImagesScreenModel{
  final int colorIndex;
  final int imageIndex;
  final List<Color>colorsList;
  final  List<ImageList> imageList;
  ImagesScreenModel({
  required this.colorIndex,
  required this.colorsList,
  required this.imageList,
  required this.imageIndex,});
}
