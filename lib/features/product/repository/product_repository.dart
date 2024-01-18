import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/helpers/network/network_request.dart';
import 'package:bino_kids/common/models/network_exception_model.dart';
import 'package:bino_kids/common/models/network_request_model.dart';
import 'package:bino_kids/common/utils/constants/api_codes.dart';
import 'package:bino_kids/common/utils/constants/app_data.dart';
import 'package:bino_kids/common/utils/eums/network_request_enum.dart';
import 'package:dio/dio.dart';

class ProductRepository{
  Future<Response> getProductsWithFilter(
  {
    int? moduleId,
    int?modelTypeID,
    int?lang,
    int?userId,
    int?userRole,
    int?pageIndex,
    int?pageSize,
    Map<String, List<int>>? selectedFilters
  }
      ) async {
    try {
      Map<String,dynamic>data={
        "moduleId": moduleId,
        "ModelTypeID": modelTypeID,
        "lang": AppLocalization.isArabic?2:1,
        "UserId": AppData.USER_ID,
        "userRole": AppData.USER_ROLE,
        "pageIndex": pageIndex??0,
        "pageSize": 100,
      };
      if((selectedFilters?? {}).isNotEmpty){
        selectedFilters!.forEach((key, value) {
          if(value.isNotEmpty){
            data[key]=value;
          }
        });
      }
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode: ApiCodes.GET_PRODUCTS_WITH_FILTERS,
            networkType: NetworkRequestEnum.put,
            data: data,
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

  Future<Response> getModelDetails({required String modelId}) async {
    try {
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode: ApiCodes.GET_MODEL_DETAILS,
            networkType: NetworkRequestEnum.put,
            data: {
              "UserId":AppData.USER_ID,
              "ModelId": modelId,
              "UserRole": AppData.USER_ROLE,
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


  Future<Response> getWishList() async {
    try {
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode: ApiCodes.GET_WISH_LIST,
            networkType: NetworkRequestEnum.put,
            data: {
              "UserId": AppData.USER_ID,
              "UserRole": AppData.USER_ROLE,
              "Lang": AppLocalization.isArabic ?2:1,
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
  Future<Response> changeFavourite({
    required num modelId,
    required num colorId,
    required num sizeId,
}) async {
    try {
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode: ApiCodes.CHAGE_FAVOUTITE,
            networkType: NetworkRequestEnum.put,
            data: {
              "userId": int.parse(AppData.USER_ID),
              "colorId":colorId,
              //"sizeId":sizeId,
              "modelId":modelId
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
  Future<Response> deleteAllWishList() async {
    try {
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode: ApiCodes.DELETE_ALL_WISH_LIST,
            networkType: NetworkRequestEnum.put,
            data: {
              "UserId": AppData.USER_ID,
              "Lang": AppLocalization.isArabic ?2:1,
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
  Future<Response> addAllWishListToCart() async {
    try {
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode: ApiCodes.ADD_ALL_WISH_LIST_TO_CART,
            networkType: NetworkRequestEnum.put,
            data: {
              "UserId": AppData.USER_ID,
              "Lang": AppLocalization.isArabic ?2:1,
              "UserRole":AppData.USER_ROLE
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
  Future<Response> deleteWishListItem(String id) async {
    try {
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode: ApiCodes.DELETE_WISH_LIST_ITEM,
            networkType: NetworkRequestEnum.put,
            data: {
              "UserId": AppData.USER_ID,
              "Lang": AppLocalization.isArabic ?2:1,
              "WishListId":id
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