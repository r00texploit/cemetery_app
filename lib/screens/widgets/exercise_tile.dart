import 'package:elrawdah/model/cemetery.dart';
import 'package:elrawdah/screens/bared_page.dart';
import 'package:elrawdah/screens/cemetery_law.dart';
import 'package:elrawdah/screens/historical_grave_page.dart';
import 'package:elrawdah/screens/library.dart';
import 'package:elrawdah/screens/list_cemetery.dart';
import 'package:elrawdah/screens/list_country.dart';
import 'package:elrawdah/screens/procedure_page.dart';
import 'package:elrawdah/screens/widgets/search_field.dart';
import 'package:elrawdah/screens/widgets/search_listview.dart';
import 'package:flutter/material.dart';

final List<Widget> _children = [
  const BaredPage(),
  const CemeteryLawScreen(),
  const HistoricalGravesPage(),
  const ProceduresPage(),
  const ListCountry(),
];
final List<Widget> _homeList = [
  SearchData(),
  Library(),
  ListCemetery()
  //
  //
];

class ExerciseTile extends StatelessWidget {
  const ExerciseTile({
    super.key,
    required this.exercise,
    required this.listID,
    required this.exerciseID,
    required this.icon,
    required this.color,
  });

  final String exercise;
  final int exerciseID, listID;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        for (var i = 0; i < 5; i++) {
          if (listID == 1) {
            if (exerciseID == i) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => _homeList[i],
              ));
            } else {
              if (exerciseID == i) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => _children[i],
                ));
              }
            }
          }
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              20,
            ),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        color: color,
                      ),
                      child: Icon(
                        icon,
                        size: 40.0,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          exercise,
                          style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        // Text(
                        //   subExercise,
                        //   style: TextStyle(
                        //     fontSize: 17,
                        //     color: Colors.grey[400],
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
                // const Icon(
                //   Icons.more_horiz,
                //   size: 30,
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
