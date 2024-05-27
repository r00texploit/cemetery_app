import 'package:elrawdah/controller/home_controller.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  const BottomNavBar({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    var bottomNavigationKey = GlobalKey<CurvedNavigationBarState>();
    return CurvedNavigationBar(
      key: bottomNavigationKey,
      index: currentIndex,
      height: 60.0,
      items: const <Widget>[
        Icon(Icons.home_outlined, size: 30),
        Icon(Icons.list, size: 30),
      ],
      color: Colors.white,
      buttonBackgroundColor: Colors.white,
      backgroundColor: Colors.green[800]!,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 600),
      onTap: (index) {
        var logic = Get.put(HomeController());
        logic.MoveToPage(index);
      },
      letIndexChange: (index) => true,
    );
  }
}
