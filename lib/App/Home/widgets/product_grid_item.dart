import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Helper/session_controller.dart';
import '../../../Models/product.dart';

class ProductGridItem extends StatelessWidget {
  final Product product;
  const ProductGridItem({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            elevation: 5,
            shadowColor: Colors.black.withOpacity(0.2),
            child: InkWell(
                borderRadius: BorderRadius.circular(10),
                splashColor: Get.theme.colorScheme.primary.withOpacity(0.15),
                highlightColor: Get.theme.colorScheme.primary.withOpacity(0.1),
                onTap: () {
                  Get.toNamed('/product', arguments: product);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CachedNetworkImage(
                          imageUrl: product.image ?? '',
                          width: Get.width,
                          fit: BoxFit.fitHeight,
                          placeholder: (_,__) => Center(
                              child: SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.black.withOpacity(0.25), backgroundColor: Colors.black.withOpacity(0.15), strokeWidth: 2,))
                          ),
                          errorWidget: (_,__,___) => Center(
                              child: Icon(Icons.error_outline_rounded, color: Get.theme.colorScheme.error)
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(product.name ?? 'unnamed'.tr, style: Get.textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold, color: Get.theme.colorScheme.primaryContainer)),
                        const SizedBox(height: 5),
                        Text(product.category ?? 'not_categorized'.tr, style: Get.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500, color: Get.theme.colorScheme.primaryContainer.withOpacity(0.5))),
                        const SizedBox(height: 5),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${product.price ?? '0'} €', style: Get.textTheme.displayMedium!.copyWith(fontWeight: FontWeight.bold, color: Get.theme.colorScheme.primary)),
                              Row(
                                  children: [
                                    const Icon(Icons.star_rounded, color: Color(0xFFFFCE00), size: 18),
                                    const SizedBox(width: 2.5),
                                    Text('${product.rating == 0 || product.rating == null ? '--' : product.rating}', style: Get.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold, color: const Color(0xFFFFCE00))),
                                  ]
                              )
                            ]
                        )
                      ]
                  )
                )
            )
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Material(
              color: Colors.white,
              shape: const CircleBorder(),
              elevation: 10,
              shadowColor: Colors.black.withOpacity(0.2),
              child: InkWell(
                  splashColor: Get.theme.colorScheme.primary.withOpacity(0.25),
                  highlightColor: Get.theme.colorScheme.primary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(100),
                  onTap: () {
                    Get.find<SessionController>().addToCart(product, 1);
                    Get.snackbar(
                        'information'.tr,
                        '1x ${product.name!} ${'has_been_added_to_cart'.tr}',
                        backgroundColor: Get.theme.colorScheme.secondary,
                        snackPosition: SnackPosition.BOTTOM,
                        duration: const Duration(seconds: 5),
                        colorText: Colors.white
                    );
                  },
                  child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Icon(Icons.shopping_cart_outlined, color: Get.theme.colorScheme.primary, size: 26)
                  )
              )
          ),
        )
      ]
    );
  }
}