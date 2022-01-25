import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_chat/screens/auth/signIn.dart';
import 'package:get_chat/screens/auth/signUp.dart';
import 'package:get_chat/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignIn(),
      getPages: [
        GetPage(
          name: "/",
          page: () => const SignIn(),
        ),
        GetPage(
          name: "/signUp",
          page: () => SignUp(),
        ),
        GetPage(
          name: "/home",
          page: () => const HomeScreen(),
        ),
      ],
    );
  }
}
