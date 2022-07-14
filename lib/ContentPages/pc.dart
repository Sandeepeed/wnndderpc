import 'package:flutter/material.dart';
import 'package:wnndderpc/colors.dart';
import 'package:wnndderpc/pcnavpages/cartpc.dart';
import 'package:wnndderpc/pcnavpages/comparepc.dart';
import 'package:wnndderpc/pcnavpages/pcs.dart';


class MainPC extends StatefulWidget {
  const MainPC({Key? key}) : super(key: key);

  @override
  _LaptopsState createState() => _LaptopsState();
}

class _LaptopsState extends State<MainPC> {
  List pages = [
    const PC(),
    const CartPC(),
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
      backgroundColor: AppColours.blue,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        unselectedFontSize: 0,
        backgroundColor: AppColours.black,
        selectedItemColor: AppColours.green,
        unselectedItemColor: Colors.grey[400],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
        ],
      ),
    );
  }
}
