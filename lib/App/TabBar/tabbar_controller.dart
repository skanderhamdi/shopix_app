import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/navigation_bar_item.dart';

class TabBarController extends GetxController {
  RxInt index = 0.obs;
  void setPage(int v) => index.value = v;
  /// Bottom navigation menu items
  List<NavigationBarItem> menu = [
    NavigationBarItem(titleKey: "home", icon: Icons.home_filled),
    NavigationBarItem(titleKey: "history", icon: Icons.history),
    NavigationBarItem(titleKey: "settings", icon: Icons.settings)
  ];
}