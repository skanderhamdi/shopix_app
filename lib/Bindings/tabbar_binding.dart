import 'package:get/get.dart';
import '../App/Home/home_controller.dart';
import '../App/OrderHistory/order_history_controller.dart';
import '../App/Settings/settings_controller.dart';
import '../App/TabBar/tabbar_controller.dart';

class TabBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TabBarController());
    Get.put(HomeController());
    Get.put(OrderHistoryController());
    Get.put(SettingsController());
  }
}