import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:flutter/Material.dart';
import 'package:sizer/sizer.dart';

import '../../../../common/helpers/app_navigator.dart';

class SelectPhoneBottomSheet extends StatelessWidget {
  final Function(String phone)onSubmit;
  const SelectPhoneBottomSheet({required  this.onSubmit,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller=TextEditingController();
    return Column(
      children: [
        Expanded(child: SizedBox()),
        Container(
          width: double.infinity,
          padding:  EdgeInsets.symmetric(vertical:2.h,horizontal: 2.w),
          margin:  EdgeInsets.symmetric(horizontal: 4.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft:Radius.circular(8),topRight:Radius.circular(8) ),

          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(tr("select_phone"),style: TextStyle(fontSize: AppFontSize.medium,fontWeight: FontWeight.w700),),
              SizedBox(height: 1.h,),

              SizedBox(height: 2.h,),
              Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 2.w),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.fromBorderSide(
                                BorderSide(
                                  width:1,
                                  color:Colors.black,
                                )
                            )
                        ),
                        child: TextFormField(
                          controller:controller,
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
                              hintText: tr("enter_phone"),
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: AppFontSize.x_x_small,
                                fontWeight: FontWeight.w400,
                              )
                          ),
                          keyboardType: TextInputType.phone,
                          cursorColor: Colors.black,
                          onChanged: (value){
                          },
                          validator:(value){
                          },
                        ),

                      ),
                    ),
                  ],
                ),

              SizedBox(height: 2.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor:Colors.black,
                    disabledBackgroundColor: Colors.black,
                    disabledForegroundColor: Colors.black,
                    disabledMouseCursor: SystemMouseCursors.forbidden,
                    padding: EdgeInsets.symmetric(vertical:1.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: ()async{
                    AppNavigator().goBack();
                    onSubmit(controller.text);
                  },
                  child: SizedBox(
                      width:double.infinity,
                      child: Text(
                        tr("confirm"),
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
              SizedBox(height: 1.h,)
            ],),
        ),
        Expanded(child: SizedBox()),
      ],
    );
  }
}
