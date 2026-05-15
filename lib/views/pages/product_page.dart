import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/product_controller.dart';
import '../../controllers/cart_controller.dart'; // Import CartController [cite: 76]
import '../../views/widgets/product_card.dart';

class ProductPage extends GetView<ProductController> {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Memanggil CartController yang sudah di-inject [cite: 166]
    final CartController cartController = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Home Page'),
        actions: [
          // Kriteria 3: Badge jumlah item keranjang menggunakan Obx() [cite: 111, 116]
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 8.0),
            child: Stack(
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () => Get.toNamed('/cart'), // Navigasi ke CartPage [cite: 13, 101]
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: Obx(() {
                    // Badge otomatis terupdate saat item ditambahkan [cite: 11, 117]
                    if (cartController.cartItems.isEmpty) return const SizedBox();
                    return Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '${cartController.cartItems.length}', // Menampilkan jumlah RxList [cite: 127]
                        style: const TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Obx(() {
          if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.blueGrey),
            );
          }
          return GridView.builder(
            itemCount: controller.products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 0.7, // Sesuaikan agar tombol tidak terpotong
            ),
            itemBuilder: (context, index) {
              final product = controller.products[index];
              return Column(
                children: [
                  Expanded(
                    child: ProductCard(
                      product: product,
                      onTap: () {
                        Get.toNamed("/detail", arguments: product);
                      },
                    ),
                  ),
                  // Kriteria 2: Button "Tambahkan ke Keranjang" [cite: 10, 95]
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        // Memanggil method addToCart dari CartController [cite: 78, 100]
                        cartController.addToCart(product);
                      },
                      child: const Text(
                        "Tambahkan ke Keranjang",
                        style: TextStyle(fontSize: 11),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        }),
      ),
    );
  }
}