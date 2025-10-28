import 'package:cloud_firestore/cloud_firestore.dart';
import '../Screens/order.dart';

class OrderRepository {
  final _db = FirebaseFirestore.instance;

  Future<void> createOrder(OrderModel order) async {
    await _db.collection('orders').doc(order.id).set(order.toMap());
  }

  Future<List<OrderModel>> getOrdersByUser(String userId) async {
    final snapshot = await _db
        .collection('orders')
        .where('userId', isEqualTo: userId)
        .get();

    return snapshot.docs
        .map((doc) => OrderModel.fromMap(doc.data(), doc.id))
        .toList();
  }
}
