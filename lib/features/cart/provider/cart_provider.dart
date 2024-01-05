import 'dart:convert';

import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
import 'package:bino_kids/common/widgets/costum_bottom_sheet.dart';
import 'package:bino_kids/features/cart/model/cart_items_respose_model.dart';
import 'package:bino_kids/features/cart/repository/cart_repository.dart';
import 'package:bino_kids/features/profile/model/addresses_list_model.dart';
import 'package:bino_kids/features/profile/repository/profile_repository.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../view/widgets/select_address_bottom_sheet.dart';

class CartProvider with ChangeNotifier{
  num totalPrice=0;
  num promoDiscountPercent=0;
  num totalDiscount=0;
  num shippingPrice=0;
  int selectedAddressIndex=0;

  bool isSelectAll=false;
  CartItemsResponseModel?cartItemsResponseModel;
  AddressesListModel? addressesListModel;

  Future getCartItems()async{
    cartItemsResponseModel=null;
    final response=await CartRepository().getAllCartItems();
    cartItemsResponseModel= cartItemsResponseModelFromJson(jsonEncode(response.data));
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
    for(CartModelList item in cartItemsResponseModel!.modelList??[]){
      if(item.isSelected??false){
       totalPrice=totalPrice+((item.price??0)*(item.quantity??0));
       totalDiscount=totalDiscount+((item.price??0)*promoDiscountPercent);
      }
    }
    totalPrice=totalPrice-totalDiscount;
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
    final response=await CartRepository().setOrder(
        totalAfterDiscount: totalPrice.toString(),
        governmentId: addressesListModel!.addressDataModel!.addressList![selectedAddressIndex].governmentId.toString(),
        addressName: addressesListModel!.addressDataModel!.addressList![selectedAddressIndex].addressName??'');
    AppNavigator().push(routeName: AppRoutes.HOME_SCREEN_ROUTE);
  }
}