import 'package:bino_kids/features/home/extentions/banner_model_extention.dart';
import 'package:bino_kids/features/home/model/banner_model.dart';
import 'package:bino_kids/features/home/view_model/banner_slider_helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({Key? key}) : super(key: key);

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget>with BannerSliderHelper {
  @override
  void initState() {
    onInit();
    super.initState();
  }
  @override
  void dispose() {
    onDispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 20.h,
      child: FutureBuilder<BannerModel?>(
        future: getBanner(),
        builder: (context, snapshot) {
          return snapshot.hasData?PageView(
            controller: controller,
            onPageChanged: (currentpage) {

            },
            children:List.generate(snapshot.data!.data.length, (index){

              return GestureDetector(
                onTap: (){
                  snapshot.data!.data[index].onClick();
                },
                child: Container(
                  width: double.infinity,
                  height: 20.h,
                  padding:  EdgeInsets.symmetric(horizontal: 2.w),
                  margin:  EdgeInsets.symmetric(horizontal: 2.w),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      image:DecorationImage(
                          alignment:Alignment.bottomCenter,
                          fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(snapshot.data!.data[index].imagePath??'',))
                  ),
                ),
              );
            }) ,
          ):Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Shimmer.fromColors(
              baseColor: Colors.white60,
              highlightColor: Colors.white,
              child: Container(
                width: double.infinity,
                height: 20.h,
                decoration: BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
