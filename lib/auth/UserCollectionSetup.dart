// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

class UserCollectionSetup {
  final String uid;
  UserCollectionSetup({this.uid = "0000"});

  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference residencesCollection =
      FirebaseFirestore.instance.collection('residences');

  Future updateUserData(
    String firstName,
    String lastName,
    String email,
  ) async {
    return await usersCollection.doc(uid).set({
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
    });
  }
}
