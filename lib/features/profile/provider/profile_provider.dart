import 'dart:convert';

import 'package:bino_kids/common/utils/constants/app_data.dart';
import 'package:bino_kids/features/profile/model/addresses_list_model.dart';
import 'package:bino_kids/features/profile/model/customer_service_model.dart';
import 'package:bino_kids/features/profile/repository/profile_repository.dart';
import 'package:flutter/cupertino.dart';

class ProfileProvider with ChangeNotifier{
  Future<AddressesListModel?>getAllAddresses()async{
    final response=await  ProfileRepository().getAllAddresses();
    AddressesListModel addressesListModel=addressesListModelFromJson(jsonEncode(response.data));
    return addressesListModel;
  }
  getCustomerServiceNumber()async{
    final response=await  ProfileRepository().getCustomerServiceNumber();
    CustomerServiceModel customerServiceModel=customerServiceModelFromJson(jsonEncode(response.data));
    AppData.CUSTOMER_SERVICE_NUMBER=customerServiceModel.data;
  }
}