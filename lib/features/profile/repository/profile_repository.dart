import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/helpers/network/network_request.dart';
import 'package:bino_kids/common/models/network_exception_model.dart';
import 'package:bino_kids/common/models/network_request_model.dart';
import 'package:bino_kids/common/utils/constants/api_codes.dart';
import 'package:bino_kids/common/utils/eums/network_request_enum.dart';
import 'package:dio/dio.dart';

import '../../../common/utils/constants/app_data.dart';

class ProfileRepository{
  Future<Response>getAllAddresses()async{
    try {
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode:ApiCodes.GET_ALL_ADDERESSES,
            networkType: NetworkRequestEnum.put,
            data: {
              "UserId": AppData.USER_ID,
              "Lang": AppLocalization.isArabic?2:1
            },
            showProgress: false,
            dismissProgress: false,
          ),
          exceptionParameters: const NetworkExceptionModel(
              dismissProgress: false, showError: true));

      return response;
    } catch (error) {
      rethrow;
    }
  }
  Future<Response>getAboutUs()async{
    try {
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode:ApiCodes.GET_ABOUT_US,
            networkType: NetworkRequestEnum.put,
            queryParameters: {
              "Lang": AppLocalization.isArabic?2:1
            },
            showProgress: false,
            dismissProgress: false,
          ),
          exceptionParameters: const NetworkExceptionModel(
              dismissProgress: false, showError: true));

      return response;
    } catch (error) {
      rethrow;
    }
  }
  Future<Response>getPrivacyPolicy()async{
    try {
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode:ApiCodes.GET_PRIVACY_POLICY,
            networkType: NetworkRequestEnum.put,
            queryParameters: {
              "Lang": AppLocalization.isArabic?2:1
            },
            showProgress: false,
            dismissProgress: false,
          ),
          exceptionParameters: const NetworkExceptionModel(
              dismissProgress: false, showError: true));

      return response;
    } catch (error) {
      rethrow;
    }
  }
  Future<Response>getExchangePolicy()async{
    try {
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode:ApiCodes.GET_RETURN_AND_EXCHANGE_POLICY,
            networkType: NetworkRequestEnum.put,
            queryParameters: {
              "Lang": AppLocalization.isArabic?2:1
            },
            showProgress: false,
            dismissProgress: false,
          ),
          exceptionParameters: const NetworkExceptionModel(
              dismissProgress: false, showError: true));

      return response;
    } catch (error) {
      rethrow;
    }
  }
  Future<Response>getShippingPolicy()async{
    try {
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode:ApiCodes.GET_RETURN_SHIPPING_POLICY,
            networkType: NetworkRequestEnum.put,
            queryParameters: {
              "Lang": AppLocalization.isArabic?2:1
            },
            showProgress: false,
            dismissProgress: false,
          ),
          exceptionParameters: const NetworkExceptionModel(
              dismissProgress: false, showError: true));

      return response;
    } catch (error) {
      rethrow;
    }
  }
}