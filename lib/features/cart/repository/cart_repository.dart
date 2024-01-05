import 'dart:convert';
import 'dart:io';

import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/helpers/network/network_request.dart';
import 'package:bino_kids/common/models/network_exception_model.dart';
import 'package:bino_kids/common/models/network_request_model.dart';
import 'package:bino_kids/common/utils/constants/api_codes.dart';
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
              "UserId": 16314,
              "UserRole": 2,
              "ColorId": colorId,
              "sizeId": sizeId,
              "ID": id,
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
  Future<Response>getAllCartItems()async{
    try {
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode:ApiCodes.GET_CART_ITEMS,
            networkType: NetworkRequestEnum.put,
            data: {
              "Lang": AppLocalization.isArabic?2:1,
              "UserId": 16314,
              "UserRole": 2,
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
  Future<Response>editeCartItem({required int count,required String id})async{
    try {
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode:ApiCodes.EDITE_CART_ITEM,
            networkType: NetworkRequestEnum.put,
            data: {
              "Lang": AppLocalization.isArabic?2:1,
              "Id": id,
              "Count":count
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
                "UserId": 16314,
                "ModelId": modelId,
              },
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

  Future<Response>setOrder({required String totalAfterDiscount,required String governmentId,required String addressName})async{
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
              "UserId": 16314,
              "UserRole": 2,
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

}