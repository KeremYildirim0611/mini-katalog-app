import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../data/favorites_data.dart'; 
import 'cart_screen.dart';
import 'product_detail_screen.dart';
import '../models/product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'Tümü';
  String searchQuery = ''; 
  int _selectedIndex = 0;

// Kategori listesi
  final List<String> categories = ['Tümü', 'Apple', 'Spor', 'Yazılım', 'Oto Teknoloji'];

  List<Product> get filteredProducts {
    List<Product> list = dummyProducts;
    
    // Filtreleme kelimeleri
    if (selectedCategory == 'Apple') list = list.where((p) => p.title.contains('AirPods') || p.title.contains('MacBook')  || p.title.contains("HomePod")).toList();
    if (selectedCategory == 'Spor') list = list.where((p) => p.title.contains('Saat')).toList();
    if (selectedCategory == 'Yazılım') list = list.where((p) => p.title.contains('Klavye')).toList();
    if (selectedCategory == 'Oto Teknoloji') list = list.where((p) => p.title.contains('Araç')).toList();

    if (searchQuery.isNotEmpty) {
      list = list.where((p) => p.title.toLowerCase().contains(searchQuery.toLowerCase())).toList();
    }
    
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keşfet', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black, size: 28),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen()));
            },
          )
        ],
      ),
      // ALT MENÜ TIKLAMASINA GÖRE SAYFA DEĞİŞİMİ
      body: _selectedIndex == 0 
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                // ARAMA ÇUBUĞU
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(16)),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value; 
                      });
                    },
                    decoration: const InputDecoration(icon: Icon(Icons.search, color: Colors.grey), border: InputBorder.none, hintText: 'Ürün ara...'),
                  ),
                ),
                const SizedBox(height: 20),
                
                // KAMPANYA AFİŞİ
                Container(
                  width: double.infinity,
                  height: 110,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [Colors.black87, Colors.black]),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('GIFT STORE', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
                            SizedBox(height: 6),
                            Text('Yeni nesil teknolojiler', style: TextStyle(color: Colors.white70, fontSize: 14)),
                          ],
                        ),
                      ),
                      Icon(Icons.apple, color: Colors.white.withValues(alpha: 0.9), size: 60),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // YATAY KATEGORİLER
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: categories.map((category) {
                      bool isSelected = selectedCategory == category;
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedCategory = category; 
                            });
                          },
                          child: Chip(
                            label: Text(category, style: TextStyle(color: isSelected ? Colors.white : Colors.black87)),
                            backgroundColor: isSelected ? Colors.black : Colors.grey[200],
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: BorderSide.none),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 20),
                
                // ÜRÜN KARTLARI
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.72, 
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: filteredProducts.length, 
                    itemBuilder: (context, index) {
                      final product = filteredProducts[index];
                      bool isFavorite = favoriteItems.contains(product); 

                      return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailScreen(product: product)));
                        },
                        child: Card(
                          elevation: 0,
                          color: Colors.grey[50],
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Stack( 
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Hero(
                                        tag: product.id.toString(),
                                        child: Image.network(
                                          product.imageUrl,
                                          fit: BoxFit.contain,
                                          width: double.infinity,
                                          errorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported, color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 0,
                                      top: 0,
                                      child: IconButton(
                                        icon: Icon(
                                          isFavorite ? Icons.favorite : Icons.favorite_border,
                                          color: isFavorite ? Colors.red : Colors.grey,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            if (isFavorite) {
                                              favoriteItems.remove(product);
                                            } else {
                                              favoriteItems.add(product);
                                            }
                                          });
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(product.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                                    const SizedBox(height: 6),
                                    Text('\$${product.price}', style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )

        // DİĞER MENÜLERE TIKLANDIĞINDA AÇILACAK SAYFA
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.construction, size: 80, color: Colors.grey[400]),
                const SizedBox(height: 16),
                Text('Bu Sayfa Yapım Aşamasında', style: TextStyle(fontSize: 20, color: Colors.grey[600], fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          
      // ALT NAVİGASYON ÇUBUĞU
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, 
        onTap: (index) {
          setState(() {
            _selectedIndex = index; 
          });
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 10,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Ana Sayfa'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Favoriler'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none), label: 'Bildirimler'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profil'),
        ],
      ),
    );
  }
}