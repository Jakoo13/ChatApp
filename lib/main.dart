import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_chat/screens/auth/auth_controller.dart';
import 'package:get_chat/screens/auth/signIn.dart';
import 'package:get_chat/screens/auth/signUp.dart';
import 'package:get_chat/screens/home/home_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) {
    Get.put(AuthController());
  });

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
      home: const Center(child: CircularProgressIndicator()),
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
