import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:shopix/Models/product_cart.dart';

class ProductCartItem extends StatelessWidget {
  final ProductCart productCart;
  final Function? onDelete;
  const ProductCartItem({super.key, required this.onDelete, required this.productCart});
  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          const SizedBox(width: 15),
          SlidableAction(
            onPressed: (_) => onDelete!(),
            backgroundColor: Get.theme.colorScheme.error,
            foregroundColor: Colors.white,
            icon: CupertinoIcons.trash,
            label: 'delete'.tr,
            borderRadius: BorderRadius.circular(15)
          )
        ]
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: productCart.product!.image ?? '',
              width: 60,
              height: 60,
              fit: BoxFit.cover,
              errorWidget: (_,__,___) => Center(
                  child: Icon(Icons.error_outline_rounded, color: Get.theme.colorScheme.error)
              ),
              placeholder: (_,__) => Center(
                  child: SizedBox(width: 15, height: 15, child: CircularProgressIndicator(color: Colors.black.withOpacity(0.25), backgroundColor: Colors.black.withOpacity(0.15), strokeWidth: 1.5))
              ),
            )
          ),
          const SizedBox(width: 15),
          Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(productCart.product!.name ?? 'unnamed'.tr, style: Get.textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold, color: Get.theme.colorScheme.primaryContainer)),
                      Text('x${productCart.quantity}', style: Get.textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold, color: Get.theme.colorScheme.primaryContainer))
                    ]
                  ),
                  const SizedBox(height: 5),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(productCart.product!.category ?? 'not_categorized'.tr, style: Get.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500, color: Get.theme.colorScheme.primaryContainer.withOpacity(0.5))),
                        Text('${productCart.product!.price} €', style: Get.textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold, color: Get.theme.colorScheme.primary))
                      ]
                  )
                ]
              )
          )
        ]
      ),
    );
  }
}