import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Helper/session_controller.dart';
import 'cart_controller.dart';
import 'widgets/product_cart_item.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: GetBuilder<SessionController>(
          builder: (_) {
            if(controller.sessionController.getCart().isEmpty) {
              return const SizedBox();
            } else {
              return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Get.theme.colorScheme.primary,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                            foregroundColor: Colors.white
                        ),
                        onPressed: () {
                          Get.toNamed('/checkout');
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('go_to_checkout'.tr, style: Get.textTheme.headlineMedium!.copyWith(color: Colors.white, fontWeight: FontWeight.w500)),
                              Text('${controller.computeTotalPrice.toStringAsFixed(2)} €', style: Get.textTheme.headlineMedium!.copyWith(color: Colors.white, fontWeight: FontWeight.bold))
                            ]
                        )
                    )
                );
            }
          }
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              child: GetBuilder<SessionController>(
                builder: (_) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 30, top: 20),
                        child: Row(
                            children: [
                              IconButton(
                                onPressed: () => Get.back(),
                                icon: Icon(Icons.arrow_back_rounded, color: Get.theme.colorScheme.primaryContainer),
                              ),
                              const SizedBox(width: 15),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('my_cart'.tr, style: Get.textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold, color: Get.theme.colorScheme.primaryContainer)),
                                    const SizedBox(height: 2.5),
                                    Text('x_items_in_the_cart'.tr.replaceAll('{{x}}', '${controller.sessionController.getCart().length}'), style: Get.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500, color: Get.theme.colorScheme.primaryContainer.withOpacity(0.5))),
                                  ]
                              ),
                              const Spacer(),
                              Material(
                                  color: Get.theme.colorScheme.error,
                                  shape: const CircleBorder(),
                                  child: InkWell(
                                      splashColor: Colors.white.withOpacity(0.25),
                                      highlightColor: Colors.white.withOpacity(0.2),
                                      onTap: () {
                                        controller.clearCart();
                                      },
                                      child: const Padding(
                                          padding: EdgeInsets.all(15),
                                          child: Icon(CupertinoIcons.trash, color: Colors.white, size: 26)
                                      )
                                  )
                              )
                            ]
                        ),
                      ),
                      const SizedBox(height: 20),
                      if(controller.sessionController.getCart().isEmpty)
                        const SizedBox()
                      else Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Text('ordered_products'.tr, style: Get.textTheme.displayLarge!.copyWith(fontWeight: FontWeight.bold, color: Get.theme.colorScheme.primaryContainer)),
                          ),
                          const SizedBox(height: 20),
                          ListView.separated(
                              padding: const EdgeInsets.symmetric(horizontal: 30),
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (_, index) => ProductCartItem(
                                  productCart: controller.sessionController.getCart()[index],
                                  onDelete: () {
                                    controller.sessionController.removeFromCart(index);
                                  }
                              ),
                              separatorBuilder: (_, __) => const SizedBox(height: 15),
                              shrinkWrap: true,
                              itemCount: controller.sessionController.getCart().length
                          ),
                          const SizedBox(height: 20),
                          Container(
                            height: 40,
                            color: Get.theme.colorScheme.primaryContainer.withOpacity(0.05),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30),
                              child: Column(
                                  children: [
                                    const SizedBox(height: 10),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('sub_total'.tr, style: Get.textTheme.headlineMedium!.copyWith(color: Get.theme.colorScheme.primaryContainer, fontWeight: FontWeight.w400)),
                                          Text('${controller.computeSubTotal} €', style: Get.textTheme.headlineMedium!.copyWith(color: Get.theme.colorScheme.primaryContainer, fontWeight: FontWeight.w400))
                                        ]
                                    ),
                                    const SizedBox(height: 20),
                                    DottedLine(dashColor: Get.theme.colorScheme.primaryContainer.withOpacity(0.3)),
                                    const SizedBox(height: 20),
                                    Column(
                                        children: [
                                          Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('tax'.tr, style: Get.textTheme.headlineMedium!.copyWith(color: Get.theme.colorScheme.primaryContainer, fontWeight: FontWeight.w400)),
                                                Text('${(controller.tax * controller.computeSubTotal).toStringAsFixed(2)} €', style: Get.textTheme.headlineMedium!.copyWith(color: Get.theme.colorScheme.primaryContainer, fontWeight: FontWeight.w400))
                                              ]
                                          ),
                                          const SizedBox(height: 7.5),
                                          Row(
                                              children: [
                                                Icon(Icons.info_outline_rounded, color: Get.theme.colorScheme.primaryContainer.withOpacity(0.5), size: 18),
                                                const SizedBox(width: 5),
                                                Text('tax_of_x_applied'.tr.replaceAll('{{x}}', '${(controller.tax * 100).toInt()}'), style: Get.textTheme.headlineSmall!.copyWith(color: Get.theme.colorScheme.primaryContainer.withOpacity(0.5), fontWeight: FontWeight.w400)),
                                              ]
                                          )
                                        ]
                                    ),
                                    const SizedBox(height: 20),
                                    DottedLine(dashColor: Get.theme.colorScheme.primaryContainer.withOpacity(0.3)),
                                    const SizedBox(height: 20),
                                    Column(
                                        children: [
                                          Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('shipping_fees'.tr, style: Get.textTheme.headlineMedium!.copyWith(color: Get.theme.colorScheme.primaryContainer, fontWeight: FontWeight.w400)),
                                                Text('${controller.shippingFee} €', style: Get.textTheme.headlineMedium!.copyWith(color: Get.theme.colorScheme.primaryContainer, fontWeight: FontWeight.w400))
                                              ]
                                          ),
                                          const SizedBox(height: 7.5),
                                          Row(
                                              children: [
                                                Icon(Icons.check_circle_outline_rounded, color: Get.theme.colorScheme.primary, size: 18),
                                                const SizedBox(width: 5),
                                                Text('DHL Office', style: Get.textTheme.headlineSmall!.copyWith(color: Get.theme.colorScheme.primary, fontWeight: FontWeight.w400)),
                                              ]
                                          )
                                        ]
                                    ),
                                    const SizedBox(height: 20),
                                    DottedLine(dashColor: Get.theme.colorScheme.primary),
                                    const SizedBox(height: 20),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('total'.tr.toUpperCase(), style: Get.textTheme.displayLarge!.copyWith(color: Get.theme.colorScheme.primary, fontWeight: FontWeight.bold)),
                                          Text('${controller.computeTotalPrice.toStringAsFixed(2)} €', style: Get.textTheme.displayLarge!.copyWith(color: Get.theme.colorScheme.primary, fontWeight: FontWeight.bold))
                                        ]
                                    ),
                                    const SizedBox(height: 20),
                                    DottedLine(dashColor: Get.theme.colorScheme.primary),
                                  ]
                              )
                          ),
                          const SizedBox(height: 150)
                        ]
                      )
                    ]
                )
              )
          ),
        )
    );
  }
}