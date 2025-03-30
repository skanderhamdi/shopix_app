import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Models/order.dart';

class OrderRowItem extends StatelessWidget {
  final Order order;
  const OrderRowItem({super.key, required this.order});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/order', arguments: order);
      },
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: order.status!.color.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: order.status!.icon
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${'order_id'.tr} #${order.id}', style: Get.textTheme.displayMedium!.copyWith(color: Get.theme.colorScheme.primaryContainer, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5),
                      Text(order.creationTime!.toString(), style: Get.textTheme.titleLarge!.copyWith(color: Get.theme.colorScheme.primaryContainer.withOpacity(0.5), fontWeight: FontWeight.w300)),
                    ]
                  )
                )
              ]
            )
          ),
          Icon(Icons.arrow_forward_ios_rounded, size: 18, color: order.status!.color)
        ]
      ),
    );
  }
}