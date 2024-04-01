import 'dart:convert';

import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/utils/constants/app_data.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
import 'package:bino_kids/common/widgets/costum_bottom_sheet.dart';
import 'package:bino_kids/common/widgets/custom_snakbar.dart';
import 'package:bino_kids/features/cart/model/cart_items_respose_model.dart';
import 'package:bino_kids/features/cart/model/goverorates_model.dart';
import 'package:bino_kids/features/cart/model/promo_code_model.dart';
import 'package:bino_kids/features/cart/model/set_order_response_model.dart';
import 'package:bino_kids/features/cart/repository/cart_repository.dart';
import 'package:bino_kids/features/orders/view/screens/all_orders_screen.dart';
import 'package:bino_kids/features/profile/model/addresses_list_model.dart';
import 'package:bino_kids/features/profile/repository/profile_repository.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../view/widgets/select_address_bottom_sheet.dart';

class CartProvider with ChangeNotifier{
  num totalPrice=0;
  num totalPriceAfterDiscount=0;
  String promoCodeId="";
  bool isSubmitButtonActive=false;

  num promoDiscount=0;
  num totalDiscount=0;
  num shippingPrice=0;
  int selectedAddressIndex=0;
  bool isAcceptTerms=false;
  int selectedPaymentMethod=0;

  bool isSelectAll=false;
  CartItemsResponseModel?cartItemsResponseModel;
  AddressesListModel? addressesListModel;
  List<Government> allGovernments=[];
  Government? selectedGovernment;
  TextEditingController addressController=TextEditingController();

  Future getCartItems({bool? showLoading})async{
    cartItemsResponseModel=null;
    final response=await CartRepository().getAllCartItems(showLoading:showLoading);
    cartItemsResponseModel= cartItemsResponseBaseModelFromJson(jsonEncode(response.data)).data;
    notifyListeners();
  }
  onSelectItem(int index,CartModelList item){
    cartItemsResponseModel!.modelList![index].isSelected=item.isSelected;
    checkIIfAllSelected();
  }
   checkIIfAllSelected(){
    for(CartModelList item in cartItemsResponseModel!.modelList??[]){
      if(!(item.isSelected??false)){
        isSelectAll=false;
        setTotalPrice();
        return;
      }
      isSelectAll=true;
      setTotalPrice();
    }
  }
  setTotalPrice(){
    totalPrice=0;
    totalDiscount=0;
    totalPriceAfterDiscount=0;
    for(CartModelList item in cartItemsResponseModel!.modelList??[]){
      if(true){
       totalPrice=totalPrice+((item.price??0)*(item.quantity??0));
      }
    }
    totalPriceAfterDiscount=totalPrice-promoDiscount+shippingPrice;
    notifyListeners();
  }
  onSelectAll(){
    for(CartModelList item in cartItemsResponseModel!.modelList??[]){
      if(isSelectAll) {
        item.isSelected =false;
      }else{
        item.isSelected =true;
      }
    }
    checkIIfAllSelected();
  }
  onEdite(CartModelList item,index)async {
    await CartRepository().editeCartItem(count: (item.quantity??0).toInt(), id: item.id.toString());
    cartItemsResponseModel!.modelList![index].quantity=item.quantity;
    setTotalPrice();
  }
  onDelete(CartModelList item,index)async{
    await CartRepository().deleteCartItem(modelId: item.modelId.toString(), id: item.id.toString());
    cartItemsResponseModel!.modelList!.removeAt(index);
    setTotalPrice();
  }
  gotoSelectAddress(){
    CustomBottomSheet().displayModalBottomSheet(widget:SelectAddressBottomSheet() ,
    fixedSize: 60.h,
    );
  }
  getShippingAddresses()async{
   final response= await ProfileRepository().getAllAddresses();
   addressesListModel=addressesListModelFromJson(jsonEncode(response.data));
   notifyListeners();
  }
  onSelectAddress(int index){
    selectedAddressIndex=index;
    notifyListeners();
  }
  setOrder()async{
    if(AppData.USER_NAME.isNotEmpty){
      if((cartItemsResponseModel!.isUserVerified??false)){
        final response=await CartRepository().setOrder(
            promocodeId: promoCodeId,
            isPayCOnDel:selectedPaymentMethod==0,
            totalAfterDiscount: totalPriceAfterDiscount.toString(),
            governmentId: selectedGovernment!.id.toString(),
            addressName: addressController.text);
        SetOrderResponseModel model=setOrderResponseModelFromJson(jsonEncode(response.data)) ;
        if(model.status==1){
          await getCartItems();
          if(model.returnedUrlToPayment.isNotEmpty&&(cartItemsResponseModel!.isOnlinePayment??false)){
            AppNavigator().push(
                routeName: AppRoutes.PAYMENT_SCREEN_ROUT,
                arguments:model.returnedUrlToPayment??'');
          }else{
            AppNavigator().push(routeName: AppRoutes.ALL_ORDERS_SCREEN_ROUTE,arguments:OrderScreenParams(title:'', orderType: -1) );
          }
        }
      }else{
        AppNavigator().push(routeName: AppRoutes.OTP_SCREEN_ROUT).then((value) {
          notifyListeners();
        });
      }
    }else{
      AppNavigator().push(routeName: AppRoutes.LOGIN_SCREEN_ROUTE);
    }

  }
  getAllGovernorates()async{
    var response=await CartRepository().getAllGovernorates();
    GovernoratesModel governoratesModel=governoratesModelFromJson(jsonEncode(response.data));
    allGovernments.clear();
    allGovernments.addAll(governoratesModel.allGovernments);
    notifyListeners();
  }
  checkPromoCode(String promocode)async{
    var response=await CartRepository().applyPromoCode(
        promoCode: promocode,
        totalPriceBeforeDiscount: totalPrice.toString(),
        );
    PromoCodeModel promoCodeModel=promoCodeModelFromJson(jsonEncode(response.data));
    if(promoCodeModel.status==1){
      promoCodeId=promoCodeModel.promocodeId.toString();
      promoDiscount=totalPrice-promoCodeModel.totalAfterDiscount;
      setTotalPrice();
    }else{
      CustomSnakbar().appSnackBar(isFaild: true,text:promoCodeModel.message);
    }

  }
  updateSubmitButtonStatus(){
    isSubmitButtonActive=selectedGovernment!=null&&addressController.text.isNotEmpty&&isAcceptTerms;
    notifyListeners();
  }
}