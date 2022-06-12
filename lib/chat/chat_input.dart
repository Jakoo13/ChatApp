// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_chat/chat/chatController.dart';

class ChatInput extends StatelessWidget {
  final String sentToEmail;
  const ChatInput(this.sentToEmail, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var chatController = Get.find<ChatController>();
    chatController.sendMessageTo.value = sentToEmail;
    return Align(
      alignment: FractionalOffset.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: chatController.messageController,
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  helperMaxLines: 3,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                  hintText: 'Send Message',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  suffixIcon: InkWell(
                    onTap: () {
                      chatController.sendMessage(
                          chatController.currentUserEmail, sentToEmail);
                      chatController.messageController.clear();
                    },
                    child: const Icon(Icons.send, color: Colors.grey),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
