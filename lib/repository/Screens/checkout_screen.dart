import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../features/auth/controllers/cart_controller.dart';
import 'home/homeScreen.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Get.put(CartController());
    final cart = Get.find<CartController>();
    final addressCtrl = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: addressCtrl,
              decoration: const InputDecoration(labelText: 'Delivery address'),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Payment'),
                Text('Cash on Delivery'),
              ],
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () async {
                if (addressCtrl.text.isEmpty) {
                  Get.snackbar('Error', 'Please enter delivery address');
                  return;
                }

                final order = {
                  'userId': FirebaseAuth.instance.currentUser?.uid,
                  'items': cart.cartItems.entries.map((e) => {
                    'productId': e.key.id,
                    'name': e.key.name,
                    'price': e.key.price,
                    'quantity': e.value,
                  }).toList(),
                  'total': cart.totalPrice,
                  'status': 'pending',
                  'address': {'text': addressCtrl.text},
                  'createdAt': FieldValue.serverTimestamp(),
                };

                await FirebaseFirestore.instance.collection('orders').add(order);
                cart.clearCart();
                Get.snackbar('Success', 'Order placed successfully');
                Get.offAll(() => HomeScreen());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF7CB45),
                foregroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text(
                'Place Order',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}