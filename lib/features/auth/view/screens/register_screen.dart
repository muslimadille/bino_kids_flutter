import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:bino_kids/common/widgets/custom_back_btn.dart';
import 'package:bino_kids/features/auth/provider/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {



  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisterProvider>(
        create: (context) => RegisterProvider(),
      builder: (ctx,m){
          ctx.read<RegisterProvider>().onInit();
          return Scaffold(body: SafeArea(
            child: Column(children: [
              CustomBackBtn(title: tr("Register"),),
              Container(color: Colors.grey[200],width: double.infinity,height: 1,),
              SizedBox(height:3.h),
              Consumer<RegisterProvider>(builder: (context,model,_){
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:List.generate(2, (index){
                    return InkWell(
                      onTap: (){
                        model.selectTab(index);
                      },
                      child: Container(
                          width: 30.w,
                          margin: EdgeInsets.symmetric(horizontal: 3.w),
                          padding: EdgeInsets.all(3.w),
                          decoration: BoxDecoration(
                              color: model.selectedRegisterTab==index?Colors.black:Colors.transparent,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.fromBorderSide(
                                  BorderSide(
                                      width:1,
                                      color:Colors.black
                                  )
                              )
                          ),
                          child: Center(
                            child: Text(model.tabNames[index],style: TextStyle(
                                color: model.selectedRegisterTab==index?Colors.white:Colors.black,
                                fontSize:AppFontSize.x_small,fontWeight: FontWeight.w700),),
                          )),
                    );
                  }),);
              }),
              SizedBox(height:2.h),
              Expanded(child: Consumer<RegisterProvider>(
                  builder: (context,model,_) {
                    return ListView(children: [

                      ///fields
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 4.w),
                        child: Form(child: Column(
                          crossAxisAlignment:CrossAxisAlignment.start,
                          children: [
                            SizedBox(height:2.h),
                            /// name
                            Text(tr("user_name"),style: TextStyle(fontSize: AppFontSize.x_small,fontWeight: FontWeight.w500,color: Colors.black),),
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
                                  controller:model.nameController ,
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
                                    model.onTextChange();
                                  },
                                  validator:(value){

                                  },
                                )),

                              ],
                              ),
                            ),
                            SizedBox(height:2.h),
                            ///mobile
                            Text(tr("mobile_number"),style: TextStyle(fontSize: AppFontSize.x_small,fontWeight: FontWeight.w500,color: Colors.black),),
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
                                  controller:model.mobileController ,
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
                                  keyboardType: TextInputType.phone ,
                                  cursorColor: Colors.black,
                                  onChanged: (value){
                                    model.onTextChange();
                                  },
                                  validator:(value){

                                  },
                                )),

                              ],
                              ),
                            ),
                            SizedBox(height:2.h),
                            ///email
                            Text(tr("email"),style: TextStyle(fontSize: AppFontSize.x_small,fontWeight: FontWeight.w500,color: Colors.black),),
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
                                  controller:model.emailController ,
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
                                    model.onTextChange();
                                  },
                                  validator:(value){

                                  },
                                )),

                              ],
                              ),
                            ),
                            SizedBox(height:2.h),
                            ///password
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
                                  controller:model.passwordController ,
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
                                    model.onTextChange();
                                  },
                                  validator:(value){

                                  },
                                )),

                              ],
                              ),
                            ),
                            SizedBox(height:2.h),
                            ///cofirm password
                            Text(tr("confirm_password"),style: TextStyle(fontSize: AppFontSize.x_small,fontWeight: FontWeight.w500,color: Colors.black),),
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
                                  controller:model.confirmPasswordController ,
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
                                    model.onTextChange();
                                  },
                                  validator:(value){

                                  },
                                )),

                              ],
                              ),
                            ),
                            SizedBox(height:2.h),

                            Visibility(
                              visible: model.selectedRegisterTab==1,
                              child: Column(
                                crossAxisAlignment:CrossAxisAlignment.start,
                                children: [
                                  ///company name
                                  Text(tr("company_name"),style: TextStyle(fontSize: AppFontSize.x_small,fontWeight: FontWeight.w500,color: Colors.black),),
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
                                        controller:model.companyNameController ,
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
                                          model.onTextChange();
                                        },
                                        validator:(value){

                                        },
                                      )),

                                    ],
                                    ),
                                  ),
                                  SizedBox(height:2.h),

                                  ///company address
                                  Text(tr("Company_address"),style: TextStyle(fontSize: AppFontSize.x_small,fontWeight: FontWeight.w500,color: Colors.black),),
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
                                        controller:model.companyAddressController ,
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
                                          model.onTextChange();
                                        },
                                        validator:(value){

                                        },
                                      )),

                                    ],
                                    ),
                                  ),
                                  SizedBox(height:2.h),

                                  ///campay activity
                                  Text(tr("Company_activity"),style: TextStyle(fontSize: AppFontSize.x_small,fontWeight: FontWeight.w500,color: Colors.black),),
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
                                        controller:model.companyActivityController ,
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
                                          model.onTextChange();
                                        },
                                        validator:(value){

                                        },
                                      )),

                                    ],
                                    ),
                                  ),
                                  SizedBox(height:2.h),

                                ],),
                            ),
                            //Expanded(child: SizedBox()),

                          ],)),
                      )
                    ],);
                  }
              )),
              Consumer<RegisterProvider>(
                  builder: (context,model,_) {
                    return  Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 3.w),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor:Colors.black,
                        disabledBackgroundColor: Colors.grey,
                        disabledForegroundColor: Colors.grey,
                        disabledMouseCursor: SystemMouseCursors.forbidden,
                        padding: EdgeInsets.symmetric(vertical:2.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: BorderSide(width: 1,color: Colors.black)
                        ),
                      ),
                      onPressed: model.isAllFieldsCompleted()?(){model.register();}:null,
                      child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            tr("Register"),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: AppFontSize.x_x_small,
                                fontWeight: FontWeight.w700
                            ),
                          )
                      ),
                    ),
                  );
                }
              )

            ],),
          ),);
      },
    );


  }
}
