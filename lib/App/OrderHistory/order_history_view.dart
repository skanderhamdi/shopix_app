import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopix/App/OrderHistory/order_history_controller.dart';
import 'package:shopix/App/OrderHistory/widgets/order_row_item.dart';
import '../../Helper/constants.dart';
import '../../Widgets/list_view_loading.dart';
import '../../Widgets/shopping_cart.dart';

class OrderHistoryView extends GetView<OrderHistoryController> {
  const OrderHistoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(Constants.appLogo, width: 70, height: 70)
                        ),
                        const SizedBox(width: 15),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('orders_history'.tr, style: Get.textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.bold, color: Get.theme.colorScheme.primaryContainer)),
                              Text('see_your_previous_orders_with_us'.tr, style: Get.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w400, color: Get.theme.colorScheme.primaryContainer.withOpacity(0.5))),
                            ]
                        ),
                        const Spacer(),
                        const ShoppingCart()
                      ]
                  ),
                  const SizedBox(height: 25),
                  Expanded(
                    child: Obx(() =>
                    controller.loading.value
                        ? const ListShimmer()
                        : ListView.separated(
                            controller: controller.scrollController,
                            itemCount: controller.orders.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return OrderRowItem(order: controller.orders[index]);
                            },
                            separatorBuilder: (context, index) => const SizedBox(height: 20)
                          )
                    ),
                  ),
                  const SizedBox(height: 35),
                  Obx(() =>
                  controller.loadingMore.value
                      ? Center(child: SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Get.theme.colorScheme.primary, backgroundColor: Get.theme.colorScheme.primary.withOpacity(0.2))))
                      : const SizedBox()
                  )
                ]
            ),
          ),
        )
    );
  }
}