import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxury_mart/utils/helpers/uihelper.dart';
import '../controllers/auth_controller.dart';
import '../widgets/loader_overlay.dart';

class PhoneLoginScreen extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();

  PhoneLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            UiHelper.customImage(img: "Blinkit Onboarding Screen.png"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  // Logo
                  Image.asset(
                    'assets/images/logo.png',
                    height: 150,

                  ),

                  // Title
                  UiHelper.customText(
                    text: "Pakistan's last minute app",
                    color: const Color(0xFF000000),
                    fontweight: FontWeight.bold,
                    fontsize: 20,
                    fontfamily: "bold",
                  ),
                  const SizedBox(height: 20),

                  // Login Card
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFFFFFFF),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          UiHelper.customText(
                            text: "Welcome!",
                            color: const Color(0xFF000000),
                            fontweight: FontWeight.w500,
                            fontsize: 16,
                          ),
                          const SizedBox(height: 5),
                          UiHelper.customText(
                            text: "Login to continue shopping",
                            color: const Color(0xFF9C9C9C),
                            fontweight: FontWeight.bold,
                            fontsize: 14,
                            fontfamily: "bold",
                          ),
                          const SizedBox(height: 20),

                          // Phone Input Field
                          TextField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              prefixText: "+92 ",
                              hintText: "Enter your phone number",
                              hintStyle: const TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.green.shade600),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Login Button
                          SizedBox(
                            height: 48,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async {
                                final phone = phoneController.text.trim();
                                if (phone.isEmpty) {
                                  Get.snackbar("Error", "Please enter your phone number");
                                  return;
                                }

                                Get.dialog(
                                  const LoadingOverlay(),
                                  barrierDismissible: false,
                                );

                               authController.verifyPhone("+92$phone");
                                Get.back(); // close loader
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF269237),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: UiHelper.customText(
                                text: "Send OTP",
                                color: const Color(0xFFFFFFFF),
                                fontweight: FontWeight.bold,
                                fontsize: 16,
                                fontfamily: "bold",
                              ),
                            ),
                          ),

                          const SizedBox(height: 10),

                          // Info Text
                          UiHelper.customText(
                            text: "We'll send a 6-digit OTP to verify your number",
                            color: const Color(0xFF9C9C9C),
                            fontweight: FontWeight.normal,
                            fontsize: 11,
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}