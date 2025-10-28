import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/product_model.dart';
import '../../features/auth/controllers/cart_controller.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductModel product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    Get.put(CartController()); // Safe initialization

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                product.image,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Image.asset(
                  'assets/images/logo.png', // Ensure this exists
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Name
            Text(
              product.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Price
            Text(
              'Rs. ${product.price.toStringAsFixed(0)}',
              style: const TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),

            // Unit
            Text(
              'Unit: ${product.unit.isNotEmpty ? product.unit : 'N/A'}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),

            // Description
            Text(
              'Description: ${product.description.isNotEmpty ? product.description : 'N/A'}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),

            // In Stock
            Text(
              'In Stock: ${product.inStock ? 'Yes' : 'No'}',
              style: const TextStyle(fontSize: 16, color: Colors.green),
            ),
            const SizedBox(height: 24),

            // Add to Cart Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final cartController = Get.find<CartController>();
                  cartController.addToCart(product);
                  Get.snackbar(
                    "Added to Cart 🛒",
                    "${product.name} added!",
                    backgroundColor: Colors.green,
                    colorText: Colors.white,
                  );
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Add to Cart",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}