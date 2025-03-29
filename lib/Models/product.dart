class Product {
  int? id;
  String? name;
  String? image;
  String? description;
  String? category;
  num? price;
  num? rating;
  Product({this.id, this.name, this.image, this.description, this.category, this.price, this.rating});
  factory Product.fromJSON(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      description: json['description'],
      category: json['category'],
      price: json['price'] as num?,
      rating: json['rating'] as num?
    );
  }
  Map<String,dynamic> toJSON() => {
    'id': id,
    'name': name,
    'image': image,
    'description': description,
    'category': category,
    'price': price,
    'rating': rating
  };
}