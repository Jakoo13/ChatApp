import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chatController.dart';

class ChatScreen extends GetView<ChatController> {
  final int index;
  final String firstName;
  final String lastName;
  const ChatScreen(this.index, this.firstName, this.lastName, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(title: Text('$firstName $lastName')),
    );
  }
}
