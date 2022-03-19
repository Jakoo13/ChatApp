// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_chat/screens/auth/UserModel.dart';
import 'package:get_chat/screens/auth/signIn.dart';
import 'package:get_chat/screens/auth/userController.dart';
import 'package:get_chat/screens/home/home_screen.dart';
import 'UserCollectionSetup.dart';

class AuthController extends GetxController {
  var userController = Get.put(UserController());
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

  Future register(
      String firstName, String lastName, String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      UserModel _userModel = UserModel(
          uid: result.user!.uid,
          email: email,
          firstName: firstName,
          lastName: lastName);
      userController.user = _userModel;
      print(_userModel);
      await UserCollectionSetup(uid: user!.uid)
          .updateUserData(firstName, lastName, email);
      //return _getUserModelFromFirebase(user);
    } on FirebaseAuthException catch (e) {
      // this is solely for Firebase Auth exception like "password did not match"
      print(e.message);
    } catch (e) {
      // This is temp. This is where we need to handle different dialog to indicate what's wrong
      print(e);
    }
  }

  void login(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      //Set User Model within userController.dart
      var thisUser = await FirebaseFirestore.instance
          .collection('users')
          .doc(result.user!.uid)
          .get();
      Map<String, dynamic> data = thisUser.data()!;
      var firstName = data['firstName'];
      var lastName = data['lastName'];
      UserModel _userModel = UserModel(
        uid: result.user!.uid,
        email: email,
        firstName: firstName,
        lastName: lastName,
      );
      userController.user = _userModel;
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
