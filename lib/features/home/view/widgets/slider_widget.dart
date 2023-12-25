import 'package:bino_kids/features/home/model/banner_model.dart';
import 'package:bino_kids/features/home/view_model/banner_slider_helper.dart';
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

              return Padding(
                padding:  EdgeInsets.symmetric(horizontal: 2.w),
                child: Image.network(
                    snapshot.data!.data[index].imagePath??'',
                  width: double.infinity,
                  height: 20.h,
                  fit: BoxFit.cover,
                  alignment:Alignment.bottomCenter,

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
