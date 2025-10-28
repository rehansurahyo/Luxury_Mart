import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Products collection
  CollectionReference get productsRef => _db.collection('products');
  CollectionReference get categoriesRef => _db.collection('categories');
  CollectionReference get ordersRef => _db.collection('orders');
  CollectionReference get usersRef => _db.collection('users');
  CollectionReference cartsRef(String userId) => _db.collection('carts').doc(userId).collection('items');

  Future<String> addDocument(String path, Map<String, dynamic> data) async {
    final ref = await _db.collection(path).add(data);
    return ref.id;
  }
}
