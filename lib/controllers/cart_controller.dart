import 'package:get/get.dart';
import '../models/product.dart'; // Import model asli dari aslab

class CartController extends GetxController {
  // Menggunakan RxList untuk menyimpan daftar produk secara reaktif [cite: 9, 77]
  var cartItems = <Product>[].obs;

  // Method untuk menambah produk [cite: 9, 78, 79]
  void addToCart(Product product) {
    cartItems.add(product);
    Get.snackbar(
      "Berhasil", 
      "Item ditambahkan", // Sesuai contoh di PDF [cite: 29, 30]
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 1),
    );
  }

  // Method untuk menghapus produk [cite: 9, 84, 85]
  void removeFromCart(Product product) {
    cartItems.remove(product);
    Get.snackbar(
      "Dihapus", 
      "Item telah dihapus dari keranjang", // Sesuai contoh di PDF [cite: 73, 74]
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 1),
    );
  }

  // Method untuk menghitung total harga [cite: 9, 90, 91]
  double get totalPrice {
    return cartItems.fold(0, (sum, item) => sum + (item.price ?? 0));
  }
}