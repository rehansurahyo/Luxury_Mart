import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:luxury_mart/features/auth/controllers/auth_controller.dart';
import 'package:luxury_mart/features/auth/controllers/cart_controller.dart';
import 'package:luxury_mart/features/auth/controllers/product_controller.dart';
import 'package:luxury_mart/repository/Screens/splash/splashscreen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  Get.put(AuthController());
  Get.put(CartController());
  Get.put(ProductController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
