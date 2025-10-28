import '../../../data/models/product_model.dart';

class CartItem {
  final ProductModel product;
  int qty;
  CartItem({required this.product, this.qty = 1});

  Map<String, dynamic> toJson() => {
    'productId': product.id,
    'name': product.name,
    'price': product.price,
    'image': product.image,
    'qty': qty,
  };

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      product: ProductModel(
        id: json['productId'],
        name: json['name'],
        image: json['image'],
        price: json['price'],
        category: '',
        unit: '',
        description: '',
        inStock: false,
      ),
      qty: json['qty'],
    );
  }
}
