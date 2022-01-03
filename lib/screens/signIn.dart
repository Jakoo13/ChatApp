import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          color: Colors.blue,
          child: Container(
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
                    const Padding(
                      padding: EdgeInsets.only(top: 200.0),
                      child: Text(
                        'Chat App',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white54,
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
                        top: 40,
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
                          // ignore: avoid_print
                          print('registered');
                        },
                        child: const Text("Sign In"),
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
                            "Don't have an account? ",
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 11,
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
