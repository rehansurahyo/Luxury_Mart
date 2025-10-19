import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UiHelper {
  static Widget customImage({required String img}) {
    return Image.asset("assets/images/$img");
  }

  static Widget customText({
    required String text,
    required Color color,
    required FontWeight fontweight,
    String? fontfamily,
    required double fontsize,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        fontFamily: fontfamily ?? "regular",
        fontWeight: fontweight,
        color: color,
      ),
    );
  }

  static Widget customTextField({required TextEditingController controller}) {
    return Container(
      height: 40,
      width: 320,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(color: const Color(0xFFC5C5C5)),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: "Search 'ice-cream'",
          prefixIcon: Icon(Iconsax.search_normal_1),
          suffixIcon: Icon(Iconsax.microphone_2,),
          border: InputBorder.none,
        ),
      ),
    );
  }

  static Widget customButton(VoidCallback callback) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        height: 18,
        width: 30,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFF27AF34)),
          borderRadius: BorderRadius.circular(4),
        ),
        child: const Center(
          child: Text(
            "Add",
            style: TextStyle(
              fontSize: 8,
              color: Color(0xFF27AF34),
            ),
          ),
        ),
      ),
    );
  }
}
