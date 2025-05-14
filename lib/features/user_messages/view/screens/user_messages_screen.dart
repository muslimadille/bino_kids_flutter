import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/widgets/custom_back_btn.dart';
import 'package:bino_kids/features/user_messages/model/messages_model.dart';
import 'package:bino_kids/features/user_messages/repository/message_repo.dart';
import 'package:bino_kids/features/user_messages/view/widgets/message_item.dart';
import 'package:bino_kids/features/user_messages/view_model/messages_view_model.dart';
import 'package:flutter/material.dart';

import '../widgets/no_data_widget.dart';

class UserMessagesScreen extends StatefulWidget {
  const UserMessagesScreen({Key? key}) : super(key: key);

  @override
  State<UserMessagesScreen> createState() => _UserMessagesScreenState();
}

class _UserMessagesScreenState extends State<UserMessagesScreen>with MessagesViewModel {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Column(children: [
           CustomBackBtn(
            title:tr("Notifications"),
          ),
          Container(width: double.infinity,color: Colors.grey[200],height: 1,),
          Expanded(child:
              FutureBuilder<List<MessageDataModel>?>(
                future: getAllMessages(),
                builder: (BuildContext context, snapshot) {
                return snapshot.hasData?snapshot.data!.isNotEmpty?
                    ListView.builder(
                      itemCount:snapshot.data!.length ,
                        itemBuilder: (ctx,index){
                      return MessageItem(messageDataModel:snapshot.data![index]);
                    }):
                NoDataWidget(title:tr("no_notifications"),
                  image: "assets/images/ic_no_message.png",):SizedBox();
                },)
          )
        ],)
        ,) ,);
  }
}
