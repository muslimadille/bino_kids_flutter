import 'dart:convert';
import 'dart:io';

import 'package:bino_kids/common/widgets/custom_snakbar.dart';
import 'package:bino_kids/features/branches/model/braches_model.dart';
import 'package:bino_kids/features/branches/repository/branches_repository.dart';
import 'package:url_launcher/url_launcher.dart';

mixin BranchesHelper{
  Future<List<Branch>?> getBranches()async{
    var response=await BranchesRepository().getBranches();
    List<Branch> branches=branchesModelFromJson(jsonEncode(response.data)).data.branches;
    return branches;
  }
  void launchMapsUrl(double lat, double long) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$long';
    if (await canLaunch(url)) {
      await launch(url);
    } else {

    }
  }
  callPhone(String phone)async{
    final Uri phoneCallUri = Uri(scheme: 'tel', path:phone);
    if (await canLaunch(phoneCallUri.toString())) {
      await launch(phoneCallUri.toString());
    } else {
      throw 'Could not launch phone call';
    }
  }
  void launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {

    }
  }
   openWhatsapp(String num) async{
    var whatsapp =num;
    var whatsappURl_android = "https://wa.me/$whatsapp?text= ";
    var whatappURL_ios ="https://wa.me/$whatsapp?text=";
    if(Platform.isIOS){
      if( await canLaunch(whatappURL_ios)){
        await launch(whatappURL_ios, forceSafariVC: false);
      }else{
        CustomSnakbar().appSnackBar(isFaild: true,text: "الرجاء تنزيل whatsapp لتتمكن من التواصل معنا");
      }
    }else{
      // android , web
      if( await canLaunch(whatsappURl_android)){
        await launch(whatsappURl_android);
      }else{
        CustomSnakbar().appSnackBar(isFaild: true,text: "الرجاء تنزيل whatsapp لتتمكن من التواصل معنا");
      }
    }
  }

}