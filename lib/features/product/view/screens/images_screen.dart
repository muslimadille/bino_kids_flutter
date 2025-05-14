import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:bino_kids/features/product/model/model_details_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ImagesScreen extends StatefulWidget {
  final List<ImageList> imageList;
  const ImagesScreen({
    required this.imageList,
    Key? key}) : super(key: key);

  @override
  State<ImagesScreen> createState() => _ImagesScreenState();
}

class _ImagesScreenState extends State<ImagesScreen> {
  int imageIndex=0;
  PageController? controller=PageController();
  onChangeImage(int index){
    imageIndex=index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:Stack(
        fit:StackFit.expand,
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: controller,
            onPageChanged: (index) {
              onChangeImage(index);
            },
            children:List.generate(widget.imageList.length, (index){
              return InteractiveViewer(
                boundaryMargin: EdgeInsets.all(20),
                minScale: 0.5,
                maxScale: 4,
                child: Image(
                  image: CachedNetworkImageProvider(widget.imageList[index].imageName??""),
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
                child: Text("${imageIndex+1}/${widget.imageList.length}",style:
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
      ) ,);
  }
}
