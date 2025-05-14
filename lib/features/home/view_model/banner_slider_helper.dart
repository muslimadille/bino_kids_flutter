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
  int currentPage=0;
  List<BannerDataModel> banners=[];
  onInit()async{
    controller=PageController();
  }

  autoSlide(int size){
    Timer timer= Timer.periodic(Duration(seconds: 4), (Timer timer) {
      if (currentPage < size) {
        currentPage++;
      } else {
        currentPage = 0;
      }

        controller.animateToPage(
          currentPage,
          duration: Duration(milliseconds: 1500),
          curve: Curves.easeInOutCubic,
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
      autoSlide(bannerModel.data.length-1);
      return bannerModel;
    } on DioException catch (error){
      return null;
    }
  }
}