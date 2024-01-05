import 'package:bino_kids/common/helpers/app_navigator.dart';
import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:bino_kids/common/utils/constants/app_routes.dart';
import 'package:bino_kids/common/widgets/custom_back_btn.dart';
import 'package:bino_kids/features/auth/view_model/login_helper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with LoginHelper{
  late final TextEditingController emailCotroller;
  late final TextEditingController passwordCotroller;
  bool showIcone=false;

  @override
  void initState() {
    emailCotroller=TextEditingController();
     passwordCotroller=TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
      child: Column(
        children: [
          Expanded(
            child: ListView(children:  [
              const CustomBackBtn(),
              Image.asset(
                  "assets/images/app_name_icon.png",
              height: 8.h,
                fit: BoxFit.fitHeight,
              ),
              SizedBox(height: 5.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal:3.w,vertical: 1.h),
                child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text("Mobile number or email address",style: TextStyle(fontSize: AppFontSize.x_small,fontWeight: FontWeight.w500,color: Colors.grey),),
                  SizedBox(height:1.h),
                  Container(
                    height: 5.h,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
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
                  Text("Password",style: TextStyle(fontSize: AppFontSize.x_small,fontWeight: FontWeight.w500,color: Colors.grey),),
                  SizedBox(height:1.h),
                  Container(
                    height: 5.h,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
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
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 3.w),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor:Colors.black,
                    disabledBackgroundColor: Colors.black,
                    disabledForegroundColor: Colors.black,
                    disabledMouseCursor: SystemMouseCursors.forbidden,
                    padding: EdgeInsets.symmetric(vertical:2.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  onPressed: ()async{
                    await login();
                    AppNavigator().pushAndRemoveAll(routeName: AppRoutes.HOME_SCREEN_ROUTE);
                  },
                  child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        "CONTINUE",
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
              Padding(padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 3.h),
              child: Row(children: [
                Expanded(child: Container(height: 1,color: Colors.grey[400],)),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 1.w),
                  child: Text("Or join with",style: TextStyle(color: Colors.grey),),
                ),
                Expanded(child: Container(height: 1,color: Colors.grey[400],))

              ],),),
              SizedBox(height:2.h,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 3.w),
                padding: EdgeInsets.all(3.w),
                decoration: BoxDecoration(
                    color: Colors.transparent,
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
                  Text("Continue with Google",style: TextStyle(fontSize:AppFontSize.x_x_small),)
                ],
              )),
              SizedBox(height: 1.5.h,),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 3.w),
                  padding: EdgeInsets.all(3.w),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
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
                      Text("Continue with Facebook",style: TextStyle(fontSize:AppFontSize.x_x_small),)
                    ],
                  ))


            ],),
          ),
           Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
             Text("By continunig,you are agree to our "),
             Text("Privacy ",style: TextStyle(color: Color(0xff003498)),),
           ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("And "),
                Text("Term&conditions",style: TextStyle(color: Color(0xff003498))),
              ],
            ),
            ],),
          SizedBox(height: 2.h,),

        ],
      ),

    ),);
  }
}
