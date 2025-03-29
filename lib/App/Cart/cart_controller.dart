import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopix/Models/product_cart.dart';

import '../../Helper/session_controller.dart';

class CartController extends GetxController {

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

  void clearCart() {
    Get.dialog(
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10),
                                Text(
                                    'warning'.tr,
                                    style: Get.textTheme.headlineSmall!.copyWith(color: Colors.black)
                                ),
                                const SizedBox(height: 15),
                                Text(
                                    'are_you_sure_you_want_to_clear_your_cart'.tr,
                                    style: Get.textTheme.titleLarge!.copyWith(color: Colors.black.withOpacity(0.5))
                                ),
                                const SizedBox(height: 20),
                                Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                          onPressed: () => Get.back(),
                                          style: TextButton.styleFrom(
                                              foregroundColor: Colors.white
                                          ),
                                          child: Text('cancel'.tr, style: Get.textTheme.headlineSmall!.copyWith(color: Colors.black.withOpacity(0.4)))
                                      ),
                                      const SizedBox(height: 10),
                                      TextButton(
                                          style: TextButton.styleFrom(
                                              backgroundColor:  Get.theme.colorScheme.error.withOpacity(0.2),
                                              foregroundColor: Get.theme.colorScheme.error
                                          ),
                                          onPressed: () {
                                            Get.back();
                                            sessionController.clearCart();
                                          },
                                          child: Text(
                                              'delete'.tr,
                                              style: Get.textTheme.headlineSmall!.copyWith(color: Get.theme.colorScheme.error, fontWeight: FontWeight.bold)
                                          )
                                      )
                                    ]
                                )
                              ]
                          )
                      )
                  )
              )
            ]
        )
    );
  }
}