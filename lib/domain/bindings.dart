import 'package:get/get.dart';

import '../features/auth/controllers/auth_controller.dart';
import '../features/auth/controllers/cart_controller.dart';
import '../features/auth/controllers/product_controller.dart';


class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
    Get.put(ProductController(), permanent: true);
    Get.put(CartController(), permanent: true);
  }
}
