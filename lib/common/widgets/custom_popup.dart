import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/utils/constants/app_font_size.dart';
import 'package:flutter/Material.dart';
import 'package:sizer/sizer.dart';

class MyPopup extends StatelessWidget {
  final String title;
  final Function onSubmit;

  MyPopup({required this.title, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: AppFontSize.x_small,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor:Colors.black,
                  disabledBackgroundColor: Colors.grey,
                  disabledForegroundColor: Colors.grey,
                  disabledMouseCursor: SystemMouseCursors.forbidden,
                  padding: EdgeInsets.symmetric(vertical:1.h,horizontal: 10.w),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  onSubmit();
                  Navigator.of(context).pop();
                },
                child: Text(tr("submit"),style: TextStyle(fontSize: AppFontSize.medium,fontWeight: FontWeight.w800),),
              ),
            ],
          ),
        ),
        Positioned(
          right: 0.0,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Align(
              alignment: Alignment.topRight,
              child: CircleAvatar(
                radius: 14.0,
                backgroundColor: Colors.red,
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}