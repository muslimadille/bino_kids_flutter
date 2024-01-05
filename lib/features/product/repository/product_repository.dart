import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/helpers/network/network_request.dart';
import 'package:bino_kids/common/models/network_exception_model.dart';
import 'package:bino_kids/common/models/network_request_model.dart';
import 'package:bino_kids/common/utils/constants/api_codes.dart';
import 'package:bino_kids/common/utils/eums/network_request_enum.dart';
import 'package:dio/dio.dart';

class ProductRepository{
  Future<Response> getProductsWithFilter(
  {
    List<int>?modelAge,
    List<int>?gender,
    List<int>?description,
    List<int>?material,
    List<int>?season,
    List<int>?price,
    int? moduleId,
    int?modelTypeID,
    int?lang,
    int?userId,
    int?userRole,
    int?pageIndex,
    int?pageSize
  }
      ) async {
    try {
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode: ApiCodes.GET_PRODUCTS_WITH_FILTERS,
            networkType: NetworkRequestEnum.put,
            data: {
              "ModelAge": modelAge,
              "Gender": gender,
              "Description": description,
              "Material":material,
              "Season":season ,
              "Price": price,
              "moduleId": moduleId,
              "ModelTypeID": modelTypeID,
              "lang": AppLocalization.isArabic?2:1,
              "UserId": 16314,
              "userRole": 2,
              "pageIndex": pageIndex??0,
              "pageSize": 50,
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

  Future<Response> getModelDetails({required String modelId}) async {
    try {
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode: ApiCodes.GET_MODEL_DETAILS,
            networkType: NetworkRequestEnum.put,
            data: {
              "UserId":16314,
              "ModelId": modelId,
              "UserRole": 2,
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
              "UserId": 16314,
              "UserRole": 2,
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


}