import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopix/Helper/session_controller.dart';

import '../Models/product_cart.dart';

class ShoppingCart extends GetView {
  const ShoppingCart({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SessionController>(
        builder: (controller) {
          List<ProductCart> cart = controller.getCart();
          if(cart.isEmpty) return const SizedBox();
          return Stack(
              children: [
                Material(
                    color: Get.theme.colorScheme.primary,
                    shape: const CircleBorder(),
                    child: InkWell(
                        splashColor: Colors.white.withOpacity(0.25),
                        highlightColor: Colors.white.withOpacity(0.2),
                        onTap: () {
                          Get.toNamed('/cart');
                        },
                        child: const Padding(
                            padding: EdgeInsets.all(15),
                            child: Icon(Icons.shopping_cart_outlined, color: Colors.white, size: 26)
                        )
                    )
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                        padding: const EdgeInsets.all(5),
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                            color: Get.theme.colorScheme.error,
                            shape: BoxShape.circle
                        ),
                        child: Center(
                            child: Text('${cart.length}', style: Get.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold, color: Colors.white))
                        )
                    )
                )
              ]
          );
        }
    );
  }
}