import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../data/models/product_model.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  var products = <ProductModel>[].obs;
  var loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      loading.value = true;
      final snapshot = await _db.collection('Products').get();
      print('Snapshot docs count: ${snapshot.docs.length}'); // Debug
      if (snapshot.docs.isEmpty) {
        products.clear();
        print(' No documents found in "Products" collection');
        return;
      }
      final fetchedProducts = snapshot.docs
          .map((doc) {
        print('Doc ID: ${doc.id}, data: ${doc.data()}');
        return ProductModel.fromSnapshot(doc as DocumentSnapshot<Map<String, dynamic>>);
      })
          .toList();
      products.assignAll(fetchedProducts);
    } on FirebaseException catch (e) {
      String message = 'Failed to load products';
      switch (e.code) {
        case 'permission-denied':
          message = 'Permission denied. Check your Firestore rules.';
          break;
        case 'unavailable':
          message = 'Network error. Please check your connection.';
          break;
        default:
          message = e.message ?? message;
      }
      print(' Firestore Error: $e');
      Get.snackbar('Error', message);
    } catch (e, stackTrace) {
      print(' Error fetching products: $e\nStack Trace: $stackTrace');
      Get.snackbar('Error', 'Failed to load products from Firestore');
    } finally {
      loading.value = false;
    }
  }

  /// Add new product
  Future<void> addProduct(ProductModel product) async {
    try {
      await _db.collection('Products').add(product.toMap());
      await fetchProducts();
      Get.snackbar('Success', 'Product added successfully');
    } on FirebaseException catch (e) {
      String message = 'Failed to add product';
      if (e.code == 'permission-denied') {
        message = 'Permission denied. Update Firestore rules for write access.';
      }
      print(' Error adding product: $e');
      Get.snackbar('Error', message);
    } catch (e, stackTrace) {
      print(' Error adding product: $e\nStack Trace: $stackTrace');
      Get.snackbar('Error', 'Failed to add product');
    }
  }
}