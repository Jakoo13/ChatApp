// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_chat/auth/auth_controller.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 70),
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
        child: Form(
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  bottom: 30,
                  top: 80,
                ),
                child: Text(
                  "Register",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
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
              // REGISTER BUTTON
              InkWell(
                onTap: () {
                  AuthController.authInstance.register(
                      firstNameController.text.trim(),
                      lastNameController.text.trim(),
                      emailController.text.trim(),
                      passwordController.text.trim());
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 25),
                  height: 50,
                  width: 110,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[600],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      "Register",
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
                  top: 22,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account? ",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    InkWell(
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 15,
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
    );
  }
}
