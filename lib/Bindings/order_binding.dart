import 'package:get/get.dart';
import '../App/OrderDetails/order_details_controller.dart';

class OrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OrderDetailsController());
  }
}