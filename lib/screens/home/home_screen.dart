// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_chat/screens/auth/userController.dart';
import 'package:get_chat/screens/chat/all_users.dart';
import 'package:get_chat/screens/settings/settings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userController = Get.put(UserController());

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
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
          children: [
            //TITLE
            const Padding(
              padding: EdgeInsets.only(top: 100.0),
              child: Text(
                "Get Chat",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 50,
                ),
              ),
            ),
            // InkWell(
            //   onTap: () {
            //     print(userController.user.firstName);
            //   },
            //   child: Container(
            //     width: 100,
            //     height: 50,
            //     color: Colors.blue,
            //     child: const Center(
            //       child: Text('Press Me'),
            //     ),
            //   ),
            // ),
            //Greeting
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 30.0),
                child: Obx(
                  () => Text(
                    "Hello ${userController.user.firstName ?? 'User'},",
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 35,
                    ),
                  ),
                ),
              ),
            ),
            // CHAT SCREEN BUTTON
            InkWell(
              onTap: () {
                Get.to(() => const AllUsers());
              },
              child: Container(
                margin: const EdgeInsets.only(top: 200),
                height: 80,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.blueGrey[600],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        "Go Chat",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Icon(
                        Icons.people,
                        color: Colors.white70,
                        size: 32,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        height: 40,
        width: 40,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: Colors.grey,
            elevation: 0,
            child: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: () {
              Get.to(() => const Settings());
            },
          ),
        ),
      ),
    );
  }
}
