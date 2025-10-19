import 'package:flutter/material.dart';
class UiHelper{
  static customImage({required String img}){
    return Image.asset('assets/images/$img');
  }


  static CustomText({
  required String text,
  required Color color,
  required FontWeight fontweight,
  String? fontFamily,
  required double fontsize
}){
    return Text(text,style: TextStyle(
      fontFamily: fontFamily ?? 'regular',
      fontSize: fontsize,
      fontWeight: fontweight,
      color: color
    ),);
  }


}