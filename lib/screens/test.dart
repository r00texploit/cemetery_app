import 'package:elrawdah/controller/cemetery_controller.dart';
import 'package:elrawdah/controller/country_controller.dart';
import 'package:elrawdah/model/cemetery.dart';
import 'package:elrawdah/model/country.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class NestedDropdown extends StatelessWidget {
  final Country? initialValue;
  final List<DropdownMenuItem<Country>> itemsFirstLevel;
  final ValueChanged<Country?> onChangedFirstLevel;
  final Future<List<DropdownMenuItem<Cemetery>>> Function(Cemetery?)
      loadItemsSecondLevel;
  final ValueChanged<Cemetery?> onChangedSecondLevel;
  final CemeteryController cemeteryontroller;
  final CountryController countryController;
  final Cemetery? initialCemeteryValue;
  final List<DropdownMenuItem<Cemetery>> itemsSecondLevel;

  const NestedDropdown({
    Key? key,
    required this.initialValue,
    required this.itemsFirstLevel,
    required this.onChangedFirstLevel,
    required this.loadItemsSecondLevel,
    required this.onChangedSecondLevel,
    required this.cemeteryontroller,
    required this.countryController,
    required this.initialCemeteryValue,
    required this.itemsSecondLevel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonHideUnderline(
            child: DropdownButton2<Country>(
          value: initialValue,
          isExpanded: true,
          hint: const Text("select"),
          style: const TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: onChangedFirstLevel,
          items: itemsFirstLevel,
          buttonStyleData: ButtonStyleData(
            height: 50,
            width: 160,
            padding: const EdgeInsets.only(left: 14, right: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: Colors.black26,
              ),
              color: Colors.green[600],
            ),
            elevation: 2,
          ),
        )),
        const SizedBox(height: 10),
        DropdownButtonHideUnderline(
          child: DropdownButton2<Cemetery>(
            key: GlobalKey(),
            hint: const Text("select"),
            value: null,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: onChangedSecondLevel,
            items: itemsSecondLevel,
            buttonStyleData: ButtonStyleData(
              height: 50,
              width: 160,
              padding: const EdgeInsets.only(left: 14, right: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Colors.black26,
                ),
                color: Colors.green[600],
              ),
              elevation: 2,
            ),
          ),
        )
      ],
    );
  }
}
