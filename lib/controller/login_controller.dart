import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:edu_bot/model/user_model.dart';
import 'package:edu_bot/services/user_service.dart';

class LoginViewController extends GetxController {
  UserService userService = UserService();

  UserModel? user;
  RxBool isBusy = false.obs;

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<UserModel?> getUserDetails({required String email}) async {
    isBusy.value = true;
    user = await userService.getStudentDetails(email: email);
    isBusy.value = false;
    return user;
  }
}
