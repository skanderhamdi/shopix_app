import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Helper/constants.dart';
import '../../Helper/helper.dart';
import '../../Helper/session_controller.dart';
import '../../Models/order.dart';

class OrderHistoryController extends GetxController {

  RxBool loading = false.obs;
  RxBool loadingMore = false.obs;
  RxList<Order> orders = RxList([]);
  int limit = 5;

  final scrollController = ScrollController();

  @override
  void onInit() {
    getOrderHistory();
    super.onInit();
  }

  void scrollHandler() {
    if(!loadingMore.value && orders.isNotEmpty) {
      final maximumScroll = 0.95 * scrollController.position.maxScrollExtent;
      final scrolledSize = scrollController.position.pixels;
      if(scrolledSize >= maximumScroll) {
        getOrderHistory();
      }
    }
  }

  Future<void> getOrderHistory() async {
    if(orders.isEmpty) {
      loading.value = true;
    } else {
      loadingMore.value = true;
    }
    final authToken = Get.find<SessionController>().getUserSession()!.authToken;
    final response = await Helper.getConnect.get('${Constants.baseURL}/orders?limit=$limit&offset=${orders.length}', headers: {'Accept': 'application/json', 'Content-Type': 'application/json', 'Authorization': 'Bearer $authToken'});
    if(response.statusCode == 200) {
      Map<String,dynamic> data = json.decode(response.bodyString ?? '{}');
      List<dynamic> ordersData = data['data'] as List<dynamic>;
      if(ordersData.isEmpty) {
        scrollController.removeListener(scrollHandler);
      } else {
        orders.addAll(ordersData.map((e) => Order.fromJSON(e)).toList());
      }
    } else {
      if(response.statusCode == 440) {
        /// Session expired
        /// We need to redirect the user to login page
      }
      if(response.statusCode == 500) {
        Get.snackbar('error'.tr, 'something_went_wrong_please_try_again_later'.tr, backgroundColor: Get.theme.colorScheme.error, colorText: Colors.white, snackPosition: SnackPosition.BOTTOM, duration: const Duration(seconds: 5));
      } else {
        Get.snackbar('error'.tr, 'we_could_not_retrieve_orders'.tr, backgroundColor: Get.theme.colorScheme.error, colorText: Colors.white, snackPosition: SnackPosition.BOTTOM, duration: const Duration(seconds: 5));
      }
    }
    if(loading.value) loading.value = false;
    if(loadingMore.value) loadingMore.value = false;
  }
}