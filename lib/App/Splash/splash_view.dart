import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Helper/constants.dart';
import 'splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Constants.appLogo, width: Get.width / 4, fit: BoxFit.cover),
            const SizedBox(height: 20),
            Text('Shopix', style: Get.textTheme.displayLarge!.copyWith(color: Get.theme.colorScheme.primary, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text('make_your_shopping_easier'.tr, style: Get.textTheme.headlineSmall!.copyWith(color: Get.theme.colorScheme.primaryContainer.withOpacity(0.5), fontWeight: FontWeight.w400)),
          ]
        )
      )
    );
  }
}