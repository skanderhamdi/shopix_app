import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shopix/App/Home/widgets/product_grid_item.dart';
import 'package:shopix/Helper/session_controller.dart';
import '../../Helper/constants.dart';
import '../../Widgets/grid_view_loading.dart';
import '../../Widgets/shopping_cart.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: SingleChildScrollView(
          controller: controller.scrollController,
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
                        Text('${'hello'.tr}, ${Get.find<SessionController>().getUserSession()!.fullname}', style: Get.textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.bold, color: Get.theme.colorScheme.primaryContainer)),
                        Text('${'have_a_nice_shopping'.tr}!', style: Get.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w400, color: Get.theme.colorScheme.primaryContainer.withOpacity(0.5))),
                      ]
                  ),
                  const Spacer(),
                  const ShoppingCart()
                ]
              ),
              const SizedBox(height: 25),
              TextField(
                  style: Get.textTheme.titleLarge,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    filled: false,
                    hintText: 'search_for_products'.tr,
                    prefixIcon: Icon(Icons.search, color: Get.theme.colorScheme.primaryContainer.withOpacity(0.3)),
                    hintStyle: Get.textTheme.titleLarge!.copyWith(color: Get.theme.colorScheme.primaryContainer.withOpacity(0.3), fontWeight: FontWeight.w400),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Get.theme.colorScheme.primaryContainer.withOpacity(0.25),
                            width: 1
                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Get.theme.colorScheme.primaryContainer.withOpacity(0.25),
                            width: 1
                        )
                    ),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Get.theme.colorScheme.primaryContainer.withOpacity(0.25),
                            width: 1
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Get.theme.colorScheme.primary,
                            width: 1
                        )
                    ),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Get.theme.colorScheme.error,
                            width: 1
                        )
                    ),
                  )
              ),
              const SizedBox(height: 25),
              Text('discover_our_products'.tr, style: Get.textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold, color: Get.theme.colorScheme.primaryContainer)),
              const SizedBox(height: 25),
              Obx(() =>
                controller.loading.value
                    ? const GridShimmer()
                    : MasonryGridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.products.length,
                          itemBuilder: (context, index) => ProductGridItem(product: controller.products[index])
                      )
              ),
              const SizedBox(height: 35),
              Obx(() =>
                  controller.loadingMore.value
                    ? Center(child: SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Get.theme.colorScheme.primary, backgroundColor: Get.theme.colorScheme.primary.withOpacity(0.2))))
                    : const SizedBox()
              )
            ]
          )
        ),
      )
    );
  }
}