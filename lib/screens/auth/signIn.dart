import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
          child: Center(
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 200.0),
                    child: Text(
                      'Chat App',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.grey[200],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 70,
                      right: 70,
                      top: 80,
                    ),
                    child: TextFormField(
                      controller: emailController,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        labelText: "Username",
                        hintStyle: const TextStyle(
                          color: Colors.white54,
                        ),
                        fillColor: Colors.blueGrey[400],
                        filled: true,
                        labelStyle: const TextStyle(
                          color: Colors.white70,
                        ),
                        errorStyle: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 70,
                      right: 70,
                      top: 40,
                    ),
                    child: TextFormField(
                      controller: passwordController,
                      cursorColor: Colors.white,
                      obscureText: true,
                      decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        labelText: "Password",
                        hintStyle: const TextStyle(color: Colors.white54),
                        fillColor: Colors.blueGrey[400],
                        filled: true,
                        labelStyle: const TextStyle(
                          color: Colors.white70,
                        ),
                        errorStyle: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ),
                  // SIGN IN BUTTON
                  InkWell(
                    onTap: () {
                      AuthController.authInstance.login(
                          emailController.text.trim(),
                          passwordController.text.trim());
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 30),
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[600],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "Sign In",
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
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 25,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account? ",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        InkWell(
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                            ),
                          ),
                          onTap: () {
                            Get.toNamed("/signUp");
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String? validateEmail(String? formEmail) {
  if (formEmail == null || formEmail.isEmpty) {
    return 'E-mail address is required.';
  }

  String pattern = r'\w+\.\w+';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formEmail)) return 'Invalid E-mail Address format.';

  return null;
}
