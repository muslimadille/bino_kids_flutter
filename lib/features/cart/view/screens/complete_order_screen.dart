import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
import 'package:bino_kids/common/widgets/custom_back_btn.dart';
import 'package:bino_kids/common/widgets/custom_dropdown_widget.dart';
import 'package:bino_kids/features/cart/provider/cart_provider.dart';
import 'package:bino_kids/features/cart/view/widgets/cart_list_item_widget.dart';
import 'package:bino_kids/features/cart/view/widgets/empty_cart_widget.dart';
import 'package:bino_kids/features/cart/view/widgets/promo_code_widget.dart';
import 'package:flutter/Material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../common/helpers/app_localization.dart';
import '../../../../common/models/custom_dropdown_model.dart';
import '../widgets/payment_method_item_widget.dart';

class CompleteOrderScreen extends StatefulWidget {
  const CompleteOrderScreen({Key? key}) : super(key: key);

  @override
  State<CompleteOrderScreen> createState() => _CompleteOrderScreenState();
}

class _CompleteOrderScreenState extends State<CompleteOrderScreen> {
  @override
  void initState() {
    context.read<CartProvider>().getAllGovernorates();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Consumer<CartProvider>(builder: (context,dataModel,_){
            return  dataModel.cartItemsResponseModel!=null?
            Column(children: [
              CustomBackBtn(title:tr("complete_order"),),
              Expanded(child: Container(
                color: Colors.grey[200],
                child: ListView(children: [
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 2.w),
                    margin:EdgeInsets.symmetric(vertical: 0.3.h,horizontal: 2.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text(tr("shipping_info"),style: TextStyle(fontWeight: FontWeight.w700,fontSize: AppFontSize.x_x_small),),
                      SizedBox(height: 1.h,),
                        Visibility(
                          visible: dataModel.allGovernments.isNotEmpty,
                          child: Row(children: [
                            Icon(Icons.circle,color: Colors.black,size: 10,),
                            SizedBox(width: 2.w,),
                            Text(tr("governorate"),style: TextStyle(fontWeight: FontWeight.w800,fontSize: AppFontSize.x_small),),
                          ],),
                        ),
                        SizedBox(height: 1.h,),
                        Visibility(
                            visible: dataModel.allGovernments.isNotEmpty,
                        child:
                        CustomDropDown(
                          title: tr("select_governorate"),
                          items:List.generate(dataModel.allGovernments.length, (index) {
                            return CustomDropDownModel(
                                title:dataModel.allGovernments[index].name,
                                item:dataModel.allGovernments[index] );
                          }) ,
                          onSelect: (CustomDropDownModel model) {
                            dataModel.selectedGovernment=model.item;
                            dataModel.shippingPrice=dataModel.selectedGovernment!.chargeValue??0;
                            dataModel.setTotalPrice();
                            dataModel.updateSubmitButtonStatus();
                          },
                          selectedValue: dataModel.selectedGovernment!=null?
                          CustomDropDownModel(
                              title:dataModel.selectedGovernment!.name,
                              item:dataModel.selectedGovernment ):null,
                        )),
                        SizedBox(height: 1.h,),
                        Row(children: [
                          Icon(Icons.circle,color: Colors.black,size: 10,),
                          SizedBox(width: 2.w,),
                          Text(tr("address"),style: TextStyle(fontWeight: FontWeight.w800,fontSize: AppFontSize.x_small),),
                        ],),
                        SizedBox(height: 1.h,),
                        Container(
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
                          padding: EdgeInsets.symmetric(vertical: 1.h,horizontal:2.w),
                          child:TextFormField(
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
                        )

                  ],),),
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 2.w),
                    margin:EdgeInsets.symmetric(vertical: 0.3.h,horizontal: 2.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(tr("payment_method"),style: TextStyle(fontWeight: FontWeight.w700,fontSize: AppFontSize.x_x_small),),
                        SizedBox(height: 1.h,),
                         Column(children: [
                          PaymentMethodItemWidget(
                            onSelect:(){
                              dataModel.selectedPaymentMethod=0;
                              dataModel.notifyListeners();
                            },
                            model: PaymentMethodItemModel(
                                title: tr("cash_on_delivery"),
                                image: 'assets/images/cash-on-delivery.png',
                                isSelected: dataModel.selectedPaymentMethod==0),),
                           Visibility(
                             visible: (dataModel.cartItemsResponseModel!.isOnlinePayment??false),
                             child: PaymentMethodItemWidget(
                               onSelect:(){
                                 dataModel.selectedPaymentMethod=1;
                                 dataModel.notifyListeners();
                               },
                               model: PaymentMethodItemModel(
                                   title: tr("online_payment"),
                                   image: 'assets/images/credit-card.png',
                                   isSelected: dataModel.selectedPaymentMethod==1),),
                           )
                        ],),
                      ],),),
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 2.w),
                    margin:EdgeInsets.symmetric(vertical: 0.3.h,horizontal: 2.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(tr("terms_and_condetions"),style: TextStyle(fontWeight: FontWeight.w700,fontSize: AppFontSize.x_x_small),),
                        SizedBox(height: 1.h,),
                        Row(children: [
                          InkWell(
                              onTap:(){
                                dataModel.isAcceptTerms=!dataModel.isAcceptTerms;
                                dataModel.updateSubmitButtonStatus();
                              },
                              child: Icon(dataModel.isAcceptTerms?Icons.check_box:Icons.check_box_outline_blank,color: Colors.black,size: 25,)),
                          SizedBox(width: 2.w,),
                          Text(tr("agree_to"),style: TextStyle(fontWeight: FontWeight.w400,fontSize: AppFontSize.x_small),),
                          InkWell(
                              onTap:(){
                                AppNavigator().push(routeName: AppRoutes.RETURN_POLICY_SCREEN_ROUTE);
                              },
                              child: Text(tr("return_policy"),style: TextStyle(fontWeight: FontWeight.w800,fontSize: AppFontSize.x_small),)),
                          Text(tr("And "),style: TextStyle(fontWeight: FontWeight.w400,fontSize: AppFontSize.x_small),),
                          InkWell(
                              onTap:(){
                                AppNavigator().push(routeName: AppRoutes.SHIPPING_POLICY_SCREEN_ROUTE);
                              },
                              child: Text(tr("shipping_pollicy"),style: TextStyle(fontWeight: FontWeight.w800,fontSize: AppFontSize.x_small),)),

                        ],),
                      ],),),

                ],),)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  SizedBox(height: 2.h,),
                  Row(
                    children: [
                      Text(tr("shipping"),style: TextStyle(color: Colors.black,fontSize: AppFontSize.x_x_small,fontWeight: FontWeight.w800),),
                      Text("${dataModel.shippingPrice} ${tr("EGP")}",style: TextStyle(color: Colors.black,fontSize: AppFontSize.x_x_small,fontWeight: FontWeight.w500),),
                    ],
                  ),
                    SizedBox(height: 1.h,),
                    Row(
                      children: [
                        Text(tr("discount_value"),style: TextStyle(color: Colors.black,fontSize: AppFontSize.x_x_small,fontWeight: FontWeight.w800),),
                        Text("${dataModel.totalDiscount} ${tr("EGP")}",style: TextStyle(color: Colors.black,fontSize: AppFontSize.x_x_small,fontWeight: FontWeight.w500),),
                      ],
                    ),
                    SizedBox(height: 1.h,),
                    Row(
                      children: [
                        Text(tr("total_value"),style: TextStyle(color: Colors.black,fontSize: AppFontSize.x_x_small,fontWeight: FontWeight.w800),),
                        Text("${dataModel.totalPriceAfterDiscount} ${tr("EGP")}",style: TextStyle(color: Colors.red,fontSize: AppFontSize.x_x_small,fontWeight: FontWeight.w500),),
                      ],
                    ),


                  SizedBox(height: 2.h,),
                  PromoCodeWidget(onClick: (value){
                    dataModel.checkPromoCode(value);
                  },),
                  SizedBox(height: 1.h,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor:Colors.black,
                            disabledBackgroundColor: Colors.grey,
                            disabledForegroundColor: Colors.grey,
                            disabledMouseCursor: SystemMouseCursors.forbidden,
                            padding: EdgeInsets.symmetric(vertical:1.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: dataModel.isSubmitButtonActive?()async{
                            dataModel.setOrder();
                          }:null,
                          child: SizedBox(
                              width: 25.w,
                              child: Text(
                                tr("Order"),
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
                    ),
                    SizedBox(height: 1.h,),
                  ],),)
            ],)
                :SizedBox();
          })
      ),
    );
  }

}
