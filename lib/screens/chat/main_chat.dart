// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_chat/screens/chat/chatController.dart';

class MainChat extends GetView<ChatController> {
  const MainChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var chatController = Get.put(ChatController());
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                //BACK BUTTON
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 100,
                      top: 60,
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 30,
                      color: Colors.white70,
                    ),
                  ),
                ),
                //TITLE
                const Padding(
                  padding: EdgeInsets.only(
                    top: 60.0,
                  ),
                  child: Text(
                    "Main Chat",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 26,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .7,
              height: MediaQuery.of(context).size.height * .8,
              child: Obx(
                () => ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.users.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 100,
                        margin: const EdgeInsets.only(
                          bottom: 10,
                        ),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              controller.users[index].firstName,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
