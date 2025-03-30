import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shopix/Helper/session_controller.dart';

class SettingsController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController passwordConfirmationController;
  late TextEditingController fullnameController;
  final sessionController = Get.find<SessionController>();
  @override
  void onInit() {
    emailController = TextEditingController(text: sessionController.getUserSession()!.email!);
    passwordController = TextEditingController();
    passwordConfirmationController = TextEditingController();
    fullnameController = TextEditingController();
    super.onInit();
  }
}