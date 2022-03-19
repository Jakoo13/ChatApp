import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../auth/auth_controller.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      top: 5,
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
                    bottom: 50,
                  ),
                  child: Text(
                    "Settings",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 26,
                    ),
                  ),
                ),
              ],
            ),
            // SIGN OUT BUTTON
            InkWell(
              onTap: () {
                AuthController.authInstance.signOut();
              },
              child: Container(
                margin: const EdgeInsets.only(top: 285),
                height: 50,
                width: 110,
                decoration: BoxDecoration(
                  color: Colors.blueGrey[600],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "Logout",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
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
