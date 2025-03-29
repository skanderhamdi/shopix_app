import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopix/Helper/session_controller.dart';
import '../../Widgets/shopping_cart.dart';
import 'product_controller.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Get.theme.colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    foregroundColor: Colors.white
                  ),
                  onPressed: () {
                    Get.find<SessionController>().addToCart(controller.product, controller.quantity.value);
                    Get.snackbar(
                        'information'.tr,
                        '${controller.quantity.value}x ${controller.product.name!} ${'has_been_added_to_cart'.tr}',
                        backgroundColor: Get.theme.colorScheme.secondary,
                        snackPosition: SnackPosition.BOTTOM,
                        duration: const Duration(seconds: 5),
                        colorText: Colors.white
                    );
                  },
                  child: Row(
                    children: [
                      Text('add_to_cart'.tr, style: Get.textTheme.headlineMedium!.copyWith(color: Colors.white, fontWeight: FontWeight.w500)),
                      const SizedBox(width: 10),
                      Obx(() =>
                          Text('${((controller.product.price ?? 0) * controller.quantity.value).toStringAsFixed(2)} €', style: Get.textTheme.headlineMedium!.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                      )
                    ]
                  )
              ),
              Obx(() =>
                  Row(
                      children: [
                        IconButton(
                          onPressed: controller.quantity.value != 1 ? controller.decrementQuantity : null,
                          icon: Icon(Icons.remove_circle_outline_rounded, color: controller.quantity.value != 1 ? Get.theme.colorScheme.primary : Get.theme.colorScheme.primary.withOpacity(0.5))
                        ),
                        const SizedBox(width: 15),
                        Text('${controller.quantity.value}', style: Get.textTheme.headlineMedium!.copyWith(color: Get.theme.colorScheme.primary, fontWeight: FontWeight.w500)),
                        const SizedBox(width: 15),
                        IconButton(
                            onPressed: controller.quantity.value < 99 ? controller.incrementQuantity : null,
                            icon: Icon(Icons.add_circle_outline_rounded, color: controller.quantity.value < 99 ? Get.theme.colorScheme.primary : Get.theme.colorScheme.primary.withOpacity(0.5))
                        ),
                      ]
                  )
              )
            ]
          )
        ),
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
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(controller.product.name ?? 'unnamed'.tr, style: Get.textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold, color: Get.theme.colorScheme.primaryContainer)),
                                  const SizedBox(height: 2.5),
                                  Text(controller.product.category ?? 'not_categorized'.tr, style: Get.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500, color: Get.theme.colorScheme.primaryContainer.withOpacity(0.5))),
                                ]
                            ),
                            const Spacer(),
                            const ShoppingCart()
                          ]
                      ),
                    ),
                    const SizedBox(height: 20),
                    CachedNetworkImage(
                      imageUrl: controller.product.image ?? '',
                      width: Get.width,
                      fit: BoxFit.fitHeight,
                      placeholder: (_,__) => Center(
                          child: SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.black.withOpacity(0.25), backgroundColor: Colors.black.withOpacity(0.15), strokeWidth: 2,))
                      ),
                      errorWidget: (_,__,___) => Center(
                          child: Icon(Icons.error_outline_rounded, color: Get.theme.colorScheme.error)
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Text(controller.product.name ?? 'unnamed'.tr, style: Get.textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold, color: Get.theme.colorScheme.primaryContainer)),
                                      Row(
                                          children: [
                                            const Icon(Icons.star_rounded, color: Color(0xFFFFCE00), size: 18),
                                            const SizedBox(width: 2.5),
                                            Text('${controller.product.rating == 0 || controller.product.rating == null ? '--' : controller.product.rating}', style: Get.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold, color: const Color(0xFFFFCE00))),
                                          ]
                                      )
                                    ]
                                  )
                                ),
                                Text('${controller.product.price ?? '0'} €', style: Get.textTheme.displayMedium!.copyWith(fontWeight: FontWeight.bold, color: Get.theme.colorScheme.primary)),
                              ]
                            ),
                            const SizedBox(height: 2.5),
                            Text(controller.product.category ?? 'not_categorized'.tr, style: Get.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500, color: Get.theme.colorScheme.primaryContainer.withOpacity(0.5))),
                          ]
                      ),
                    ),
                    const SizedBox(height: 25),
                    if(controller.product.description?.isNotEmpty ?? false)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(controller.product.description!, style: Get.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500, color: Get.theme.colorScheme.primaryContainer.withOpacity(0.5))),
                      )
                  ]
              )
          ),
        )
    );
  }
}