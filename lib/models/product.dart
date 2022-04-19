class Product {
  final String? id;
  final String name;
  final String description;
  final double price;
  final String image;

  Product({
    this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  Product.fromMap(Map<String, dynamic> map)
      : name = map['name'] ?? "",
        id = map['id'] ?? "",
        description = map['description'] ?? "",
        price = map['price'] ?? "",
        image = map['image'] ?? "";

  Map<String, dynamic> toMap(String id) {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'image': image,
    };
  }
}
