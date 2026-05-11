import 'package:flutter/material.dart';
import '../models/product.dart';
import '../data/cart_data.dart';

class ProductDetailScreen extends StatelessWidget {
  // Bu sayfa açılırken hangi ürünün tıklandığını bilmek zorunda (Route Argument)
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black), // Geri tuşu rengi
        title: Text(product.title, style: const TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ürün Görseli 
            Center(
              child: Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child : Hero(
                  tag: product.id.toString(), // Her resmin benzersiz bir kimliği olmalıdır
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.contain,
                    width: double.infinity,
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported, color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            // Başlık ve Fiyat
            Text(product.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('\$${product.price}', style: const TextStyle(fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            
            // Açıklama
            const Text('Açıklama', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(product.description, style: const TextStyle(fontSize: 16, color: Colors.grey, height: 1.5)),
            const SizedBox(height: 40),
            
            // Sepete Ekle Butonu 
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  // Ürünü sepete ekle
                  cartItems.add(product);
                  // Kullanıcıya sepete eklendiğine dair küçük bir siyah uyarı mesajı (SnackBar) gösterme işlemi
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${product.title} sepete eklendi!'),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                child: const Text('Sepete Ekle', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}