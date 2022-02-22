// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_chat/screens/auth/signIn.dart';
import 'package:get_chat/screens/home/home_screen.dart';

class AuthController extends GetxController {
  static AuthController authInstance = Get.find();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late Rx<User?> _firebaseUser;

  @override
  void onReady() {
    super.onReady();
    _firebaseUser = Rx<User?>(_auth.currentUser);
    _firebaseUser.bindStream(_auth.userChanges());

    ever(_firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user != null) {
      //User is logged in
      Get.offAll(() => const HomeScreen());
    } else {
      //user is null as in user not available or logged in
      Get.offAll(() => const SignIn());
    }
  }

  void register(String email, String password) {
    try {
      _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      // this is solely for Firebase Auth exception like "password did not match"
      print(e.message);
    } catch (e) {
      // This is temp. This is where we need to handle different dialog to indicate what's wrong
      print(e);
    }
  }

  void login(String email, String password) {
    try {
      _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      // this is solely for Firebase Auth exception like "password did not match"
      print(e.message);
    } catch (e) {
      print(e);
    }
  }

  void signOut() {
    try {
      _auth.signOut();
    } catch (e) {
      print(e);
    }
  }
}
