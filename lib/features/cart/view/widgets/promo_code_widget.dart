import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PromoCodeWidget extends StatefulWidget {
  final Function(String value) onClick;
  const PromoCodeWidget({
    required this.onClick,
    Key? key}) : super(key: key);

  @override
  State<PromoCodeWidget> createState() => _PromoCodeWidgetState();
}

class _PromoCodeWidgetState extends State<PromoCodeWidget> {
  late final TextEditingController _controller;
  @override
  void initState() {
    _controller=TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Row(children: [
      SizedBox(width: 3.w,),
     Expanded(child:  Container(
       decoration: BoxDecoration(
           color: Colors.transparent,
           borderRadius: BorderRadius.circular(10),
           border: Border.fromBorderSide(
               BorderSide(
                   width:1,
                   color:Colors.grey,
               )
           )
       ),
       padding: EdgeInsets.symmetric(vertical: 1.h,horizontal:2.w),
       child:TextFormField(
         controller:_controller,
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
             hintText: tr("Apply Coupon")
         ),
         keyboardType: TextInputType.emailAddress ,
         cursorColor: Colors.black,
         onChanged: (value){

         },
         validator:(value){

         },
       ),
     )),
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
            widget.onClick(_controller.text);
          },
          child: SizedBox(
            width: 20.w,
              child: Text(
                tr("Apply"),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: AppFontSize.x_small,
                    fontWeight: FontWeight.w700
                ),
              )
          ),
        ),
      )

    ],);
  }
}
