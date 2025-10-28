import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import '../../../repository/Screens/order.dart';
import '../../../repository/order_repository.dart';
import 'cart_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();
  final _repo = OrderRepository();
  final cartController = CartController.instance;
  final _auth = FirebaseAuth.instance;

  Future<void> placeOrder(String address) async {
    final userId = _auth.currentUser?.uid;
    if (userId == null) return;

    final order = OrderModel(
      id: const Uuid().v4(),
      userId: userId,
      items: cartController.cartItems.entries
          .map((e) => {
        "productId": e.key.id,
        "quantity": e.value,
        "price": e.key.price,
      })
          .toList(),
      totalAmount: cartController.totalPrice,
      address: address,
      paymentMethod: "COD",
      status: "Pending",
      createdAt: DateTime.now(),
    );

    await _repo.createOrder(order);
    cartController.cartItems.clear();
    Get.snackbar("Success", "Your order has been placed successfully!");
  }
}
