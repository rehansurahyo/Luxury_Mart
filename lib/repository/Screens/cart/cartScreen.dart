import 'package:flutter/material.dart';
import '../../widgets/uihelper.dart';

class CartScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Stack(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  color: const Color(0xFFF7CB45),
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          const SizedBox(width: 20),
                          UiHelper.customText(
                            text: "Luxury Mart",
                            color: const Color(0xFF000000),
                            fontweight: FontWeight.bold,
                            fontsize: 15,
                            fontfamily: "bold",
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 20),
                          UiHelper.customText(
                            text: "16 minutes",
                            color: const Color(0xFF000000),
                            fontweight: FontWeight.bold,
                            fontsize: 20,
                            fontfamily: "bold",
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 20),
                          UiHelper.customText(
                            text: "HOME ",
                            color: const Color(0xFF000000),
                            fontweight: FontWeight.bold,
                            fontsize: 14,
                          ),
                          UiHelper.customText(
                            text: "- Aligohrabad Larkana Pakistan",
                            color: const Color(0xFF000000),
                            fontweight: FontWeight.bold,
                            fontsize: 14,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Positioned(
                  right: 20,
                  bottom: 100,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  left: 20,
                  child: UiHelper.customTextField(
                    controller: searchController,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
             Center(
              child:
              SizedBox(
                height: 150,
                width: 150,
                child: UiHelper.customImage(img: 'cart.png'),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: UiHelper.customText(
                text: "Reordering will be easy",
                color: const Color(0xFF000000),
                fontweight: FontWeight.bold,
                fontsize: 16,
                fontfamily: "bold",
              ),
            ),
            Center(
              child: UiHelper.customText(
                text: "Items you order will show up here so you can buy",
                color: const Color(0xFF000000),
                fontweight: FontWeight.bold,
                fontsize: 12,
              ),
            ),
            Center(
              child: UiHelper.customText(
                text: "them again easily.",
                color: const Color(0xFF000000),
                fontweight: FontWeight.bold,
                fontsize: 12,
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: UiHelper.customText(
                text: "Bestsellers",
                color: const Color(0xFF000000),
                fontweight: FontWeight.bold,
                fontsize: 16,
                fontfamily: "bold",
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 90,
                      width: 90,
                      child: UiHelper.customImage(img: 'IMG-20250209-WA0002.jpg'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 65, left: 65),
                      child: UiHelper.customButton(() {}),
                    ),
                  ],
                ),
                const SizedBox(width: 15),
                Stack(
                  children: [
                    SizedBox(
                      height: 90,
                      width: 90,
                      child: UiHelper.customImage(img: 'IMG-20250209-WA0004.jpg'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 65, left: 65),
                      child: UiHelper.customButton(() {}),
                    ),
                  ],
                ),
                const SizedBox(width: 15),
                Stack(
                  children: [
                    SizedBox(
                      height: 90,
                      width: 90,
                      child: UiHelper.customImage(img: 'IMG-20250209-WA0005.jpg'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 65, left: 65),
                      child: UiHelper.customButton(() {}),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
