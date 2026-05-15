import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/cart_controller.dart';

class CartPage extends GetView<CartController> {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Keranjang Belanja"), // Sesuai PDF [cite: 34, 67]
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.cartItems.length,
          itemBuilder: (context, index) {
            final product = controller.cartItems[index];
            return ListTile(
              leading: const Icon(Icons.shopping_bag_outlined),
              title: Text(product.title ?? 'No Name'), // Sesuai PDF [cite: 139]
              subtitle: Text('\$${product.price}'),
              trailing: IconButton(
                icon: const Icon(Icons.delete_outline, color: Colors.red),
                onPressed: () => controller.removeFromCart(product), // Fungsi hapus [cite: 140, 144]
              ),
            );
          },
        );
      }),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Total Harga:", style: TextStyle(fontWeight: FontWeight.bold)), // [cite: 39, 68, 156]
            Obx(() => Text(
              "\$${controller.totalPrice.toStringAsFixed(2)}", // Hitung total [cite: 44, 91, 157]
              style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            )),
          ],
        ),
      ),
    );
  }
}