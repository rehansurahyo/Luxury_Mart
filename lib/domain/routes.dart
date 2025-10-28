import 'package:get/get.dart';
import '../repository/Screens/cart/cartScreen.dart';
import '../repository/Screens/checkout_screen.dart';
import '../repository/Screens/home/homeScreen.dart';
import '../repository/Screens/splash/splashscreen.dart';
import '../features/auth/screens/OTPVerificationScreen.dart';
import '../features/auth/screens/phone_login.dart';


class Routes {
  static const splash = '/';
  static const phoneLogin = '/phoneLogin';
  static const otp = '/otp';
  static const home = '/home';
  static const cart = '/cart';
  static const checkout = '/checkout';
  static const orders = '/orders';
  static const profile = '/profile';

  static final pages = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: phoneLogin, page: () =>  PhoneLoginScreen()),
    GetPage(name: otp, page: () =>  OTPScreen()),
    GetPage(name: home, page: () =>  HomeScreen()),
    GetPage(name: cart, page: () =>  CartScreen()),
    GetPage(name: checkout, page: () => const CheckoutScreen()),
    // GetPage(name: orders, page: () => const OrdersScreen()),
    // GetPage(name: profile, page: () => const ProfileScreen()),
  ];
}


