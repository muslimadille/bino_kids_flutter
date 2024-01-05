import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/helpers/network/network_request.dart';
import 'package:bino_kids/common/models/network_exception_model.dart';
import 'package:bino_kids/common/models/network_request_model.dart';
import 'package:bino_kids/common/utils/constants/api_codes.dart';
import 'package:bino_kids/common/utils/eums/network_request_enum.dart';
import 'package:dio/dio.dart';

class AuthRepository{
  Future<Response> login({required String mobileNumber,required String password}) async {
    try {
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode: ApiCodes.LOGIN_API,
            data: {
              "mobileNumber":"01111226508",
              "password":"01111226508",
              "lang":AppLocalization.isArabic?2:1,
              "grant_type":"password",
              "External":true,
              //"SocailId":""
            },
            header: {
              "Content-Type": "application/x-www-form-urlencoded",
            },
            networkType: NetworkRequestEnum.get,
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