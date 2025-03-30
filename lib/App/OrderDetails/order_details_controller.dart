import 'package:get/get.dart';

import '../../Models/order.dart';

class OrderDetailsController extends GetxController {
  /// Order to be passed in arguments
  late Order order;
  num tax = 0.01;
  @override
  void onInit() {
    order = Get.arguments as Order;
    super.onInit();
  }
}