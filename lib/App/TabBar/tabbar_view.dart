import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopix/App/Home/home_view.dart';
import 'package:shopix/App/TabBar/tabbar_controller.dart';
import '../OrderHistory/order_history_view.dart';
import '../Settings/settings_view.dart';

class TabBarView extends GetView<TabBarController> {
  const TabBarView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Obx(() =>
            BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Get.theme.colorScheme.primary,
                currentIndex: controller.index.value,
                onTap: controller.setPage,
                items: controller.menu.map((item) {
                  return BottomNavigationBarItem(
                      icon: Icon(item.icon, color: Colors.white.withOpacity(0.25)),
                      label: '',
                      activeIcon: Icon(item.icon, color: Colors.white)
                  );
                }).toList()
            )
        ),
        body: Obx(() => IndexedStack(
            index: controller.index.value,
            children: const [
              HomeView(),
              OrderHistoryView(),
              SettingsView()
            ]
        ))
    );
  }
}