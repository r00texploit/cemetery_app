import 'package:elrawdah/screens/category_page.dart';
import 'package:elrawdah/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  int index = 0;
  List<Widget> pages = [const HomePage(), const CategoryPage()];

  MoveToPage(int index) {
    this.index = index;
    update();
    Get.to(this.index == 0 ? pages[0] : pages[1]);
  }
}
