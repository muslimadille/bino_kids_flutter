import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:bino_kids/features/cart/provider/cart_provider.dart';
import 'package:bino_kids/features/cart/view/widgets/shipping_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SelectAddressBottomSheet extends StatelessWidget {
  const SelectAddressBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context,dataModel,_){
      return Container(
        height: 60.h,
        padding:  EdgeInsets.symmetric(vertical:2.h,horizontal: 2.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft:Radius.circular(8),topRight:Radius.circular(8) ),

        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(tr("Shipping_to"),style: TextStyle(fontSize: AppFontSize.medium,fontWeight: FontWeight.w700),),
            SizedBox(height: 1.h,),
            (dataModel.addressesListModel!.addressDataModel!.addressList??[]).isNotEmpty?Expanded(child: ListView.builder(
              itemCount: (dataModel.addressesListModel!.addressDataModel!.addressList??[]).length,
                itemBuilder: (context,index){
              return ShippingItemWidget(onSelect: (int value) {
                dataModel.onSelectAddress(value);
              }, index: index, model: dataModel.addressesListModel!.addressDataModel!.addressList![index],
                isSelected: index==dataModel.selectedAddressIndex,);
            })):SizedBox(),
            SizedBox(height: 2.h,),
            /*Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 2.w),
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
                    child: TextFormField(
                      controller:dataModel.addressController,
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
                          hintText: tr("enter_address"),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: AppFontSize.x_x_small,
                            fontWeight: FontWeight.w400,
                          )
                      ),
                      keyboardType: TextInputType.text ,
                      cursorColor: Colors.black,
                      onChanged: (value){
                        dataModel.updateSubmitButtonStatus();
                      },
                      validator:(value){
                      },
                    ),

                  ),
                ),
                SizedBox(width: 2.w,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor:Colors.black,
                      disabledBackgroundColor: Colors.black,
                      disabledForegroundColor: Colors.black,
                      disabledMouseCursor: SystemMouseCursors.forbidden,
                      padding: EdgeInsets.symmetric(vertical:1.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: ()async{
                      dataModel.setAddress((dataModel.addressesListModel!.addressDataModel!.addressList??[])[dataModel.selectedAddressIndex]);
                      AppNavigator().goBack();
                    },
                    child: SizedBox(
                        child: Text(
                          tr("add"),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: AppFontSize.x_x_small,
                              fontWeight: FontWeight.w700
                          ),
                        )
                    ),
                  ),
                )
              ],
            ),*/

            SizedBox(height: 2.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor:Colors.black,
                  disabledBackgroundColor: Colors.black,
                  disabledForegroundColor: Colors.black,
                  disabledMouseCursor: SystemMouseCursors.forbidden,
                  padding: EdgeInsets.symmetric(vertical:1.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: ()async{
                    dataModel.setAddress((dataModel.addressesListModel!.addressDataModel!.addressList??[])[dataModel.selectedAddressIndex]);
                    AppNavigator().goBack();
                },
                child: SizedBox(
                    width:double.infinity,
                    child: Text(
                      tr("confirm"),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: AppFontSize.x_x_small,
                          fontWeight: FontWeight.w700
                      ),
                    )
                ),
              ),
            ),
            SizedBox(height: 1.h,)
          ],),
      )

        ;});

  }
}
