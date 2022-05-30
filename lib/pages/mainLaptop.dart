import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:wnndderpc/colors.dart';
import 'package:wnndderpc/navpages/cart.dart';
import 'package:wnndderpc/navpages/laptops.dart';
import '../navpages/compare_page.dart';


class MainLaptop extends StatefulWidget {
  const MainLaptop({Key? key}) : super(key: key);

  @override
  _LaptopsState createState() => _LaptopsState();
}

class _LaptopsState extends State<MainLaptop> {
  List pages = [
    const Laptops(),
    const CartPage(),
  ];
  int currentIndex = 0;
  void onTap(int index)
  {
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.black,
      body: pages[currentIndex],
      bottomNavigationBar: FloatingNavbar(
        currentIndex: currentIndex,
        onTap: onTap,

        selectedBackgroundColor: AppColours.black,
        backgroundColor: AppColours.black,
        selectedItemColor: AppColours.green,
        unselectedItemColor: Colors.grey[400],
        elevation: 10,
        items:  [
          FloatingNavbarItem(icon: Icons.home, title: "Home"),
          FloatingNavbarItem(icon: Icons.shopping_cart, title: "Cart"),
        ],
      ),
    );
  }
}
