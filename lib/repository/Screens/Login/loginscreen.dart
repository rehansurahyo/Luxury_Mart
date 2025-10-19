import 'package:flutter/material.dart';
import 'package:luxury_mart/repository/widgets/uihelper.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
                children: [
              UiHelper.customImage(img: 'Blinkit Onboarding Screen.png'),
            //  SizedBox(height: 5),
              SizedBox(height: 120,width: 150, child:  UiHelper.customImage(img: 'logo.png'),),

            //  SizedBox(height: 20),
              UiHelper.CustomText(
                text: 'Luxury Mart',
                color: Colors.black,
                fontweight: FontWeight.bold,
                fontsize: 20,
                fontFamily: 'bold',
              ),
                  SizedBox(height: 20,),
        
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Container(
                      height: 200,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0XFFFFFFFF)
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          UiHelper.CustomText(text: 'Rehan', color: Color(0XFF000000), fontweight: FontWeight.w500, fontsize: 14),
                          SizedBox(height: 5),
                          UiHelper.CustomText(text: '03172208626', color: Color(0XFF9C9C9C), fontweight: FontWeight.bold, fontsize: 14,fontFamily: 'bold'),
                          SizedBox(height: 20),
                          SizedBox(height: 48,width: 255,child: ElevatedButton(onPressed: (){}, style:ElevatedButton.styleFrom(backgroundColor: Color(0XFFE23744),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),child: UiHelper.CustomText(text: 'Login', color: Colors.white, fontweight: FontWeight.w800, fontsize: 20,fontFamily: 'bold')),),
                          SizedBox(height: 8),
                          UiHelper.CustomText(text: 'Access your saved address from Luxury Mart automatically!', color: Color(0XFF9C9C9C), fontweight: FontWeight.normal, fontsize: 8),
                          SizedBox(height: 15),
                          UiHelper.CustomText(text: 'or login with phone number', color: Color(0XFF269237), fontweight: FontWeight.normal, fontsize: 14),


        
                          
                          
                        ],
                      ),
                    ),
                  ),
                    SizedBox(height: 20),

        
        
        
            ],
          ),
        ),
      ),
    );
  }
}
