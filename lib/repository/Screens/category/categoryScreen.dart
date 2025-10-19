import 'package:flutter/material.dart';
import '../../widgets/uihelper.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  final TextEditingController searchController = TextEditingController();

  final List<Map<String, String>> grocerykitchen = [
    {"img": "IMG-20250209-WA0005.jpg", "text": "Vegetables & \nFruits"},
    {"img": "IMG-20250209-WA0005.jpg", "text": "Atta, Dal & \nRice"},
    {"img": "IMG-20250209-WA0005.jpg", "text": "Oil, Ghee & \nMasala"},
    {"img": "IMG-20250209-WA0005.jpg", "text": "Dairy, Bread & \nMilk"},
    {"img": "IMG-20250209-WA0005.jpg", "text": "Biscuits & \nBakery"},
  ];

  final List<Map<String, String>> secondgrocery = [
    {"img": "IMG-20250209-WA0005.jpg", "text": "Dry Fruits &\n Cereals"},
    {"img": "IMG-20250209-WA0005.jpg", "text": "Kitchen &\n Appliances"},
    {"img": "IMG-20250209-WA0005.jpg", "text": "Tea & \nCoffees"},
    {"img": "IMG-20250209-WA0005.jpg", "text": "Ice Creams & \nmuch more"},
    {"img": "IMG-20250209-WA0005.jpg", "text": "Noodles & \nPacket Food"},
  ];

  final List<Map<String, String>> snacksanddrinks = [
    {"img": "IMG-20250209-WA0005.jpg", "text": "Chips &\n Namkeens"},
    {"img": "IMG-20250209-WA0005.jpg", "text": "Sweets & \nChocolates"},
    {"img": "IMG-20250209-WA0005.jpg", "text": "Drinks & \nJuices"},
    {"img": "IMG-20250209-WA0005.jpg", "text": "Sauces &\n Spreads"},
    {"img": "IMG-20250209-WA0005.jpg", "text": "Beauty &\n Cosmetics"},
  ];

  final List<Map<String, String>> household = [
    {"img": "IMG-20250209-WA0005.jpg"},
    {"img": "IMG-20250209-WA0005.jpg"},
    {"img": "IMG-20250209-WA0005.jpg"},
    {"img": "IMG-20250209-WA0005.jpg"},
    {"img": "IMG-20250209-WA0005.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Stack(
              children: [
                Container(
                  height: 190,
                  width: double.infinity,
                  color: const Color(0XFFF7CB45),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: UiHelper.customText(
                          text: "Luxury Mart",
                          color: Colors.black,
                          fontweight: FontWeight.bold,
                          fontsize: 15,
                          fontfamily: "bold",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: UiHelper.customText(
                          text: "16 minutes",
                          color: Colors.black,
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
                            color: Colors.black,
                            fontweight: FontWeight.bold,
                            fontsize: 14,
                          ),
                          Expanded(
                            child: UiHelper.customText(
                              text: "- Aligohrabad Larkana Pakistan ",
                              color: Colors.black,
                              fontweight: FontWeight.bold,
                              fontsize: 14,
                            ),
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
                    child: Icon(Icons.person, color: Colors.black, size: 20),
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
            const SizedBox(height: 30),

            // Grocery & Kitchen Section
            sectionTitle("Grocery & Kitchen"),
            horizontalList(grocerykitchen),

            // second Grocery \\
            sectionTitle("Daily Essentials"),
            horizontalList(secondgrocery),

            // Snacks & Drinks
            sectionTitle("Snacks & Drinks"),
            horizontalList(snacksanddrinks),

            // Household
            sectionTitle("Household Essentials"),
            horizontalList(household),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // section title
  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
      child: UiHelper.customText(
        text: title,
        color: Colors.black,
        fontweight: FontWeight.bold,
        fontsize: 16,
      ),
    );
  }

  // horizontal list widget
  Widget horizontalList(List<Map<String, String>> items) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 20),
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.all(4),
                height: 78,
                width: 71,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0XFFD9EBEB),
                ),
                child: UiHelper.customImage(
                  img: items[index]["img"]!,
                ),
              ),
              const SizedBox(height: 4),
              UiHelper.customText(
                text: items[index]["text"] ?? "",
                color: Colors.black,
                fontweight: FontWeight.normal,
                fontsize: 10,
              ),
            ],
          );
        },
      ),
    );
  }
}
