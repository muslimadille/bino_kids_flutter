import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/helpers/network/network_request.dart';
import 'package:bino_kids/common/models/network_exception_model.dart';
import 'package:bino_kids/common/models/network_request_model.dart';
import 'package:bino_kids/common/utils/constants/api_codes.dart';
import 'package:bino_kids/common/utils/eums/network_request_enum.dart';
import 'package:dio/dio.dart';

class ProfileRepository{
  Future<Response>getAllAddresses()async{
    try {
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode:ApiCodes.GET_ALL_ADDERESSES,
            networkType: NetworkRequestEnum.put,
            data: {
              "UserId": 16314,
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