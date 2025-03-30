import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopix/Models/order.dart';
import '../Cart/widgets/product_cart_item.dart';
import 'order_details_controller.dart';

class OrderDetailsView extends GetView<OrderDetailsController> {
  const OrderDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back_rounded, color: Get.theme.colorScheme.primaryContainer),
          ),
          centerTitle: false,
          title: Text('${'order_id'.tr} #${controller.order.id}', style: Get.textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold, color: Get.theme.colorScheme.primaryContainer))
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                                children: [
                                  Icon(Icons.radio_button_checked_rounded, color: controller.order.status!.color),
                                  const SizedBox(width: 15),
                                  Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: controller.order.status!.color.withOpacity(0.25),
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: controller.order.status!.icon
                                  ),
                                  const SizedBox(width: 15),
                                  Expanded(
                                      child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(controller.order.status!.name.tr, style: Get.textTheme.displayMedium!.copyWith(color: Get.theme.colorScheme.primaryContainer, fontWeight: FontWeight.bold)),
                                            const SizedBox(height: 5),
                                            Text(controller.order.updateTime!.toString(), style: Get.textTheme.titleLarge!.copyWith(color: Get.theme.colorScheme.primaryContainer.withOpacity(0.5), fontWeight: FontWeight.w300)),
                                          ]
                                      )
                                  )
                                ]
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            height: 40,
                            color: Get.theme.colorScheme.primaryContainer.withOpacity(0.05),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Text('ordered_products'.tr, style: Get.textTheme.displayLarge!.copyWith(fontWeight: FontWeight.bold, color: Get.theme.colorScheme.primaryContainer)),
                          ),
                          const SizedBox(height: 20),
                          ListView.separated(
                              padding: const EdgeInsets.symmetric(horizontal: 30),
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (_, index) => ProductCartItem(
                                  productCart: controller.order.products![index],
                                  onDelete: null
                              ),
                              separatorBuilder: (_, __) => const SizedBox(height: 15),
                              shrinkWrap: true,
                              itemCount: controller.order.products!.length
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
                                          Text('${controller.order.payment!.subTotal} €', style: Get.textTheme.headlineMedium!.copyWith(color: Get.theme.colorScheme.primaryContainer, fontWeight: FontWeight.w400))
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
                                                Text('${controller.order.payment!.tax} €', style: Get.textTheme.headlineMedium!.copyWith(color: Get.theme.colorScheme.primaryContainer, fontWeight: FontWeight.w400))
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
                                                Text('${controller.order.payment!.shippingFee} €', style: Get.textTheme.headlineMedium!.copyWith(color: Get.theme.colorScheme.primaryContainer, fontWeight: FontWeight.w400))
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
                                          Text('${controller.order.payment!.totalPrice} €', style: Get.textTheme.displayLarge!.copyWith(color: Get.theme.colorScheme.primary, fontWeight: FontWeight.bold))
                                        ]
                                    )
                                  ]
                              )
                          )
                        ]
                    )
                  ]
              )
          )
        )
    );
  }
}