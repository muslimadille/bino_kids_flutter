import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/helpers/network/network_request.dart';
import 'package:bino_kids/common/models/network_exception_model.dart';
import 'package:bino_kids/common/models/network_request_model.dart';
import 'package:bino_kids/common/utils/constants/api_codes.dart';
import 'package:bino_kids/common/utils/constants/app_data.dart';
import 'package:bino_kids/common/utils/eums/network_request_enum.dart';
import 'package:dio/dio.dart';


class SearchRepository{
  Future<Response> getSearch({required String searchWord}) async {
    try {
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode: ApiCodes.GET_SEARCH,
            networkType: NetworkRequestEnum.put,
            queryParameters: {
              "SearchWord": searchWord,
              "Lang": AppLocalization.isArabic ?2:1,
              "isComapnyUser":AppData.USER_ROLE!="2"
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