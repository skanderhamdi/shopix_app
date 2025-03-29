import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import '../../Helper/session_controller.dart';
import 'checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
  const CheckoutView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
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
                            Text('checkout'.tr, style: Get.textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold, color: Get.theme.colorScheme.primaryContainer))
                          ]
                      )
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text('summary_of_your_order'.tr, style: Get.textTheme.displayLarge!.copyWith(fontWeight: FontWeight.bold, color: Get.theme.colorScheme.primaryContainer)),
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
                              )
                            ]
                        )
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 40,
                      color: Get.theme.colorScheme.primaryContainer.withOpacity(0.05),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text('choose_your_payment_method'.tr, style: Get.textTheme.displayLarge!.copyWith(fontWeight: FontWeight.bold, color: Get.theme.colorScheme.primaryContainer)),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: MasonryGridView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        children: [
                          CupertinoButton(
                              padding: EdgeInsets.zero,
                              onPressed: controller.startPaymentProcess,
                              child: Image.asset('assets/payment_methods/stripe.png', width: Get.width, fit: BoxFit.fitWidth)
                          ),
                          CupertinoButton(
                              padding: EdgeInsets.zero,
                              onPressed: controller.startPaymentProcess,
                              child: Image.asset('assets/payment_methods/paypal.png', width: Get.width, fit: BoxFit.fitWidth)
                          ),
                          CupertinoButton(
                              padding: EdgeInsets.zero,
                              onPressed: controller.startPaymentProcess,
                              child: Image.asset('assets/payment_methods/apple_pay.png', width: Get.width, fit: BoxFit.fitWidth)
                          ),
                          CupertinoButton(
                              padding: EdgeInsets.zero,
                              onPressed: controller.startPaymentProcess,
                              child: Image.asset('assets/payment_methods/google_pay.png', width: Get.width, fit: BoxFit.fitWidth)
                          )
                        ]
                      )
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.shield, color: Color(0xFF0FDE3E)),
                        const SizedBox(width: 5),
                        Text('secured_payment'.tr, style: Get.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w400, color: const Color(0xFF0FDE3E)))
                      ]
                    )
                  ]
              )
          )
        )
    );
  }
}