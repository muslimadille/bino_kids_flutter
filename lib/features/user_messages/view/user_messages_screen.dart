import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/widgets/custom_back_btn.dart';
import 'package:flutter/material.dart';

import 'widgets/no_data_widget.dart';

class UserMessagesScreen extends StatefulWidget {
  const UserMessagesScreen({Key? key}) : super(key: key);

  @override
  State<UserMessagesScreen> createState() => _UserMessagesScreenState();
}

class _UserMessagesScreenState extends State<UserMessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Column(children: [
           CustomBackBtn(
            title:tr("Notifications"),
          ),
          Container(width: double.infinity,color: Colors.grey[200],height: 1,),
          Expanded(child: NoDataWidget(title:tr("no_notifications"),
            image: "assets/images/ic_no_message.png",))
        ],)
        ,) ,);
  }
}
