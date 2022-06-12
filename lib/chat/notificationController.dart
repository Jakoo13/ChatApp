// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_chat/main.dart';

class NotificationController extends GetxController {
  @override
  void onInit() async {
    getFirebaseToken();
    getTerminatedNotification();
    foregroundNotification();
    super.onInit();
  }

  Future<void> saveTokenToDatabase(String token) async {
    // Assume user is logged in for this example
    String userId = FirebaseAuth.instance.currentUser!.uid;
    //String? userEmail = FirebaseAuth.instance.currentUser!.email;

    await FirebaseFirestore.instance.collection('users').doc(userId).update({
      'tokens': token.toString()
      // FieldValue.arrayUnion([token]),
    });
  }

  Future<void> getFirebaseToken() async {
    // Get the token each time the application loads
    String? token = await FirebaseMessaging.instance.getToken();
    // Save the initial token to the database

    await saveTokenToDatabase(token!);
  }

  //gives message on which user taps and opens app from terminated
  getTerminatedNotification() {
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      print('opened app from terminated');
      if (message != null) {
        print('received message from terminated: $message');
      }
    });
  }

  foregroundNotification() {
    //When App is in Foreground, does not show popup, but gets message, does not run when app is in background
  }
}
