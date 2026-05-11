import 'package:flutter/material.dart';
import 'screens/home_screen.dart'; 

void main() {
  runApp(const MiniKatalogApp());
}

class MiniKatalogApp extends StatelessWidget {
  const MiniKatalogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Katalog',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      // Uygulama açıldığında artık doğrudan bizim HomeScreen çalışacak
      home: const HomeScreen(), 
    );
  }
}