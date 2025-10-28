import 'package:cloud_firestore/cloud_firestore.dart';
import '../data/models/product_model.dart';

class ProductRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Fetch all products
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final snapshot = await _db.collection('products').get();
      if (snapshot.docs.isEmpty) return [];
      return snapshot.docs
          .map((doc) => ProductModel.fromMap(doc.data(), doc.id))
          .toList();
    } on FirebaseException catch (e) {
      print(" Firestore Error fetching products: ${e.code} - ${e.message}");
      return [];
    } catch (e) {
      print(" Error fetching products: $e");
      return [];
    }
  }

  Future<List<ProductModel>> getProductsByCategory(String category) async {
    try {
      final snapshot = await _db
          .collection('products')
          .where('category', isEqualTo: category)
          .get();
      if (snapshot.docs.isEmpty) return [];
      return snapshot.docs
          .map((doc) => ProductModel.fromMap(doc.data(), doc.id))
          .toList();
    } on FirebaseException catch (e) {
      print(" Firestore Error fetching category products: ${e.code} - ${e.message}");
      return [];
    } catch (e) {
      print(" Error fetching category products: $e");
      return [];
    }
  }
}