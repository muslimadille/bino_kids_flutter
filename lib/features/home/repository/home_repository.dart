import 'dart:convert';

import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/helpers/local_storage.dart';
import 'package:bino_kids/common/helpers/network/network_request.dart';
import 'package:bino_kids/common/models/network_exception_model.dart';
import 'package:bino_kids/common/models/network_request_model.dart';
import 'package:bino_kids/common/utils/constants/api_codes.dart';
import 'package:bino_kids/common/utils/constants/app_data.dart';
import 'package:bino_kids/common/utils/eums/network_request_enum.dart';
import 'package:dio/dio.dart';

class HomeRepository{
  Future<Response> getBanner() async {
    

    try {
      final  response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode: ApiCodes.BANNER_API,
            networkType: NetworkRequestEnum.put,
            queryParameters: {
              "lang":AppLocalization.isArabic?2:1,
              'isComapnyUser':false
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

  Future<Response> getMainCategories() async {
    try {
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode: ApiCodes.MAIN_CATEGORIES_API,
            networkType: NetworkRequestEnum.put,
            queryParameters: {
              "lang":AppLocalization.isArabic?2:1,
              "isComapnyUser":false
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
  getSubCategories({ required int? modelAgeId,required int moduleId})async{
    try {

      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode:ApiCodes.SUB_CATEGORIES_API,
            networkType: NetworkRequestEnum.put,
            queryParameters: {
              "modelAgeId":modelAgeId,
              "isComapnyUser":false,
              "moduleId":moduleId,
              'lang':AppLocalization.isArabic?2:1
            },
            showProgress: false,
            dismissProgress: false,
          ),
          exceptionParameters: const NetworkExceptionModel(
              dismissProgress: true, showError: true));

      return response;
    } catch (error) {
      rethrow;
    }
  }
  getMostWatched()async{
    try {
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode: ApiCodes.GET_MOST_WATCHED,
            networkType: NetworkRequestEnum.put,
            data: {
              "lang": AppLocalization.isArabic?2:1,
              "userRole": 2,
              "pageIndex": 0,
              "pageSize": 150,
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
  getSuggestions()async{
    try {
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode: ApiCodes.GET_SUGGESTIONS,
            networkType: NetworkRequestEnum.put,
            data: {
              "lang": AppLocalization.isArabic?2:1,
              "userId": AppData.USER_ID,///required
              "userRole": AppData.USER_ROLE,
              "pageIndex": 0,
              "pageSize": 150,
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
  getNewArrivals()async{
    try {
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode: ApiCodes.GET_NEW_ARRIVALS,
            networkType: NetworkRequestEnum.put,
            data: {
              "lang": AppLocalization.isArabic?2:1,
              "userRole": 2,
              "pageIndex": 0,
              "pageSize": 5,
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
  getModelTypes({required int moduleId})async{
    try {

      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode:ApiCodes.GET_MODEL_TYPES,
            networkType: NetworkRequestEnum.put,
            data: {
                "moduleId": moduleId,
                "lang": AppLocalization.isArabic?2:1,
                "userRole": 2
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