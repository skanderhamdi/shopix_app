import 'package:get/get.dart';

import '../../Models/product.dart';

class ProductController extends GetxController {
  /// Product to be passed in arguments
  late Product product;
  /// Current quantity
  RxInt quantity = 1.obs;
  @override
  void onInit() {
    product = Get.arguments as Product;
    super.onInit();
  }
  void incrementQuantity() => quantity.value++;
  void decrementQuantity() => quantity.value--;
}