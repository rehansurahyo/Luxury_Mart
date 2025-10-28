import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../repository/Screens/Bottom navigation/bottomNavScreen.dart';
import '../../../repository/Screens/home/homeScreen.dart';

import '../screens/OTPVerificationScreen.dart';

import '../screens/phone_login.dart';

class AuthController extends GetxController {
  static AuthController get instance => Get.find();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  var isLoading = false.obs;
  var isVerifying = false.obs;
  String verificationId = "";

  /// Send OTP
  void verifyPhone(String phoneNumber) async {
    try {
      isLoading.value = true;

      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Auto verification
          await _auth.signInWithCredential(credential);
          Get.offAll(() =>  HomeScreen());
        },
        verificationFailed: (FirebaseAuthException e) {
          String message = e.message ?? "Unknown error";
          switch (e.code) {
            case 'invalid-phone-number':
              message = "Invalid phone number format.";
              break;
            case 'quota-exceeded':
              message = "SMS quota exceeded. Try again later.";
              break;
            case 'too-many-requests':
              message = "Too many requests. Wait before trying again.";
              break;
          }
          Get.snackbar("Verification Failed", message);
        },
        codeSent: (String verId, int? resendToken) {
          verificationId = verId;
          Get.to(() =>  OTPScreen());
        },
        codeAutoRetrievalTimeout: (String verId) {
          verificationId = verId;
        },
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message ?? "Phone verification failed");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// Verify OTP
  void verifyOTP(String otp) async {
    try {
      isVerifying.value = true;

      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );

      await _auth.signInWithCredential(credential);
      Get.offAll(() => const BottomNavScreen());
    } on FirebaseAuthException catch (e) {
      String message = e.message ?? "Please try again";
      switch (e.code) {
        case 'invalid-verification-code':
          message = "Invalid OTP code.";
          break;
        case 'session-expired':
          message = "OTP session expired. Resend OTP.";
          break;
      }
      Get.snackbar("Invalid OTP", message);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isVerifying.value = false;
    }
  }

  /// Logout
  Future<void> logout() async {
    try {
      await _auth.signOut();
      Get.offAll(() =>  PhoneLoginScreen());
    } catch (e) {
      Get.snackbar("Error", "Logout failed: $e");
    }
  }

  User? get currentUser => _auth.currentUser;
}
