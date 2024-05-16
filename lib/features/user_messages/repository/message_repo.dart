import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/helpers/facebook_analytics_helper.dart';
import 'package:bino_kids/common/helpers/network/network_request.dart';
import 'package:bino_kids/common/models/network_exception_model.dart';
import 'package:bino_kids/common/models/network_request_model.dart';
import 'package:bino_kids/common/utils/constants/api_codes.dart';
import 'package:bino_kids/common/utils/constants/app_data.dart';
import 'package:bino_kids/common/utils/eums/network_request_enum.dart';
import 'package:dio/dio.dart';

class MessagesRepo{
Future<Response> getAllMessages() async {
  try {
    final response = await NetworkRequest().sendAppRequest(
        networkParameters: NetworkRequestModel(
          apiCode: ApiCodes.MESSAGES,
          networkType: NetworkRequestEnum.put,
          data: {
            "UserId": AppData.USER_ID,
            "Lang": AppLocalization.isArabic ?2:1,
            "UserRole":AppData.USER_ROLE,
            "extinfo": FacebookAnalyticsHelper.getInstance().values
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