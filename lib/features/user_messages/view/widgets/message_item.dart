import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/features/user_messages/model/messages_model.dart';
import 'package:flutter/Material.dart';
import 'package:sizer/sizer.dart';

class MessageItem extends StatelessWidget {
  final MessageDataModel messageDataModel;
  const MessageItem({required this.messageDataModel,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

      },
      child: Container(
        width: double.infinity,
        margin:  EdgeInsets.symmetric(vertical:0.5.h,horizontal: 2.w),
        padding:  EdgeInsets.symmetric(vertical:2.h,horizontal: 2.w),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.fromBorderSide(
              BorderSide(
                  width:1,
                  color:Colors.grey
              )
          ),
          borderRadius: BorderRadius.all(Radius.circular(8) ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Icon(Icons.circle_notifications,size: 30,),
          SizedBox(width: 4.w,),
          Expanded(child: Text(
              AppLocalization.isArabic?
              messageDataModel.notificationContentAr:
              messageDataModel.notificationContentEn))
        ],),
      ),
    );
  }
}
