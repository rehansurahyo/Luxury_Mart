import 'package:flutter/material.dart';
import 'package:luxury_mart/repository/Screens/cart/cartScreen.dart';
import 'package:luxury_mart/repository/Screens/category/categoryScreen.dart';
import 'package:luxury_mart/repository/Screens/home/homeScreen.dart';

import 'package:iconsax/iconsax.dart';
class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavsSreenState();
}

class _BottomNavsSreenState extends State<BottomNavScreen> {
  int currentIndex = 0;
  List<Widget>pages =[
    HomeScreen(),
    CartScreen(),
    CategoryScreen(),


  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),

      bottomNavigationBar: BottomNavigationBar( items: [
        BottomNavigationBarItem(icon: Icon(Iconsax.home,color: Colors.black,),label: 'Home',),
        BottomNavigationBarItem(icon: Icon(Iconsax.shopping_cart,color: Colors.black,),label: 'Cart'),
        BottomNavigationBarItem(icon: Icon(Iconsax.category,color: Colors.black,),label: 'Categories'),
        BottomNavigationBarItem(icon: Icon(Iconsax.printer,color: Colors.black,),label: 'Print'),
      ],type: BottomNavigationBarType.fixed,currentIndex: currentIndex,onTap: (index){
        setState(() {
          currentIndex = index;
        });
      },),


    );
  }
}
