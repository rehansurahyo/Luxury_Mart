import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String id;
  final String name;
  final String image;
  final double price;
  final String category;
  final String unit;
  final String description;
  final bool inStock;

  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.category,
    this.unit = '',
    this.description = '',
    this.inStock = false,
  });


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ProductModel &&
              runtimeType == other.runtimeType &&
              id == other.id;


  @override
  int get hashCode => id.hashCode;

  factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    if (!doc.exists || doc.data() == null) {
      print('Warning: Document does not exist or has no data for ID: ${doc.id}');
      throw Exception('Document does not exist or has no data for ID: ${doc.id}');
    }
    final data = doc.data()!;
    return ProductModel(
      id: doc.id,
      name: data['name'] ?? '',
      image: data['image'] ?? '',
      price: _toDouble(data['price']),
      category: data['categoryId'] ?? '',
      unit: data['unit'] ?? '',
      description: data['description'] ?? '',
      inStock: data['inStock'] ?? false,
    );
  }

  factory ProductModel.fromMap(Map<String, dynamic> data, String id) {
    return ProductModel(
      id: id,
      name: data['name'] ?? '',
      image: data['image'] ?? '',
      price: _toDouble(data['price']),
      category: data['categoryId'] ?? '',
      unit: data['unit'] ?? '',
      description: data['description'] ?? '',
      inStock: data['inStock'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'categoryId': category,
      'unit': unit,
      'description': description,
      'inStock': inStock,
    };
  }

  static double _toDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) {
      final parsed = double.tryParse(value.trim());
      return parsed ?? 0.0; // Trim string to avoid whitespace issues
    }

    return 0.0;
  }
}