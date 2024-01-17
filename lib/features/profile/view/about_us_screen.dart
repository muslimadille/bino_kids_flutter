
import 'package:bino_kids/common/widgets/custom_back_btn.dart';
import 'package:bino_kids/features/profile/model/privacy_model.dart';
import 'package:bino_kids/features/profile/view_model/policy_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:sizer/sizer.dart';

class AboutUsScreen extends StatelessWidget with PolicyHelper  {
  const AboutUsScreen({
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            width: double.infinity,
            padding:  EdgeInsets.symmetric(horizontal: 4.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomBackBtn(title:"About us" ,),
                Expanded(
                  child: FutureBuilder<PrivacyModel?>(
                      future: getAboutUs(),
                      builder: (context,snapshot) {
                        if(snapshot.hasData){
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical:2.h),
                            child: RawScrollbar(
                              thumbColor: Colors.black,
                              radius: const Radius.circular(20),
                              thickness:2.w,
                              thumbVisibility: true,
                              child:SingleChildScrollView(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                                    child: Html(
                                      data: snapshot.data!.data??'',
                                    ),
                                  )
                              ),
                            ),
                          );
                        }else if(snapshot.hasError){
                          return SizedBox();
                        }else{
                          return const
                          SizedBox();
                        }
                      }
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
