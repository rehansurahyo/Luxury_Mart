import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:luxury_mart/repository/Screens/Bottom navigation/bottomNavScreen.dart';

import '../../../features/auth/screens/phone_login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    await Future.delayed(const Duration(seconds: 2)); // nice delay
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // user already logged in
      Get.offAll(() => const BottomNavScreen());
    } else {
      Get.offAll(() =>  PhoneLoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
       child: Image.asset('assets/images/logo.png'),
      ),
    );
  }
}
