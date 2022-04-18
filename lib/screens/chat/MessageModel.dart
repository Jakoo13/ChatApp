import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  late String content;
  late String messageTo;
  late String messageFrom;
  bool read = false;
  late DateTime timeStamp;

  MessageModel({
    required this.content,
    required this.messageTo,
    required this.messageFrom,
    required this.read,
    required this.timeStamp,
  });

  MessageModel.fromDocumentSnapshot(
      {required DocumentSnapshot documentSnapshot}) {
    content = documentSnapshot["content"];
    messageTo = documentSnapshot["messageTo"];
    messageFrom = documentSnapshot["messageFrom"];
    read = documentSnapshot["read"];
    timeStamp = documentSnapshot["timeStamp"];
  }
}
