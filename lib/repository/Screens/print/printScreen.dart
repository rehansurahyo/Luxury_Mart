import 'package:flutter/material.dart';
import '../../widgets/uihelper.dart';

class PrintScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFBF0CE),
      body: SingleChildScrollView(
        child: Column(
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
                          UiHelper.customText(
                            text: "- ALigohrabad Larkana Pakistan",
                            color: Colors.black,
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
            UiHelper.customText(
              text: "Print Store",
              color: Colors.black,
              fontweight: FontWeight.bold,
              fontsize: 32,
            ),
            UiHelper.customText(
              text: "Blinkit ensures secure prints at every stage",
              color: const Color(0XFF9C9C9C),
              fontweight: FontWeight.bold,
              fontsize: 14,
            ),

            const SizedBox(height: 40),

            // 🧾 Document Card
            Stack(
              children: [
                Container(
                  height: 180,
                  width: 361,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: UiHelper.customText(
                          text: "Documents",
                          color: Colors.black,
                          fontweight: FontWeight.bold,
                          fontsize: 14,
                        ),
                      ),
                      const SizedBox(height: 6),
                      _infoRow(Icons.star, "Price starting at Rs 3/page"),
                      _infoRow(Icons.description_outlined, "Paper quality: 70 GSM"),
                      _infoRow(Icons.print_outlined, "Single side prints"),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: SizedBox(
                          height: 40,
                          width: 125,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0XFF27AF34),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: const Text(
                              "Upload Files",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // 📄 Icon on Right Corner
                const Positioned(
                  right: 20,
                  bottom: 40,
                  child: Icon(
                    Icons.description_rounded,
                    color: Color(0XFFF7CB45),
                    size: 70,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Helper row for icon + text line
  Widget _infoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 5),
      child: Row(
        children: [
          Icon(icon, size: 18, color: const Color(0XFFF7CB45)),
          const SizedBox(width: 7),
          UiHelper.customText(
            text: text,
            color: const Color(0XFF9C9C9C),
            fontweight: FontWeight.normal,
            fontsize: 15,
          ),
        ],
      ),
    );
  }
}
