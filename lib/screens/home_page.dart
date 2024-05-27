import 'package:elrawdah/constants.dart';

import 'package:elrawdah/screens/widgets/bottom_sheet_header_title.dart';
import 'package:elrawdah/screens/widgets/exercise_tile.dart';
import 'package:elrawdah/screens/widgets/greet.dart';
import 'package:elrawdah/screens/widgets/search_field.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialization();
  }

  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print
    print('ready in 3...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 2...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 1...');
    await Future.delayed(const Duration(seconds: 1));
    print('go!');
    // FlutterNativeSplash.remove();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
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
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
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
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BottomSheetHeaderTitle(
                        fontSize: 20,
                        titleText: 'القوائم',
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        color: Colors.black,
                      ),
                      Expanded(
                        child: ListView(
                          children: const [
                            ExerciseTile(
                              exercise: 'الاحاديث',
                              exerciseID: 0,
                              icon: Icons.menu_book,
                              color: Colors.orange,
                            ),
                            ExerciseTile(
                              exercise: ' التعاليم الدينية ',
                              exerciseID: 1,
                              icon: Icons.menu_book,
                              color: Colors.pink,
                            ),
                            ExerciseTile(
                              exercise: ' القبور التاريخية',
                              exerciseID: 2,
                              icon: Icons.menu_book,
                              color: Colors.pink,
                            ),
                            ExerciseTile(
                              exercise: ' الإجراءات',
                              exerciseID: 3,
                              icon: Icons.menu_book,
                              color: Colors.pink,
                            ),
                            ExerciseTile(
                              exercise: 'القبور ',
                              exerciseID: 4,
                              icon: Icons.menu_book,
                              color: Colors.orange,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
