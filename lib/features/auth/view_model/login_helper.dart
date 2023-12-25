import 'package:dio/dio.dart';

import '../repository/auth_repository.dart';

mixin LoginHelper{
  login()async{
    try{
      final response=await AuthRepository().login(mobileNumber: "",password: "");

    } on DioException catch (error){}
  }
}