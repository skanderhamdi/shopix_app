import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopix/Helper/session_controller.dart';
import '../../Helper/constants.dart';
import '../../Helper/helper.dart';
import '../../Models/product.dart';

class HomeController extends GetxController {

  /// List of products
  RxList<Product> products = RxList([]);
  int limit = 5;

  RxBool loading = false.obs;
  RxBool loadingMore = false.obs;

  final scrollController = ScrollController();

  @override
  void onInit() {
    getProducts();
    scrollController.addListener(scrollHandler);
    super.onInit();
  }

  void scrollHandler() {
    if(!loadingMore.value && products.isNotEmpty) {
      final maximumScroll = 0.95 * scrollController.position.maxScrollExtent;
      final scrolledSize = scrollController.position.pixels;
      if(scrolledSize >= maximumScroll) {
        getProducts();
      }
    }
  }

  Future<void> getProducts() async {
    if(products.isEmpty) {
      loading.value = true;
    } else {
      loadingMore.value = true;
    }
    final authToken = Get.find<SessionController>().getUserSession()!.authToken;
    final response = await Helper.getConnect.get('${Constants.baseURL}/products?limit=$limit&offset=${products.length}', headers: {'Accept': 'application/json', 'Content-Type': 'application/json', 'Authorization': 'Bearer $authToken'});
    if(response.statusCode == 200) {
      Map<String,dynamic> data = json.decode(response.bodyString ?? '{}');
      List<dynamic> productsData = data['data'] as List<dynamic>;
      if(productsData.isEmpty) {
        scrollController.removeListener(scrollHandler);
      } else {
        products.addAll(productsData.map((e) => Product.fromJSON(e)).toList());
      }
    } else {
      if(response.statusCode == 500) {
        Get.snackbar('error'.tr, 'something_went_wrong_please_try_again_later'.tr, backgroundColor: Get.theme.colorScheme.error, colorText: Colors.white, snackPosition: SnackPosition.BOTTOM, duration: const Duration(seconds: 5));
      } else {
        Get.snackbar('error'.tr, 'we_could_not_retrieve_products'.tr, backgroundColor: Get.theme.colorScheme.error, colorText: Colors.white, snackPosition: SnackPosition.BOTTOM, duration: const Duration(seconds: 5));
      }
    }
    if(loading.value) loading.value = false;
    if(loadingMore.value) loadingMore.value = false;
  }
}