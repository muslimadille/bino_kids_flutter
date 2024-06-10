import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/helpers/device_info_details.dart';
import 'package:bino_kids/common/helpers/network/network_request.dart';
import 'package:bino_kids/common/models/network_exception_model.dart';
import 'package:bino_kids/common/models/network_request_model.dart';
import 'package:bino_kids/common/utils/constants/api_codes.dart';
import 'package:bino_kids/common/utils/eums/network_request_enum.dart';
import 'package:dio/dio.dart';

import '../../../common/utils/constants/app_data.dart';

class AuthRepository{
  Future<Response> login({required String mobileNumber,required String password,String? socailId}) async {
    try {
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode: ApiCodes.LOGIN_API,
            data: {
              "mobileNumber":mobileNumber/*"01111226508"*/,
              "password":socailId!=null?null:password/*"01111226508"*/,
              "lang":AppLocalization.isArabic?2:1,
              "grant_type":"password",
              "External":socailId!=null,
              "nonloggingId":DeviceInfoDetails().deviceId,
              "SocailId":socailId
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
  Future<Response> register(Map<String,dynamic>data) async {
    try {
      data["nonloggingId"]=DeviceInfoDetails().deviceId;
    final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode: ApiCodes.REGISTER,
            data: data,
            header: {
              "Content-Type": "application/x-www-form-urlencoded",
            },
            networkType: NetworkRequestEnum.put,
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
  Future<Response>verifyUser(String code)async{
    try {
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode:ApiCodes.VERIFY_USER_API,
            networkType: NetworkRequestEnum.put,
            data: {
              "code":code,
              "UserId": AppData.USER_ID,
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
  Future<Response>isUserVerified()async{
    try {
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode:ApiCodes.IS_USER_VERIFIED_API,
            networkType: NetworkRequestEnum.put,
            data: {
              "UserId": AppData.USER_ID,
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
  Future<Response>resendVerifyCode()async{
    try {
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode:ApiCodes.RESEND_VERIFICATION_CODE,
            networkType: NetworkRequestEnum.put,
            data: {
              "UserId": AppData.USER_ID,
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
  Future<Response>forgetPassword({required String mobile})async{
    try {
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode:ApiCodes.RESET_PASSWORD,
            networkType: NetworkRequestEnum.put,
            data: {
              "phone": mobile,
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

  Future<Response>changePassword({required String oldPassword,required String newPassword,})async{
    try {
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode:ApiCodes.CHANGE_PASSWORD,
            networkType: NetworkRequestEnum.put,
            data: {
              "oldPassword": oldPassword,
              "newPassword": newPassword,
              "userId": AppData.USER_ID,
              "lang": AppLocalization.isArabic?2:1
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
  Future<Response> checkThirdPartyLogin({required String email,required String socailId}) async {
    try {
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode: ApiCodes.CHECK_THIRD_PARRTY,
            data:
            {
              "lang":AppLocalization.isArabic?2:1,
              "Email": email,
              "SocialId": socailId
            },
            header: {
              "Content-Type": "application/x-www-form-urlencoded",
            },
            networkType: NetworkRequestEnum.put,
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
  Future<Response>socialRegister({required String socialId,required String email,required String name,required String phone})async{
    try {
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode:ApiCodes.SOCIAL_REGISTER,
            networkType: NetworkRequestEnum.put,
            data: {
              "lang":AppLocalization.isArabic?2:1,
              "Email":email,
              "UserName": name,
              "SocailId":socialId,
              "nonloggingId":DeviceInfoDetails().deviceId,
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