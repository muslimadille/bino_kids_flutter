import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfileDividerWidget extends StatelessWidget {
  const ProfileDividerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: 1.h,
      color: Colors.grey[200],
    );
  }
}
