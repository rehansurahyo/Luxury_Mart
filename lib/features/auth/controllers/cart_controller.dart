import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:luxury_mart/data/models/product_model.dart';
import 'package:luxury_mart/repository/Screens/cart/cart_item.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  final RxMap<ProductModel, int> _cartItems = <ProductModel, int>{}.obs;
  final String _cartKey = 'cart_items';

  @override
  void onInit() {
    super.onInit();
    _loadCartItems();
  }

  RxMap<ProductModel, int> get cartItems => _cartItems;

  Future<void> _loadCartItems() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cartData = prefs.getStringList(_cartKey) ?? [];
      _cartItems.clear();
      for (var itemJson in cartData) {
        print("Loading item JSON: $itemJson"); // Debug JSON
        final decodedJson = jsonDecode(itemJson);
        print("Decoded JSON: $decodedJson"); // Debug decoded data
        final item = CartItem.fromJson(Map<String, dynamic>.from(decodedJson));
        print("Loaded CartItem: product=${item.product.id}, qty=${item.qty}"); // Debug item
        if (_cartItems.containsKey(item.product)) {
          print("Duplicate product found, updating qty for ${item.product.id}");
        }
        _cartItems[item.product] = item.qty; // Assign to map
      }
    } catch (e) {
      print("Error loading cart items: $e");
    }
  }

  Future<void> _saveCartItems() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cartData = _cartItems.entries.map((entry) {
        final product = entry.key;
        final qty = entry.value;
        final cartItem = CartItem(product: product, qty: qty);
        final jsonString = jsonEncode(cartItem.toJson());
        print("Saving CartItem: product=${product.id}, qty=$qty, JSON=$jsonString"); // Debug save
        return jsonString;
      }).toList();
      await prefs.setStringList(_cartKey, cartData);
    } catch (e) {
      print("Error saving cart items: $e");
    }
  }

  /// Add product to cart
  void addToCart(ProductModel product) {
    if (_cartItems.containsKey(product)) {
      _cartItems[product] = _cartItems[product]! + 1;
    } else {
      _cartItems[product] = 1;
    }
    _saveCartItems(); // Save after adding
  }

  /// Remove one unit of a product
  void removeFromCart(ProductModel product) {
    if (!_cartItems.containsKey(product)) return;

    if (_cartItems[product]! > 1) {
      _cartItems[product] = _cartItems[product]! - 1;
    } else {
      _cartItems.remove(product);
    }
    _saveCartItems(); // Save after removing
  }

  /// Change quantity directly (used in quantity selector)
  void changeQuantity(ProductModel product, int newQty) {
    if (newQty <= 0) {
      _cartItems.remove(product);
    } else {
      _cartItems[product] = newQty;
    }
    _saveCartItems();
  }

  /// Remove product completely (regardless of quantity)
  void removeProduct(ProductModel product) {
    _cartItems.remove(product);
    _saveCartItems();
  }

  /// Clear entire cart
  void clearCart() {
    _cartItems.clear();
    _saveCartItems();
  }

  /// Get total number of items in cart
  int get totalItems {
    int total = 0;
    _cartItems.forEach((_, qty) => total += qty);
    return total;
  }

  /// Get total cart price
  double get totalPrice {
    double total = 0.0;
    _cartItems.forEach((product, qty) => total += product.price * qty);
    return total;
  }
}