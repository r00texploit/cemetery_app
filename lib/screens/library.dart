import 'package:elrawdah/constants.dart';
import 'package:elrawdah/screens/widgets/bottom_sheet_header_title.dart';
import 'package:elrawdah/screens/widgets/exercise_tile.dart';
import 'package:elrawdah/screens/widgets/greet.dart';
import 'package:elrawdah/screens/widgets/search_field.dart';
import 'package:flutter/material.dart';

class Library extends StatefulWidget {
  const Library({super.key});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
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
                              listID: 2,
                              exercise: ' الاستعلام عن القبر',
                              exerciseID: 0,
                              icon: Icons.menu_book,
                              color: Colors.pink,
                            ),
                            ExerciseTile(
                              listID: 2,
                              exercise: ' المكتبة الاعلامية',
                              exerciseID: 1,
                              icon: Icons.menu_book,
                              color: Colors.pink,
                            ),
                            ExerciseTile(
                              listID: 2,
                              exercise: ' التنبيهات',
                              exerciseID: 2,
                              icon: Icons.menu_book,
                              color: Colors.pink,
                            ),
                            ExerciseTile(
                              listID: 2,
                              exercise: ' المكتبة',
                              exerciseID: 3,
                              icon: Icons.menu_book,
                              color: Colors.pink,
                            ),
                            ExerciseTile(
                              listID: 2,
                              exercise: 'مواقع المقابر ',
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
