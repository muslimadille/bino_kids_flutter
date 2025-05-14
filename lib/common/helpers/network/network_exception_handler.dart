import 'dart:convert';
import 'package:bino_kids/common/helpers/network/response_exception.dart';
import 'package:bino_kids/common/models/network_exception_model.dart';
import 'package:dio/dio.dart';

import '../app_localization.dart';

mixin NetworkExceptionHandler {

  String? dioErrorHandler({required DioException dioError,required NetworkExceptionModel exceptionModel}) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        return "Request to API server was cancelled";
      case DioExceptionType.connectionTimeout:
        return null;
      case DioExceptionType.receiveTimeout:
        return null;
      case DioExceptionType.sendTimeout:
        return null;
      case DioExceptionType.badResponse:
        return _handleStatusCodeError(
          dioError.response?.statusCode??0,
          dioError,
        );
      case DioExceptionType.unknown:
        if (dioError.message.toString().contains("SocketException")) {
          return tr("NO_INTERNET");
        }
        return null;
      default:
        return null;
    }
  }

  String? _handleStatusCodeError(int statusCode, DioException responseError) {
    try{
      ResponseException error=responseError.response?.data is String
          ?responseExceptionFromJson(responseError.response!.data.toString().isNotEmpty?responseError.response?.data:"{}")
          :responseExceptionFromJson(jsonEncode(responseError.response?.data??{}));
      if(error.data.errorCode.isNotEmpty){
        return _handleBusinessCodeError(error);
      }else if(error.data.message.isNotEmpty){
        return error.data.message;
      } else {
        return _statusCodeErrors(statusCode);
      }
    }catch (error){
      return _statusCodeErrors(statusCode);
    }
  }

  String? _statusCodeErrors(int statusCode){
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return null;
      case 403:
        return 'Forbidden';
      case 404:
        return 'Not found';
      case 500:
        return 'Internal server error';
      case 502:
        return 'Bad gateway';
      default:
        return 'unknown_error';
    }
  }

  String? _handleBusinessCodeError(ResponseException exception){

  }

}