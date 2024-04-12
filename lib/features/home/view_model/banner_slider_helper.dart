import 'dart:async';
import 'dart:convert';

import 'package:bino_kids/common/helpers/cash_helper.dart';
import 'package:bino_kids/common/helpers/local_storage.dart';
import 'package:bino_kids/features/home/model/banner_model.dart';
import 'package:bino_kids/features/home/repository/home_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../common/utils/constants/api_codes.dart';

mixin BannerSliderHelper{
  late final PageController controller ;
  //late  timer;
  int _currentPage=0;
  List<BannerDataModel> banners=[];
  onInit()async{
    controller=PageController();
  }

  autoSlide(int size){
    Timer timer= Timer.periodic(Duration(seconds: 4), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

        controller.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );


    });
  }

  onDispose(){
    //timer.cancel();
    controller.dispose();
  }
  Future <BannerModel?>getBanner()async{
    try{
      if(CashHelper.bannerModel!=null){
        return CashHelper.bannerModel;
      }
      final response=await HomeRepository().getBanner();

      BannerModel bannerModel=bannerModelFromJson(jsonEncode(response.data));
      CashHelper.bannerModel=bannerModel;
      autoSlide(bannerModel.data.length);
      return bannerModel;
    } on DioException catch (error){
      return null;
    }
  }
}