import 'package:shopix/Models/product.dart';

class ProductCart {
  Product? product;
  int? quantity;
  ProductCart({this.product, this.quantity});
  factory ProductCart.fromJSON(Map<String, dynamic> json) {
    return ProductCart(
      product: Product.fromJSON(json['product']),
      quantity: json['quantity']
    );
  }
  Map<String, dynamic> toJSON() => {
    'product': product?.toJSON(),
    'quantity': quantity
  };
}