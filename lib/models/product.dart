class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String imageUrl;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.imageUrl,
  });

  // JSON'dan veriyi okuma (fromJson) simülasyonu
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      // API'den gelen fiyatı her ihtimale karşı ondalıklı sayıya (double) çeviriyoruz
      price: json['price'].toDouble(), 
      description: json['description'],
      imageUrl: json['image'],
    );
  }
}