import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/helpers/network/network_request.dart';
import 'package:bino_kids/common/models/network_exception_model.dart';
import 'package:bino_kids/common/models/network_request_model.dart';
import 'package:bino_kids/common/utils/constants/app_data.dart';
import 'package:bino_kids/common/utils/eums/network_request_enum.dart';
import 'package:dio/dio.dart';

import '../../../common/utils/constants/api_codes.dart';

class OrderRepository{

  Future<Response> getOrders() async {
    try {
      final response = await NetworkRequest().sendAppRequest(
          networkParameters: NetworkRequestModel(
            apiCode: ApiCodes.GET_OREDERS,
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

}
