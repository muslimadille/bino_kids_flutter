import 'dart:convert';

import 'package:bino_kids/features/user_messages/model/messages_model.dart';
import 'package:bino_kids/features/user_messages/repository/message_repo.dart';

mixin MessagesViewModel{
  Future <List<MessageDataModel>?>getAllMessages()async{
    final response=await MessagesRepo().getAllMessages();
    MessagesModel messagesModel=messagesModelFromJson(jsonEncode(response.data));
    return messagesModel.data.returnUserMessageList;
  }

}