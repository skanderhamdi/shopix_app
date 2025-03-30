class Payment {
  int? id;
  num? totalPrice;
  num? shippingFee;
  num? tax;
  Payment({this.id, this.totalPrice, this.shippingFee, this.tax});
  factory Payment.fromJSON(Map<String, dynamic> json) => Payment(
    id: json['id'],
    totalPrice: json['total_price'],
    shippingFee: json['shipping_fee'],
    tax: json['tax']
  );

  num get subTotal => totalPrice! - shippingFee! - tax!;
}