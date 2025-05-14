import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:bino_kids/features/branches/model/braches_model.dart';
import 'package:bino_kids/features/branches/viewModel/branches_helper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class BranchesItemWidget extends StatelessWidget with BranchesHelper {
  final Branch branch;
  const BranchesItemWidget({
    required this.branch,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2.w),
      width: double.infinity,
      decoration:  BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 4,
              spreadRadius: 2,
            )
          ]
      ),
      child: Column(children: [
        Container(
          height: 30.h,
            width: double.infinity,
            decoration:  BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topRight:Radius.circular(8),topLeft:Radius.circular(8)),
            image: DecorationImage(fit: BoxFit.cover,image: NetworkImage("https://www.binokids.com/binoModel//BranchImage/7004a730-452e-4a79-a37b-887fd8205453.jpeg"))
        ),
          child: PageView(
            children: List.generate(branch.bannerImageList.length, (index){
              return Container(
                height: 30.h,
                width: double.infinity,
                decoration:  BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topRight:Radius.circular(8),topLeft:Radius.circular(8)),
                    image: DecorationImage(fit: BoxFit.cover,
                        image: NetworkImage(branch.bannerImageList[index]))
                ),
              );
            }),
          ),
        ),
        Padding(padding: EdgeInsets.symmetric(horizontal:2.w,vertical: 1.h),
          child: Column(children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.align_horizontal_left_sharp,color: Colors.black,size:5.w,),
                SizedBox(width: 2.w,),
                Expanded(child: Text(branch.name??'',style: TextStyle(color: Colors.black,fontSize: AppFontSize.x_small,fontWeight: FontWeight.w400),)),
              ],),
            Container(
              margin: EdgeInsets.symmetric(vertical: 1.h),
              width:double.infinity,height: 1,color: Colors.grey[200],),

            InkWell(
              onTap: (){
                openWhatsapp(branch.whatsAppNumbers.first);
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/whatsapp.png",width:5.w,height: 5.w,),
                  SizedBox(width: 2.w,),
                  Expanded(child: Text(branch.whatsAppNumbers.first??'',style: TextStyle(color: Colors.black,fontSize: AppFontSize.x_small,fontWeight: FontWeight.w400),)),
                ],),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 1.h),
              width:double.infinity,height: 1,color: Colors.grey[200],),

            InkWell(
              onTap: (){
                callPhone(branch.telephoneNumbers.first);
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.phone_android,color: Colors.black,size:5.w,),
                  SizedBox(width: 2.w,),
                  Expanded(child: Text(branch.telephoneNumbers[0]??'',style: TextStyle(color: Colors.black,fontSize: AppFontSize.x_small,fontWeight: FontWeight.w400),)),
                ],),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 1.h),
              width:double.infinity,height: 1,color: Colors.grey[200],),


            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.date_range,color: Colors.black,size:5.w,),
                SizedBox(width: 2.w,),
                Expanded(child: Text((branch.timesOfWork??""),style: TextStyle(color: Colors.black,fontSize: AppFontSize.x_small,fontWeight: FontWeight.w400),)),
              ],),
            Container(
              margin: EdgeInsets.symmetric(vertical: 1.h),
              width:double.infinity,height: 1,color: Colors.grey[200],),

            InkWell(
              onTap: (){
                launchMapsUrl(branch.branchLink??"");
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.location_on,color: Colors.black,size:5.w,),
                  SizedBox(width: 2.w,),
                  Expanded(child: Text((branch.address??"").toString(),style: TextStyle(color: Colors.black,fontSize: AppFontSize.x_small,fontWeight: FontWeight.w400),)),
                ],),
            ),

          ],)
          ,),

      ],),);
  }
}
