import 'package:flutter/material.dart';
import '../../widgets/uihelper.dart';

class Homescreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  // Using one placeholder image
  final List<Map<String, String>> data = [
    {"img": "IMG-20250209-WA0005.jpg", "text": "Lights, Diyas\n& Candles"},
    {"img": "IMG-20250209-WA0005.jpg", "text": "Diwali\nGifts"},
    {"img": "IMG-20250209-WA0005.jpg", "text": "Appliances\n& Gadgets"},
    {"img": "IMG-20250209-WA0005.jpg", "text": "Home\n& Living"},
  ];

  final List<Map<String, String>> category = [
    {"img": "IMG-20250209-WA0005.jpg", "text": "Golden Glass\nCandle (Oudh)"},
    {"img": "IMG-20250209-WA0005.jpg", "text": "Royal Gulab Jamun\nBy Bikano"},
    {"img": "IMG-20250209-WA0005.jpg", "text": "Golden Glass\nCandle (Oudh)"},
  ];

  final List<Map<String, String>> groceryKitchen = [
    {"img": "IMG-20250209-WA0005.jpg", "text": "Vegetables &\nFruits"},
    {"img": "IMG-20250209-WA0005.jpg", "text": "Atta, Dal &\nRice"},
    {"img": "IMG-20250209-WA0005.jpg", "text": "Oil, Ghee &\nMasala"},
    {"img": "IMG-20250209-WA0005.jpg", "text": "Dairy, Bread &\nMilk"},
    {"img": "IMG-20250209-WA0005.jpg", "text": "Biscuits &\nBakery"},
  ];

  Widget safeImage(String path, {double size = 60}) {
    return Image.asset(
      'assets/images/$path',
      height: size,
      width: size,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) =>
      const Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),

            // ===== Header =====
            Stack(
              children: [
                Container(
                  height: 190,
                  width: double.infinity,
                  color: const Color(0xFFEC0505),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: UiHelper.customText(
                          text: "Luxury Mart",
                          color: Colors.white,
                          fontweight: FontWeight.bold,
                          fontsize: 15,
                          fontfamily: "bold",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: UiHelper.customText(
                          text: "16 minutes",
                          color: Colors.white,
                          fontweight: FontWeight.bold,
                          fontsize: 20,
                          fontfamily: "bold",
                        ),
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 20),
                          UiHelper.customText(
                            text: "HOME ",
                            color: Colors.white,
                            fontweight: FontWeight.bold,
                            fontsize: 14,
                          ),
                          UiHelper.customText(
                            text: "- Aligohrabad Larkana Pakistan",
                            color: Colors.white,
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
                    backgroundColor: Colors.black,
                    child: Icon(Icons.person, color: Colors.white, size: 20),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  left: 20,
                  right: 20,
                  child: UiHelper.customTextField(controller: searchController),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // ===== Mega Sale Section =====
            Container(
              width: double.infinity,
              color: const Color(0xFFEC0505),
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  UiHelper.customText(
                    text: "🎉 Mega Ramazan Sale 🎉",
                    color: Colors.white,
                    fontweight: FontWeight.bold,
                    fontsize: 22,
                    fontfamily: "bold",
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: data.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            width: 100,
                            decoration: BoxDecoration(
                              color: const Color(0xFFEAD3D3),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                safeImage(data[index]["img"]!),
                                const SizedBox(height: 5),
                                UiHelper.customText(
                                  text: data[index]["text"]!,
                                  color: Colors.black,
                                  fontweight: FontWeight.bold,
                                  fontsize: 10,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ===== Trending Section =====
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: UiHelper.customText(
                text: "Trending Now",
                color: Colors.black,
                fontweight: FontWeight.bold,
                fontsize: 16,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 240, // increased height to prevent overflow
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: category.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: safeImage(category[index]["img"]!, size: 100),
                        ),
                        const SizedBox(height: 5),
                        UiHelper.customText(
                          text: category[index]["text"]!,
                          color: Colors.black,
                          fontweight: FontWeight.bold,
                          fontsize: 10,
                        ),
                        const SizedBox(height: 5),
                        const Icon(Icons.timer, size: 14, color: Colors.grey),
                        const SizedBox(height: 3),
                        UiHelper.customText(
                          text: "16 MINS",
                          color: Colors.grey,
                          fontweight: FontWeight.normal,
                          fontsize: 10,
                        ),
                        const SizedBox(height: 5),
                        const Icon(Icons.currency_rupee,
                            size: 14, color: Colors.grey),
                        UiHelper.customText(
                          text: "79",
                          color: Colors.grey,
                          fontweight: FontWeight.bold,
                          fontsize: 13,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 10),

            // ===== Grocery & Kitchen =====
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: UiHelper.customText(
                text: "Grocery & Kitchen",
                color: Colors.black,
                fontweight: FontWeight.bold,
                fontsize: 16,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: groceryKitchen.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 78,
                        width: 71,
                        margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFD9EBEB),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: safeImage(groceryKitchen[index]["img"]!),
                      ),
                      const SizedBox(height: 4),
                      UiHelper.customText(
                        text: groceryKitchen[index]["text"]!,
                        color: Colors.black,
                        fontweight: FontWeight.normal,
                        fontsize: 10,

                      ),
                    ],
                  );
                },
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
