import 'package:elrawdah/constants.dart';
import 'package:elrawdah/screens/widgets/search_listview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(SearchData());
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: const BorderRadius.all(
            Radius.circular(
              10.0,
            ),
          ),
          color: backgroundColor,
        ),
        padding: const EdgeInsets.all(
          20.0,
        ),
        child: const Row(
          children: [
            Icon(
              Icons.search,
              size: 30,
              color: Colors.white,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              'البحث عن قبر',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
