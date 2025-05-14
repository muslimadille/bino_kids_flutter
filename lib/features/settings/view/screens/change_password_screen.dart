import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:bino_kids/common/widgets/custom_back_btn.dart';
import 'package:bino_kids/features/auth/view_model/change_password_helper.dart';
import 'package:flutter/Material.dart';
import 'package:sizer/sizer.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> with ChangePasswordHelper{
  bool showOldPassword=false;
  bool showNewPassword=false;
  @override
  void initState() {
    onInit();
    super.initState();
  }
  @override
  void dispose() {
    onDispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: ListView(children:  [
              CustomBackBtn(title: tr("change_password"),),
              SizedBox(height: 3.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal:3.w,vertical: 1.h),
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(tr("old_password"),style: TextStyle(fontSize: AppFontSize.x_small,fontWeight: FontWeight.w500,color: Colors.black),),
                    SizedBox(height:1.h),
                    StatefulBuilder(
                      builder: (context,setInnerState) {
                        return Container(
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
                              controller:newPasswordController ,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: AppFontSize.x_x_small,
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
                                isDense:true,
                              ),
                              keyboardType: TextInputType.text ,
                              cursorColor: Colors.black,
                              obscureText: !showOldPassword,
                              onChanged: (value){

                              },
                              validator:(value){

                              },
                            )),
                            IconButton(onPressed: (){
                              setInnerState((){
                                showOldPassword=!showOldPassword;
                              });
                            }, icon: Icon(Icons.remove_red_eye_outlined,color: Colors.grey,),)
                          ],
                          ),
                        );
                      }
                    ),
                    SizedBox(height:1.h),
                    Text(tr("new_password"),style: TextStyle(fontSize: AppFontSize.x_small,fontWeight: FontWeight.w500,color: Colors.black),),
                    SizedBox(height:1.h),
                    StatefulBuilder(
                      builder: (context,setInnerState) {
                        return Container(
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
                              controller:oldPasswordController ,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: AppFontSize.x_x_small,
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
                                isDense:true,
                              ),
                              keyboardType: TextInputType.text ,
                              cursorColor: Colors.black,
                              obscureText: !showNewPassword,
                              onChanged: (value){

                              },
                              validator:(value){

                              },
                            )),
                            IconButton(onPressed: (){
                              setInnerState((){
                                showNewPassword=!showNewPassword;
                              });
                            }, icon: Icon(Icons.remove_red_eye_outlined,color: Colors.grey,),)
                          ],
                          ),
                        );
                      }
                    ),
                    SizedBox(height:1.h),

                  ],),),
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
                    await changePassword();
                  },
                  child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        tr("change"),
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
          ),
          SizedBox(height: 5.h,),

        ],
      ),);
  }

}
