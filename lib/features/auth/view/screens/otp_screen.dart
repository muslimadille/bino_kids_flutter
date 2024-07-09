
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
  void initState() {
    onInit();
    resendVerifyCode();
    super.initState();
  }

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
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.w),
            height: 5.h,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(5),
                border: Border.fromBorderSide(
                    BorderSide(
                        width:1,
                        color:Colors.grey
                    )
                )
            ),
            padding: EdgeInsets.symmetric(horizontal:2.w),
            child: Row(children: [
              Expanded(child: TextFormField(
                controller:passwordCotroller ,
                maxLength: 8,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: AppFontSize.x_medium,
                  fontWeight: FontWeight.w400,
                ),
                onTapOutside: (value){
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder:InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                  counter: SizedBox(),
                  isDense:true,
                ),
                keyboardType: TextInputType.number ,
                cursorColor: Colors.black,
                onChanged: (value){
                  code=value;

                },
                validator:(value){

                },
              )),
            ],
            ),
          ),

          SizedBox(height: 2.h,),
          Text(tr("otp_dont_receive_hint"),textAlign: TextAlign.center,style: TextStyle(fontSize: AppFontSize.medium,fontWeight: FontWeight.w800),),
          SizedBox(height: 2.h,),
          InkWell(
            onTap: (){
              resendVerifyCode();
            },
              child: Text(tr("re_send"),textAlign: TextAlign.center,style: TextStyle(color:Colors.red,fontSize: AppFontSize.x_small,fontWeight: FontWeight.w800),)),

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
                if(code.length>3){
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
