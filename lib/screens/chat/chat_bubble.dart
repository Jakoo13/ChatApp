import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../auth/userController.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    Key? key,
    required this.messageText,
    required this.sendToEmail,
  }) : super(key: key);

  final String? messageText;
  final String? sendToEmail;

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());

    return Column(
      children: [
        Row(
          mainAxisAlignment: userController.user.email == sendToEmail
              ? MainAxisAlignment.start
              : MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(
                bottom: 10,
                left: 10,
                right: 10,
              ),
              padding: const EdgeInsets.all(12),
              constraints: const BoxConstraints(maxWidth: 240),
              decoration: BoxDecoration(
                color: userController.user.email == sendToEmail
                    ? Colors.green
                    : Colors.blue,
                borderRadius: userController.user.email == sendToEmail
                    ? const BorderRadius.only(
                        bottomRight: Radius.circular(15),
                      )
                    : const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                      ),
              ),
              child: Center(
                child: Text(
                  messageText!,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
