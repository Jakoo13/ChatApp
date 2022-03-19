import 'package:get/get.dart';
import 'package:get_chat/screens/auth/UserModel.dart';

class UserController extends GetxController {
  final Rx<UserModel> _userModel = UserModel().obs;

  UserModel get user => _userModel.value;

  set user(UserModel value) => _userModel.value = value;
}
