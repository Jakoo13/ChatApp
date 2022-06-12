import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_chat/chat/chat_input.dart';
import 'package:get_chat/chat/chat_bubble.dart';

import 'chatController.dart';

class ChatScreen extends GetView<ChatController> {
  final int index;
  final String sendToFirstName;
  final String sendToLastName;
  final String sendToEmail;
  const ChatScreen(
      this.index, this.sendToFirstName, this.sendToLastName, this.sendToEmail,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 48, 207, 208),
              Color.fromARGB(255, 51, 8, 103),
            ],
          ),
        ),
        child: Column(
          children: [
            //Header With Name and Back Button
            Padding(
              padding: const EdgeInsets.only(
                top: 70,
                left: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: Get.back,
                    child: const Icon(
                      Icons.arrow_back,
                      size: 32,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "$sendToFirstName $sendToLastName",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w700,
                        fontSize: 27,
                      ),
                    ),
                  ),
                  Container(
                    width: 50,
                  )
                ],
              ),
            ),
            //END HEADER
            Expanded(
              child: Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.messageList.value.length,
                  itemBuilder: (context, index) {
                    return ChatBubble(
                      messageText: controller.messageList.value[index].content,
                      sendToEmail:
                          controller.messageList.value[index].messageTo,
                    );
                  },
                ),
              ),
            ),
            ChatInput(sendToEmail),
          ],
        ),
      ),
    );
  }
}
