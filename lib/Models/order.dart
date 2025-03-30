import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopix/Models/payment.dart';
import 'package:shopix/Models/product_cart.dart';

class Order {
  int? id;
  OrderStatus? status;
  DateTime? creationTime;
  DateTime? updateTime;
  String? shippingAddress;
  List<ProductCart>? products;
  Payment? payment;

  Order({this.id,
      this.status,
      this.creationTime,
      this.updateTime,
      this.shippingAddress,
      this.products,
      this.payment});

  factory Order.fromJSON(Map<String, dynamic> json) => Order(
    id: json['id'],
    status: OrderStatusHelper.getStatusFromString(json['status']),
    creationTime: DateTime.tryParse(json['created_at']) ?? DateTime.now(),
    updateTime: DateTime.tryParse(json['updated_at']) ?? DateTime.now(),
    shippingAddress: json['shipping_address'],
    products: (json['products'] as List<dynamic>).map((e) => ProductCart.fromJSON(e)).toList(),
    payment: Payment.fromJSON(json['payment'])
  );
}

enum OrderStatus {
  received, preparing, shipped, delivered, canceled
}

extension OrderStatusHelper on OrderStatus {
  static OrderStatus getStatusFromString(String status) {
    switch(status) {
      case 'received':
        return OrderStatus.received;
      case 'preparing':
        return OrderStatus.preparing;
      case 'shipped':
        return OrderStatus.shipped;
      case 'delivered':
        return OrderStatus.delivered;
      case 'canceled':
        return OrderStatus.canceled;
      default:
        return OrderStatus.received;
    }
  }

  Color get color => this != OrderStatus.canceled ? Get.theme.colorScheme.primary : Get.theme.colorScheme.error;
  Widget get icon {
    switch(this) {
      case OrderStatus.received:
        return Icon(Icons.south_east, color: Get.theme.colorScheme.primary);
      case OrderStatus.preparing:
        return Icon(Icons.access_time, color: Get.theme.colorScheme.primary);
      case OrderStatus.shipped:
        return Icon(Icons.local_shipping_outlined, color: Get.theme.colorScheme.primary);
      case OrderStatus.delivered:
        return Icon(Icons.check, color: Get.theme.colorScheme.primary);
      case OrderStatus.canceled:
        return Icon(Icons.close, color: Get.theme.colorScheme.error);
      default:
        return Icon(Icons.south_east, color: Get.theme.colorScheme.primary);
    }
  }
}