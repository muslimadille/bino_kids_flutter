import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/utils/constants/app_data.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../common/utils/constants/app_font_size.dart';
import '../../providers/product_details_provider.dart';
import 'images_screen.dart';

class ProductDetailsBottomSheetWidget extends StatefulWidget {
  const ProductDetailsBottomSheetWidget({Key? key}) : super(key: key);

  @override
  State<ProductDetailsBottomSheetWidget> createState() => _ProductDetailsBottomSheetWidgetState();
}

class _ProductDetailsBottomSheetWidgetState extends State<ProductDetailsBottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductDetailsProvider>(builder: (context, data, _) {
      return Container(
        height: 90.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(8), topLeft: Radius.circular(8)),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: SizedBox()),
                IconButton(
                    onPressed: () {
                      AppNavigator().goBack();
                    },
                    icon: Icon(Icons.close))
              ],
            ),
            Expanded(
              child: data.modelDetailsModel == null
                  ? SizedBox()
                  : CustomScrollView(
                      physics: const BouncingScrollPhysics(),
                      slivers: [
                        SliverAppBar(
                          automaticallyImplyLeading: false,
                          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                          elevation: 0,
                          pinned: true,
                          centerTitle: false,
                          stretch: true,
                          floating: false,
                          expandedHeight: 25.h,
                          flexibleSpace: FlexibleSpaceBar(
                            stretchModes: [StretchMode.zoomBackground],
                            background: data.modelDetailsModel!.modelList!.imageList!.isNotEmpty
                                ? ListView.builder(
                                    padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: data.modelDetailsModel!.modelList!.imageList!.where((element) => element.colorId == data.modelDetailsModel!.modelList!.colors![data.selectedColorIndex].colorId).toList().length,
                                    itemBuilder: (ctx, index) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 1.w),
                                        child: InkWell(
                                          onTap: () {
                                            AppNavigator().push(
                                                routeName: AppRoutes.IMAGES_SCREEN_ROUTE, arguments: ImagesScreenModel(colorIndex: data.selectedColorIndex, colorsList: data.modelDetailsModel!.modelList!.colors ?? [], imageList: data.modelDetailsModel!.modelList!.imageList ?? [], imageIndex: 0));
                                          },
                                          child: Image(
                                            image: CachedNetworkImageProvider(data.modelDetailsModel!.modelList!.imageList!.where((element) => element.colorId == data.modelDetailsModel!.modelList!.colors![data.selectedColorIndex].colorId).toList()[index].imageName ?? ''),
                                            fit: BoxFit.cover,
                                            height: 25.h,
                                            width: 30.w,
                                          ),
                                        ),
                                      );
                                    })
                                : SizedBox(),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: EdgeInsets.all(4.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "${(data.modelDetailsModel!.modelList!.priceAfterDiscount ?? 0).toInt()} ${tr("EGP")}",
                                      style: TextStyle(fontSize: AppFontSize.medium, fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Visibility(
                                        visible: (data.modelDetailsModel!.modelList!.priceBeforeDiscount ?? 0) > 0,
                                        child: Text(
                                          "${(data.modelDetailsModel!.modelList!.priceBeforeDiscount ?? 0).toInt()} ${tr("EGP")}",
                                          style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey, fontSize: AppFontSize.x_x_small, fontWeight: FontWeight.w700),
                                        ))
                                  ],
                                ),
                                SizedBox(height: 1.5.h),
                                Text(
                                  data.modelDetailsModel!.modelList!.modelDiscriptionName ?? "",
                                  style: TextStyle(fontSize: AppFontSize.large, fontWeight: FontWeight.w800),
                                ),
                                SizedBox(height: 1.h),
                                Row(
                                  children: [
                                    Text(
                                      "${tr("code")}: ",
                                      style: TextStyle(fontSize: AppFontSize.x_x_small, fontWeight: FontWeight.w800),
                                    ),
                                    Text(
                                      (data.modelDetailsModel!.modelList!.modelCode ?? ""),
                                      style: TextStyle(fontSize: AppFontSize.x_small, fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 1.h),
                                Row(
                                  children: [
                                    Text(
                                      "${tr("Brand")}: ",
                                      style: TextStyle(fontSize: AppFontSize.x_x_small, fontWeight: FontWeight.w800),
                                    ),
                                    Text(
                                      (data.modelDetailsModel!.modelList!.modelTradeMarkName ?? ""),
                                      style: TextStyle(fontSize: AppFontSize.x_small, fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 1.h),
                                Row(
                                  children: [
                                    Text(
                                      "${tr("material")}: ",
                                      style: TextStyle(fontSize: AppFontSize.x_x_small, fontWeight: FontWeight.w800),
                                    ),
                                    Text(
                                      (data.modelDetailsModel!.modelList!.modelMaterialName ?? ""),
                                      style: TextStyle(fontSize: AppFontSize.x_small, fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 1.h),
                                Row(
                                  children: [
                                    Text(
                                      "${tr("Age Group")}: ",
                                      style: TextStyle(fontSize: AppFontSize.x_x_small, fontWeight: FontWeight.w800),
                                    ),
                                    Text(
                                      (data.modelDetailsModel!.modelList!.modelAgeName ?? ""),
                                      style: TextStyle(fontSize: AppFontSize.x_small, fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 1.5.h),
                                Text(
                                  tr("Colors:"),
                                  style: TextStyle(fontSize: AppFontSize.x_x_small, fontWeight: FontWeight.w400),
                                ),
                                Wrap(
                                  children: List.generate((data.modelDetailsModel!.modelList!.colors ?? []).length, (index) {
                                    return GestureDetector(
                                      onTap: () {
                                        data.onSelectColor(index, true);
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.all(1.w),
                                        child: Column(
                                          children: [
                                            Container(
                                                height: 3.h,
                                                width: 3.h,
                                                margin: EdgeInsets.all(1.w),
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[200],
                                                    borderRadius: BorderRadius.all(Radius.circular(50)),
                                                    border: index == data.selectedColorIndex ? Border.fromBorderSide(BorderSide(width: 1, color: Colors.black)) : null,
                                                    image: DecorationImage(alignment: Alignment.bottomCenter, fit: BoxFit.cover, image: CachedNetworkImageProvider(data.modelDetailsModel!.modelList!.colors![index].imageName ?? '')))),
                                            Text(data.modelDetailsModel!.modelList!.colors![index].colorName ?? '')
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                                Text(
                                  tr("Sizes:"),
                                  style: TextStyle(fontSize: AppFontSize.x_x_small, fontWeight: FontWeight.w400),
                                ),
                                Wrap(
                                  children: List.generate(((data.modelDetailsModel!.modelList!.colors ?? [])[data.selectedColorIndex].sizesOfThisColorList ?? []).length, (index) {
                                    return GestureDetector(
                                      onTap: () {
                                        data.onSelectSize(index, true);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.all(1.w),
                                        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
                                        decoration: BoxDecoration(
                                          color: index == data.selectedSizeIndex ? Colors.black : Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(8)),
                                          border: Border.fromBorderSide(BorderSide(width: 1, color: Colors.grey)),
                                        ),
                                        child: Text(
                                          ((data.modelDetailsModel!.modelList!.colors ?? [])[data.selectedColorIndex].sizesOfThisColorList ?? [])[index].name ?? "",
                                          style: TextStyle(color: index == data.selectedSizeIndex ? Colors.white : Colors.black, fontSize: AppFontSize.x_small),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    );
                                  }),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
            ),
            data.modelDetailsModel == null
                ? SizedBox()
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 4.w,
                      ),
                      IconButton(
                          onPressed: () {
                            if (AppData.USER_NAME.isEmpty) {
                              AppNavigator().push(routeName: AppRoutes.LOGIN_SCREEN_ROUTE);
                            } else {
                              data.changeFavourite();
                            }
                          },
                          padding: EdgeInsets.zero,
                          icon: Center(
                              child: Icon(
                            (data.modelDetailsModel!.modelList!.colors![data.selectedColorIndex].isInWishList ?? false) ? Icons.favorite : Icons.favorite_border,
                            color: Colors.black,
                            size: 4.5.h,
                          ))),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3.w),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Colors.black,
                              disabledBackgroundColor: Colors.black,
                              disabledForegroundColor: Colors.black,
                              disabledMouseCursor: SystemMouseCursors.forbidden,
                              padding: EdgeInsets.symmetric(vertical: 1.5.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () async {
                              await data.addItemToCart();
                              /* if(AppData.USER_NAME.isEmpty){
                              AppNavigator().push(routeName: AppRoutes.LOGIN_SCREEN_ROUTE);
                            }else{
                              await data.addItemToCart();
                            }*/
                            },
                            child: SizedBox(
                                width: double.infinity,
                                child: Text(
                                  tr("ADD TO CART"),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white, fontSize: AppFontSize.x_x_small, fontWeight: FontWeight.w700),
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
            SizedBox(
              height: 3.h,
            )
          ],
        ),
      );
    });
  }
}
