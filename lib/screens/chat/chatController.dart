// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../auth/UserModel.dart';

class ChatController extends GetxController with StateMixin {
  final users = [].obs;

  @override
  void onInit() async {
    users.bindStream(lista());
    super.onInit();
  }

  Stream<List<dynamic>> lista() {
    final usersSnapshot =
        FirebaseFirestore.instance.collection('users').snapshots();
    var changeThis = usersSnapshot.map((qShot) => qShot.docs
        .map(
          (doc) => UserModel(
            firstName: doc['firstName'],
            lastName: doc['lastName'],
            email: doc['email'],
          ),
        )
        .toList());
    change(changeThis, status: RxStatus.success());
    return changeThis;
  }
}
