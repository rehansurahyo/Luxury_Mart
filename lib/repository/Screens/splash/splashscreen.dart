import 'dart:async';

import 'package:flutter/material.dart';
import 'package:luxury_mart/repository/Screens/Login/loginscreen.dart';

import '../../../domain/constants/appcolors.dart';
import '../../widgets/uihelper.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}



class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
  Timer(Duration(seconds: 3),(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
  });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

        UiHelper.customImage(img: 'luxurymartlight.png')

        ],
        ),
      ),
    );
  }
}
