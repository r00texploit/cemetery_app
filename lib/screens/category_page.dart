import 'package:elrawdah/constants.dart';
import 'package:elrawdah/controller/home_controller.dart';
import 'package:elrawdah/screens/widgets/bottom_nav_bar.dart';
import 'package:elrawdah/screens/widgets/greet.dart';
import 'package:elrawdah/screens/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        currentIndex: controller.index,
      ),
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(
              16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Greet(),
                SizedBox(
                  height: 25.0,
                ),
                SearchField(),
                SizedBox(
                  height: 25.0,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.blueAccent,
                    blurRadius: 10,
                  ),
                ],
                color: Colors.grey.shade100,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(
                    35.0,
                  ),
                  topRight: Radius.circular(
                    35.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
