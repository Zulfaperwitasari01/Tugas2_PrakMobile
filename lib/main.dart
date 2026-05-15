import 'package:belajar_getx/bindings/product_binding.dart';
import 'package:belajar_getx/bindings/cart_binding.dart'; // Import binding keranjang
import 'package:belajar_getx/views/pages/product_detail_page.dart';
import 'package:belajar_getx/views/pages/product_page.dart';
import 'package:belajar_getx/views/pages/cart_page.dart'; // Import halaman keranjang
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/product",
      // initialBinding memastikan CartController sudah siap sejak aplikasi dibuka
      initialBinding: CartBinding(), 
      getPages: [
        // Halaman Utama Produk
        GetPage(
          name: "/product",
          page: () => const ProductPage(),
          binding: ProductBinding(),
        ),

        // Halaman Detail Produk
        GetPage(
          name: "/detail", 
          page: () => const ProductDetailPage(),
        ),

        // Halaman Keranjang (Ini yang baru ditambahkan)
        GetPage(
          name: "/cart", 
          page: () => const CartPage(),
          binding: CartBinding(),
        ),
      ],
    );
  }
}