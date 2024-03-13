
import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:bino_kids/common/widgets/custom_back_btn.dart';
import 'package:bino_kids/features/auth/view_model/login_helper.dart';
import 'package:flutter/Material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';


class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> with LoginHelper {
  bool showCounter=true;
  String code="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:SafeArea(
        child: Column(children:  [
          CustomBackBtn(title: tr("active_account"),),
          SizedBox(height: 15.h,),
          Text(tr("otp_title_hint"),textAlign: TextAlign.center,style: TextStyle(fontSize: AppFontSize.medium,fontWeight: FontWeight.w800),),
          SizedBox(height: 2.h,),
          OtpTextField(
            autoFocus: true,
            numberOfFields: 4,
            cursorColor:Colors.black,
            borderColor: Colors.black,
            enabledBorderColor:Colors.black,
            focusedBorderColor:Colors.black,
            //set to true to show as box or false to show as dash
            showFieldAsBox: true,
            //runs when a code is typed in
            onCodeChanged: (String code) {
              this.code=code;
            },
            //runs when every textfield is filled
            onSubmit: (String verificationCode){
              code=verificationCode;
            }, // end onSubmit
          ),
          Expanded(child: SizedBox()),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 3.w),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor:Colors.black,
                disabledBackgroundColor: Colors.black,
                disabledForegroundColor: Colors.black,
                disabledMouseCursor: SystemMouseCursors.forbidden,
                padding: EdgeInsets.symmetric(vertical:2.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: ()async{
                if(code.length==4){
                  await verifyUser(code);
                }
              },
              child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    tr("submit"),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: AppFontSize.x_x_small,
                        fontWeight: FontWeight.w700
                    ),
                  )
              ),
            ),
          ),
        ],),
      ),);
  }
  _counter(){

  }
}
