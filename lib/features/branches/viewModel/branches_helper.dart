import 'dart:convert';
import 'dart:io';

import 'package:bino_kids/common/widgets/custom_snakbar.dart';
import 'package:bino_kids/features/branches/model/braches_model.dart';
import 'package:bino_kids/features/branches/repository/branches_repository.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

mixin BranchesHelper{
  Future<List<Branch>?> getBranches()async{
    var response=await BranchesRepository().getBranches();
    List<Branch> branches=branchesModelFromJson(jsonEncode(response.data)).data.branches;
    return branches;
  }
  void launchMapsUrl(String link) async {
    //final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$long';
    if (await canLaunch(link)) {
      await launch(link);
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
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {

    }
  }
   openWhatsapp(String num) async{
    String whatsapp ="2"+num;
    final String _url_andoid = "https://wa.me/$whatsapp?text=${Uri.encodeFull("")}";
    String whatappURL_ios ="https://wa.me/$whatsapp?text=${Uri.parse("")}";
    if(Platform.isIOS){
      if( await canLaunchUrl(Uri.parse(whatappURL_ios)) ){
        launchUrl(whatappURL_ios);
      }else{
        CustomSnakbar().appSnackBar(isFaild: true,text: "الرجاء تنزيل whatsapp لتتمكن من التواصل معنا");
      }
    }else{
      // android , web
      if( await canLaunchUrl(Uri.parse(_url_andoid)) ){
        launchUrl(_url_andoid);
      }else{
        CustomSnakbar().appSnackBar(isFaild: true,text: "الرجاء تنزيل whatsapp لتتمكن من التواصل معنا");
      }
    }
  }

}