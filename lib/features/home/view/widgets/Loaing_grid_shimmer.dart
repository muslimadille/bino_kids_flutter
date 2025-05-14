import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class LoadingGridShimmer extends StatelessWidget {
  const LoadingGridShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding:  EdgeInsets.symmetric(horizontal: 2.w),
      child: GridView.builder(
        padding: EdgeInsets.only(top: 1.h) ,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // Number of columns in the grid
          crossAxisSpacing: 2.w, // Spacing between columns
          mainAxisSpacing: 2.w, // Spacing between rows
        ),
        itemCount: 16, // Number of items in the grid
        itemBuilder: (BuildContext context, int subCategoryIndex) {
          return
            Column(
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: Colors.white,
                  child: Container(
                    height: 7.h,width:7.h,
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.circular(50),
                    ),),
                ),
                SizedBox(height: 0.3.h,),
                Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: Colors.white,
                  child: Container(
                    height: 1.h,width: 10.w,
                    color: Colors.white60,
                  ),
                )
              ],
            );
        },
      ),
    );
  }
}
