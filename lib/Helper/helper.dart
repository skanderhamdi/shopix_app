import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Helper {
  static GetConnect getConnect = GetConnect();
  /// Method to display a loading overlay
  static void startLoading() async => await Get.dialog(
    PopScope(
        canPop: false,
        child: SimpleDialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            children: [
              Center(
                  child: CircularProgressIndicator(
                      backgroundColor: Get.theme.colorScheme.primary.withOpacity(0.25),
                      color: Get.theme.colorScheme.primary
                  )
              )
            ]
        )
    ),
    barrierColor: Colors.black.withOpacity(0.75),
    barrierDismissible: false
  );
  /// Method to hide loading overlay
  static void stopLoading() => Get.back();
  /// Format backend validation errors
  static String? extractValidationErrorMessages(Map<String, dynamic> responseBody) {
    if (responseBody.containsKey('errors')) {
      Map<String, dynamic> errors = responseBody['errors'];
      String errorMessages = errors.values.expand((errorList) => errorList).join('\n');
      return errorMessages;
    } else {
      return null;
    }
  }
}