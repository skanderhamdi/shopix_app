import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Helper/constants.dart';
import '../../Helper/helper.dart';
import '../../Helper/session_controller.dart';
import '../../Models/user.dart';

class SignupController extends GetxController {
  User user = User();
  RxBool showPassword = false.obs;
  /// Form key [formKey]
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  /// Signup form submit function
  void submit() async {
    if(formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Helper.startLoading();
      final response = await Helper.getConnect.post('${Constants.baseURL}/signup', user.toJSON());
      Helper.stopLoading();
      if(response.statusCode == 200) {
        Map<String,dynamic> data = json.decode(response.bodyString ?? '{}');
        Get.find<SessionController>().setUserSession(User.fromJSON(data['data']));
        Get.offAllNamed('/tab');
      } else {
        if(response.statusCode == 500) {
          Get.snackbar('error'.tr, 'something_went_wrong_please_try_again_later'.tr, backgroundColor: Get.theme.colorScheme.error, colorText: Colors.white, snackPosition: SnackPosition.BOTTOM, duration: const Duration(seconds: 5));
        } else {
          Map<String,dynamic> data = json.decode(response.bodyString ?? '{}');
          String? errors = Helper.extractValidationErrorMessages(data);
          Get.snackbar('error'.tr, '${'we_could_not_create_an_account_please_check_the_errors'.tr}${errors != null ? ':\n\n$errors' : ''}', backgroundColor: Get.theme.colorScheme.error, colorText: Colors.white, snackPosition: SnackPosition.BOTTOM, duration: const Duration(seconds: 10));
        }
      }
    }
  }
}