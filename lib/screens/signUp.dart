// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white54,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 70,
                    right: 70,
                    top: 0,
                  ),
                  child: TextFormField(
                    controller: firstNameController,
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
                      labelText: "First Name",
                      hintStyle: const TextStyle(
                        color: Colors.white54,
                      ),
                      fillColor: Colors.blueGrey[400],
                      filled: true,
                      labelStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      errorStyle: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 70,
                    right: 70,
                    top: 25,
                  ),
                  child: TextFormField(
                    controller: lastNameController,
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
                      labelText: "Last Name",
                      hintStyle: const TextStyle(color: Colors.white54),
                      fillColor: Colors.blueGrey[400],
                      filled: true,
                      labelStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      errorStyle: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 70,
                    right: 70,
                    top: 25,
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
                      labelText: "Email",
                      hintStyle: const TextStyle(color: Colors.white54),
                      fillColor: Colors.blueGrey[400],
                      filled: true,
                      labelStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      errorStyle: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 70,
                    right: 70,
                    top: 25,
                  ),
                  child: TextFormField(
                    controller: passwordController,
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
                      labelText: "Password",
                      hintStyle: const TextStyle(color: Colors.white54),
                      fillColor: Colors.blueGrey[400],
                      filled: true,
                      labelStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      errorStyle: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      print('registered');
                    },
                    child: const Text("Sign Up"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey[600],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account? ",
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Colors.white70,
                          ),
                        ),
                        onTap: () {
                          Get.toNamed(
                            "/signIn",
                          );
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
    );
  }
}
