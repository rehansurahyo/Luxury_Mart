import 'package:cloud_firestore/cloud_firestore.dart';
import '../Data/models/CategoryModel.dart';


class CategoryRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getCategories() async {
    try {
      final snapshot = await _db.collection('categories').get();
      if (snapshot.docs.isEmpty) return [];
      return snapshot.docs
          .map((doc) => CategoryModel.fromMap(doc.data(), doc.id))
          .toList();
    } on FirebaseException catch (e) {
      print(' Firestore Error fetching categories: ${e.code} - ${e.message}');
      return [];
    } catch (e) {
      print(' Error fetching categories: $e');
      return [];
    }
  }
}