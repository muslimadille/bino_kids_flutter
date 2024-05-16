// To parse this JSON data, do
//
//     final messagesModel = messagesModelFromJson(jsonString);

import 'dart:convert';

MessagesModel messagesModelFromJson(String str) => MessagesModel.fromJson(json.decode(str));

String messagesModelToJson(MessagesModel data) => json.encode(data.toJson());

class MessagesModel {
  int status;
  String message;
  ReturnUserMessageList data;

  MessagesModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory MessagesModel.fromJson(Map<String, dynamic> json) => MessagesModel(
    status: json["status"]??0,
    message: json["message"]??'',
    data: ReturnUserMessageList.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class ReturnUserMessageList {
  List<MessageDataModel> returnUserMessageList;

  ReturnUserMessageList({
    required this.returnUserMessageList,
  });

  factory ReturnUserMessageList.fromJson(Map<String, dynamic> json) => ReturnUserMessageList(
    returnUserMessageList: List<MessageDataModel>.from(json["returnUserMessageList"].map((x) => MessageDataModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "returnUserMessageList": List<dynamic>.from(returnUserMessageList.map((x) => x.toJson())),
  };
}

class MessageDataModel {
  int id;
  int readedMobileNotificationId;
  int userId;
  String notificationContentAr;
  String notificationContentEn;
  int linkInMobileId;
  int linkMobileOrModel;
  int mobileNotificationId;
  bool isReaded;

  MessageDataModel({
    required this.id,
    required this.readedMobileNotificationId,
    required this.userId,
    required this.notificationContentAr,
    required this.notificationContentEn,
    required this.linkInMobileId,
    required this.linkMobileOrModel,
    required this.mobileNotificationId,
    required this.isReaded,
  });

  factory MessageDataModel.fromJson(Map<String, dynamic> json) => MessageDataModel(
    id: json["ID"],
    readedMobileNotificationId: json["ReadedMobileNotificationId"],
    userId: json["UserId"],
    notificationContentAr: json["NotificationContentAR"],
    notificationContentEn: json["NotificationContentEn"],
    linkInMobileId: json["LinkInMobileId"],
    linkMobileOrModel: json["LinkMobileOrModel"],
    mobileNotificationId: json["MobileNotificationId"],
    isReaded: json["IsReaded"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "ReadedMobileNotificationId": readedMobileNotificationId,
    "UserId": userId,
    "NotificationContentAR": notificationContentAr,
    "NotificationContentEn": notificationContentEn,
    "LinkInMobileId": linkInMobileId,
    "LinkMobileOrModel": linkMobileOrModel,
    "MobileNotificationId": mobileNotificationId,
    "IsReaded": isReaded,
  };
}
