import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shopix/Models/product.dart';

import '../Models/product_cart.dart';
import '../Models/user.dart';

class SessionController extends GetxController {

  late GetStorage getStorageBox;

  Future<void> initialize() async {
    await GetStorage.init('session');
    getStorageBox = GetStorage('session');
  }

  /// User session stuff

  void setUserSession(User? user) {
    getStorageBox.write('user', user?.toJSON());
  }

  User? getUserSession() {
    if(getStorageBox.read('user') != null) {
      return User.fromJSON(getStorageBox.read('user'));
    } else {
      return null;
    }
  }

  /// Cart stuff

  void addToCart(Product product, int quantity) {
    List<ProductCart> cart = getCart();
    cart.add(
        ProductCart(
            product: product,
            quantity: quantity
        )
    );
    List<dynamic> encodedCart = cart.map((e) => e.toJSON()).toList();
    getStorageBox.write('cart', encodedCart);
    update();
  }

  void removeFromCart(int index) {
    List<ProductCart> cart = getCart();
    if(cart.isNotEmpty) {
      cart.removeAt(index);
      List<dynamic> encodedCart = cart.map((e) => e.toJSON()).toList();
      getStorageBox.write('cart', encodedCart);
      update();
    }
  }

  void clearCart() {
    getStorageBox.write('cart', null);
    update();
  }

  List<ProductCart> getCart() {
    if(getStorageBox.read('cart') != null) {
      return (getStorageBox.read('cart') as List<dynamic>).map((e) => ProductCart.fromJSON(e)).toList();
    }
    return [];
  }
}