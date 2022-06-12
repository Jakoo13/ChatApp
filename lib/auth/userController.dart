// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_chat/auth/UserModel.dart';

class UserController extends GetxController {
  var fireStore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final Rx<UserModel> _currentUserModel = UserModel().obs;

  @override
  void onReady() {
    super.onReady();
    setCurrentUser();
  }

  UserModel get user => _currentUserModel.value;

  set currentUser(UserModel value) => _currentUserModel.value = value;

  void setCurrentUser() async {
    final firebaseUser = auth.currentUser;

    //Set User Model within userController.dart
    var thisUser =
        await fireStore.collection('users').doc(firebaseUser!.uid).get();
    Map<String, dynamic> data = thisUser.data()!;
    var firstName = data['firstName'];
    var lastName = data['lastName'];
    UserModel _currentUserModel = UserModel(
      uid: firebaseUser.uid,
      email: firebaseUser.email,
      firstName: firstName,
      lastName: lastName,
    );

    currentUser = _currentUserModel;
  }
}
