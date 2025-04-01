import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopix/Helper/session_controller.dart';

import '../../Helper/constants.dart';
import '../../Helper/helper.dart';
import '../../Models/user.dart';

class SettingsController extends GetxController {

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController passwordConfirmationController;
  late TextEditingController fullnameController;
  final sessionController = Get.find<SessionController>();

  @override
  void onInit() {
    emailController = TextEditingController(text: sessionController.getUserSession()!.email!);
    fullnameController = TextEditingController(text: sessionController.getUserSession()!.fullname!);
    passwordController = TextEditingController();
    passwordConfirmationController = TextEditingController();
    super.onInit();
  }

  Future<void> saveChanges() async {
    Map<String, dynamic> data = {
      'email': emailController.text.trim(),
      'fullname': fullnameController.text.trim(),
    };

    if (passwordController.text.isNotEmpty) {
      data['password'] = passwordController.text;
      data['password_confirmation'] = passwordConfirmationController.text;
    }

    log('data: $data');

    Helper.startLoading();
    String authToken = sessionController.getUserSession()!.authToken!;

    final response = await Helper.getConnect.put('${Constants.baseURL}/settings', data, headers: {'Authorization': 'Bearer $authToken'});

    Helper.stopLoading();

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.bodyString ?? '{}');
      Get.find<SessionController>().setUserSession(User.fromJSON(responseData['data']));
      Get.snackbar('success'.tr, 'settings_updated_successfully'.tr,
          backgroundColor: Get.theme.colorScheme.primary,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 5)
      );
    } else {
      if (response.statusCode == 500) {
        Get.snackbar('error'.tr, 'something_went_wrong_please_try_again_later'.tr,
            backgroundColor: Get.theme.colorScheme.error,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 5)
        );
      } else {
        Get.snackbar('error'.tr, 'failed_to_update_settings'.tr,
            backgroundColor: Get.theme.colorScheme.error,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 5)
        );
      }
    }
  }

}