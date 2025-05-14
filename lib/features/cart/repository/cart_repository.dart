import 'dart:convert';
import 'dart:io';

import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/helpers/device_info_details.dart';
import 'package:bino_kids/common/helpers/facebook_analytics_helper.dart';
import 'package:bino_kids/common/helpers/network/network_request.dart';
import 'package:bino_kids/common/models/network_exception_model.dart';
import 'package:bino_kids/common/models/network_request_model.dart';
import 'package:bino_kids/common/utils/constants/api_codes.dart';
import 'package:bino_kids/common/utils/constants/app_data.dart';
import 'package:bino_kids/common/utils/eums/network_request_enum.dart';
import 'package:dio/dio.dart';

class CartRepository{
  Future<Response>addItemToCart({
    required int colorId,
    required int sizeId,
    required num id,
  })async{
    try {

      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode:ApiCodes.ADD_ITEM_TO_CART,
            networkType: NetworkRequestEnum.put,
            data: jsonEncode({
              "Lang": AppLocalization.isArabic?2:1,
              "UserId": AppData.USER_ID,
              "UserRole": AppData.USER_ROLE,
              "ColorId": colorId,
              "sizeId": sizeId,
              "ID": id,
              "NonLoggingUserId":DeviceInfoDetails().deviceId
            }),
            header: {
              HttpHeaders.contentTypeHeader: "application/json",
              HttpHeaders.acceptHeader:"application/json"
            },
            showProgress: true,
            dismissProgress: true,
          ),
          exceptionParameters: const NetworkExceptionModel(
              dismissProgress: true, showError: true));

      return response;
    } catch (error) {
      rethrow;
    }
  }
  Future<Response>getAllCartItems({bool? showLoading})async{
    try {
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode:ApiCodes.GET_CART_ITEMS,
            networkType: NetworkRequestEnum.put,
            data: {
              "Lang": AppLocalization.isArabic?2:1,
              "UserId": AppData.USER_ID,
              "UserRole":AppData.USER_ROLE,
              "NonLoggingUserId":DeviceInfoDetails().deviceId
            },
            showProgress: showLoading??true,
            dismissProgress: showLoading??true,
          ),
          exceptionParameters:  NetworkExceptionModel(
              dismissProgress: showLoading??true, showError: true));

      return response;
    } catch (error) {
      rethrow;
    }
  }
  Future<Response>editeCartItem({required int count,required String id})async{
    try {
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode:ApiCodes.EDITE_CART_ITEM,
            networkType: NetworkRequestEnum.put,
            data: {
              "Lang": AppLocalization.isArabic?2:1,
              "Id": id,
              "Count":count,
              "NonLoggingUserId":DeviceInfoDetails().deviceId
            },
            showProgress: true,
            dismissProgress: true,
          ),
          exceptionParameters: const NetworkExceptionModel(
              dismissProgress: true, showError: true));

      return response;
    } catch (error) {
      rethrow;
    }
  }
  Future<Response>deleteCartItem({required String modelId,required String id})async{
    try {
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode:ApiCodes.DELETE_CART_ITEM,
            networkType: NetworkRequestEnum.put,
            data: {
              "Model": {
                "ID": id,
                "UserId": AppData.USER_ID,
                "ModelId": modelId,
              },
              "NonLoggingUserId":DeviceInfoDetails().deviceId,
              "Lang": AppLocalization.isArabic?2:1
            },
            showProgress: true,
            dismissProgress: true,
          ),
          exceptionParameters: const NetworkExceptionModel(
              dismissProgress: true, showError: true));

      return response;
    } catch (error) {
      rethrow;
    }
  }

  Future<Response>setOrder({required String totalAfterDiscount,required String governmentId,required String addressName,required bool isPayCOnDel,required String promocodeId})async{
    try {
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode:ApiCodes.SET_ORDER,
            networkType: NetworkRequestEnum.put,
            data: {
              "Lang": AppLocalization.isArabic?2:1,
              "AddressName": addressName,
              "GovernmentId": governmentId,
              "TotalAfterDiscount": totalAfterDiscount,
              "UserId": AppData.USER_ID,
              "UserRole":AppData.USER_ROLE,
              "PromocodeId":promocodeId,
              "isPayCOnDel":isPayCOnDel
            },
            showProgress: true,
            dismissProgress: true,
          ),
          exceptionParameters: const NetworkExceptionModel(
              dismissProgress: true, showError: true));

      return response;
    } catch (error) {
      rethrow;
    }
  }
  Future<Response>getAllGovernorates()async{
    try {
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode:ApiCodes.GET_ALL_GOVERNATES,
            networkType: NetworkRequestEnum.put,
            data: {
              "Lang": AppLocalization.isArabic?2:1,
            },
            showProgress: true,
            dismissProgress: true,
          ),

          exceptionParameters: const NetworkExceptionModel(
              dismissProgress: true, showError: true));

      return response;
    } catch (error) {
      rethrow;
    }
  }
  Future<Response>applyPromoCode({required String promoCode,required String totalPriceBeforeDiscount})async{
    try {
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode:ApiCodes.APPLY_PROMOCODE,
            networkType: NetworkRequestEnum.put,
            data: {
              "Lang": AppLocalization.isArabic?2:1,
              "totalBeforeDiscount": totalPriceBeforeDiscount,
              "promocode": promoCode,
              "UserId": AppData.USER_ID,
              "UserRole":AppData.USER_ROLE,
            },
            showProgress: true,
            dismissProgress: true,
          ),
          exceptionParameters: const NetworkExceptionModel(
              dismissProgress: true, showError: true));

      return response;
    } catch (error) {
      rethrow;
    }
  }
  Future<Response>checkIfPromoIsEnable()async{
    try {
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode:ApiCodes.CHECK_IS_PROMOCODE_ENABLE,
            networkType: NetworkRequestEnum.put,
            data: {
              "extinfo": FacebookAnalyticsHelper.getInstance().values
            },
            showProgress: false,
            dismissProgress: false,
          ),
          exceptionParameters:  NetworkExceptionModel(dismissProgress: false, showError: false));

      return response;
    } catch (error) {
      rethrow;
    }
  }

}