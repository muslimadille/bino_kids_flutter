import 'dart:convert';

import 'package:dio/dio.dart';

class ConfigHelper {

  Future<bool> getReviewStatus() async {
    try {
      final Response response = await Dio().request(
        "https://binokidsapp-default-rtdb.firebaseio.com/review_mode.json",
        options: Options(
            sendTimeout: Duration(seconds: 120),
            receiveTimeout: Duration(seconds: 120),
            method: 'GET'),
      );
      bool value=(jsonDecode(response.data) as bool)??false;
      return value;

    } catch (e) {
      return false;
    }
  }
}