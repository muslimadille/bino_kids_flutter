import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
import 'package:bino_kids/common/widgets/custom_back_btn.dart';
import 'package:bino_kids/features/auth/provider/login_provider.dart';
import 'package:bino_kids/features/auth/view_model/login_helper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with LoginHelper{


  @override
  void initState() {
    onInit();
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
               CustomBackBtn(),
              Image.asset(
                  "assets/images/app_name_icon.png",
              height: 8.h,
                fit: BoxFit.fitHeight,
              ),
              SizedBox(height: 3.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal:3.w,vertical: 1.h),
                child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(tr("user_name_field_title"),style: TextStyle(fontSize: AppFontSize.x_small,fontWeight: FontWeight.w500,color: Colors.black),),
                  SizedBox(height:1.h),
                  Container(
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
                        controller:emailCotroller ,
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
                        keyboardType: TextInputType.emailAddress ,
                        cursorColor: Colors.black,
                        onChanged: (value){

                        },
                        validator:(value){

                        },
                      )),
                      StatefulBuilder(
                        builder: (context, setIerState) {
                          emailCotroller.addListener(() {
                            showIcone=emailCotroller.text.isNotEmpty;
                            setIerState((){});
                          });
                          return Visibility(
                            visible: showIcone,
                              child: IconButton(onPressed: (){
                                emailCotroller.clear();
                              }, icon: Icon(Icons.cancel,color: Colors.grey,),));
                        }
                      )
                    ],
                    ),
                  ),
                  SizedBox(height:1.h),
                  Text(tr("Password"),style: TextStyle(fontSize: AppFontSize.x_small,fontWeight: FontWeight.w500,color: Colors.black),),
                  SizedBox(height:1.h),
                  Container(
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
                        obscureText: true,
                        onChanged: (value){

                        },
                        validator:(value){

                        },
                      )),
                      IconButton(onPressed: (){
                      }, icon: Icon(Icons.remove_red_eye_outlined,color: Colors.grey,),)
                    ],
                    ),
                  )
              ],),),
              InkWell(
                onTap: (){
                  AppNavigator().push(routeName: AppRoutes.FORGET_PASSWORD_SCREEN_ROUT);
                },
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 3.w),
                    child:Text(tr("forget_password"),style: TextStyle(fontSize: AppFontSize.x_x_small,fontWeight: FontWeight.w700),)),
              ),
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
                    await login();
                    //AppNavigator().pushAndRemoveAll(routeName: AppRoutes.HOME_SCREEN_ROUTE);
                  },
                  child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        tr("Login"),
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

              Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 3.w),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor:Colors.white,
                    disabledBackgroundColor: Colors.grey,
                    disabledForegroundColor: Colors.grey,
                    disabledMouseCursor: SystemMouseCursors.forbidden,
                    padding: EdgeInsets.symmetric(vertical:2.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(width: 1,color: Colors.black)
                    ),
                  ),
                  onPressed: ()async{
                    AppNavigator().push(routeName: AppRoutes.REGISTER_SCREEN_ROUTE);
                  },
                  child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        tr("Register"),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: AppFontSize.x_x_small,
                            fontWeight: FontWeight.w700
                        ),
                      )
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 3.h),
              child: Row(children: [
                Expanded(child: Container(height: 1,color: Colors.grey[400],)),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 1.w),
                  child: Text(tr("Or join with"),style: TextStyle(color: Colors.grey,fontSize: AppFontSize.small,fontWeight: FontWeight.w700),),
                ),
                Expanded(child: Container(height: 1,color: Colors.grey[400],))

              ],),),
              SizedBox(height:2.h,),
              InkWell(
                onTap: (){
                  LoginProvider().onSoialClick();
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 3.w),
                  padding: EdgeInsets.all(3.w),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width:20.w),
                    Image.asset("assets/images/google.png",
                      height: 3.h,
                      width: 3.h,
                    ),
                    SizedBox(width: 5.w,),
                    Text(tr("Continue with Google"),style:TextStyle(fontSize:AppFontSize.x_small,fontWeight: FontWeight.w700),)
                  ],
                )),
              ),
              SizedBox(height: 1.5.h,),
              InkWell(
                onTap: (){
                  LoginProvider().onSoialClick();
                },
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 3.w),
                    padding: EdgeInsets.all(3.w),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width:20.w),
                        Image.asset("assets/images/facebook.png",
                          height: 3.h,
                          width: 3.h,
                        ),
                        SizedBox(width: 5.w,),
                        Text(tr("Continue with Facebook"),style: TextStyle(fontSize:AppFontSize.x_small,fontWeight: FontWeight.w700),)
                      ],
                    )),
              )


            ],),
          ),
           Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
             Text(tr("By continuing,you are agree to our ")),
             Text(tr("Privacy "),style: TextStyle(color: Color(0xff003498)),),
           ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(tr("And ")),
                Text(tr("Term&conditions"),style: TextStyle(color: Color(0xff003498))),
              ],
            ),
            ],),
          SizedBox(height: 5.h,),

        ],
      ),);
  }
}
