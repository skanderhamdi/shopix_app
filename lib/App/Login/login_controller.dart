import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopix/Helper/session_controller.dart';
import '../../Helper/constants.dart';
import '../../Helper/helper.dart';
import '../../Models/user.dart';

class LoginController extends GetxController {

  /// Show password flag
  RxBool showPassword = false.obs;
  /// Form key [formKey]
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  /// Store email
  String email = '';
  /// Store password
  String password = '';

  /// Login form submit function
  void submit() async {
    if(formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Map<String, dynamic> data = {
        'email': email,
        'password': password
      };
      Helper.startLoading();
      final response = await Helper.getConnect.post('${Constants.baseURL}/login', data);
      Helper.stopLoading();
      if(response.statusCode == 200) {
        Map<String,dynamic> data = json.decode(response.bodyString ?? '{}');
        Get.find<SessionController>().setUserSession(User.fromJSON(data['data']));
        Get.offAllNamed('/home');
      } else {
        if(response.statusCode == 500) {
          Get.snackbar('error'.tr, 'something_went_wrong_please_try_again_later'.tr, backgroundColor: Get.theme.colorScheme.error, colorText: Colors.white, snackPosition: SnackPosition.BOTTOM, duration: const Duration(seconds: 5));
        } else {
          Get.snackbar('error'.tr, 'the_provided_credentials_are_not_correct'.tr, backgroundColor: Get.theme.colorScheme.error, colorText: Colors.white, snackPosition: SnackPosition.BOTTOM, duration: const Duration(seconds: 5));
        }
      }
    }
  }
}