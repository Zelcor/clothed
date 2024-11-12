class Clothing {
  final String id;
  final String imageUrl;
  final String title;
  final String category;
  final String size;
  final String brand;
  final double price;

  Clothing({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.category,
    required this.size,
    required this.brand,
    required this.price,
  });

  factory Clothing.fromMap(Map<String, dynamic> data) {
    return Clothing(
      id: data['id'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      title: data['title'] ?? '',
      category: data['category'] ?? '',
      size: data['size'] ?? '',
      brand: data['brand'] ?? '',
      price: data['price']?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'title': title,
      'category': category,
      'size': size,
      'brand': brand,
      'price': price,
    };
  }
}