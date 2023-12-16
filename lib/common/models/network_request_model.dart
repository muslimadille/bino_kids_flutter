import 'package:bino_kids/common/utils/eums/network_request_enum.dart';

class NetworkRequestModel {
  final String apiCode;
  final Map<String, dynamic>? queryParameters;
  final data;
  final NetworkRequestEnum? networkType;
  Map<String,String>? header;
  final bool? showProgress;
  final bool? dismissProgress;
  final bool? rethrowError;

  NetworkRequestModel(
      {
        required this.apiCode,
        this.queryParameters,
        this.data,
        this.networkType,
        this.header,
        this.showProgress,
        this.dismissProgress,
        this.rethrowError
      });
}