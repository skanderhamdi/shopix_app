import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Helper/constants.dart';
import '../../Helper/helper.dart';
import '../../Helper/session_controller.dart';
import '../../Models/product_cart.dart';

class CheckoutController extends GetxController {

  /// Instance of session controller
  final sessionController = Get.find<SessionController>();

  num shippingFee = 20;
  num tax = 0.01;

  num get computeSubTotal {
    List<ProductCart> cart = sessionController.getCart();
    return cart.fold(0, (previous, element) => previous + element.product!.price! * element.quantity!);
  }

  num get computeTotalPrice {
    return computeSubTotal + (computeSubTotal * tax) + shippingFee;
  }

  Future<void> startPaymentProcess() async {
    /// Suppose payment has passed successfully
    List<ProductCart> cart = sessionController.getCart();
    String authToken = sessionController.getUserSession()!.authToken!;
    List<Map<String, dynamic>> orderData = cart.map((e) => {
      'product': e.product!.id,
      'quantity': e.quantity,
    }).toList();
    Map<String, dynamic> data = {
      'products': orderData,
      'shipping_fee': shippingFee,
      'shipping_address': 'DHL Office',
      'tax': (computeSubTotal * tax)
    };
    Helper.startLoading();
    final response = await Helper.getConnect.post('${Constants.baseURL}/orders', jsonEncode(data), headers: Constants.headers..addAll({'Authorization': 'Bearer $authToken'}));
    Helper.stopLoading();
    if(response.statusCode == 200) {
      await Get.dialog(
          GetBuilder<CheckoutController>(
              builder: (controller) {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: Get.width,
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.check_circle_outline_rounded, size: Get.width / 2, color: const Color(0xFF0FDE3E),),
                                    const SizedBox(height: 25),
                                    Text(
                                        'thank_you'.tr,
                                        style: Get.textTheme.headlineLarge!.copyWith(fontSize: 46, color: Get.theme.colorScheme.primaryContainer, fontWeight: FontWeight.bold)
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                        'your_order_has_been_placed'.tr,
                                        style: Get.textTheme.headlineLarge!.copyWith(color: Get.theme.colorScheme.primaryContainer.withOpacity(0.5), fontWeight: FontWeight.w400)
                                    )
                                  ]
                              )
                          )
                      )
                    ]
                );
              }
          )
      );
      sessionController.clearCart();
      Get.close(2);
    } else {
      if(response.statusCode == 500) {
        Get.snackbar('error'.tr, 'something_went_wrong_please_try_again_later'.tr, backgroundColor: Get.theme.colorScheme.error, colorText: Colors.white, snackPosition: SnackPosition.BOTTOM, duration: const Duration(seconds: 5));
      } else {
        Get.snackbar('error'.tr, 'order_data_are_not_valid_please_check_again'.tr, backgroundColor: Get.theme.colorScheme.error, colorText: Colors.white, snackPosition: SnackPosition.BOTTOM, duration: const Duration(seconds: 5));
      }
    }
  }
}