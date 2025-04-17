class Product {
  final String name;
  final String price;
  final String imagePath;
  int quantity;

  Product({
    required this.name,
    required this.price,
    required this.imagePath,
    this.quantity = 1,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Product &&
        other.name == name &&
        other.price == price &&
        other.imagePath == imagePath &&
        other.quantity == quantity;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        price.hashCode ^
        imagePath.hashCode ^
        quantity.hashCode;
  }
}
