import 'package:elrawdah/constants.dart';
import 'package:elrawdah/controller/country_controller.dart';
import 'package:elrawdah/screens/list_cemetery.dart';
import 'package:elrawdah/screens/widgets/bottom_sheet_header_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class ListCountry extends StatefulWidget {
  const ListCountry({super.key});

  @override
  State<ListCountry> createState() => _ListCountryState();
}

class _ListCountryState extends State<ListCountry> {
  CountryController countryController = Get.put(CountryController());
  @override
  void initState() {
    super.initState();

    initCountry();
  }

  initCountry() async {
    await countryController.getAllCountry();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CountryController>(
        init: CountryController(),
        builder: (logic) {
          logic.allCountry = countryController.allCountry;
          return Scaffold(
              appBar: AppBar(
                title: appNameText,
                backgroundColor: backgroundColor,
              ),
              backgroundColor: backgroundColor,
              body: SafeArea(
                  child: Column(children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BottomSheetHeaderTitle(
                        fontSize: 25,
                        titleText: 'قائمة الدول',
                        mainAxisAlignment: MainAxisAlignment.center,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [],
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
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueAccent,
                        blurRadius: 10,
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        35.0,
                      ),
                      topRight: Radius.circular(
                        35.0,
                      ),
                    ),
                  ),
                  child: Container(
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
                    child: countryController.loading
                        ? const AlertDialog(
                            backgroundColor: Colors.transparent,
                            content: Center(
                              child: SpinKitPouringHourGlassRefined(
                                color: Colors.green,
                                size: 50,
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(
                                left: 50.0, top: 25.0, bottom: 25, right: 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    itemCount: logic.allCountry.length,
                                    itemBuilder: (context, index) {
                                      return ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(32),
                                            bottomLeft: Radius.circular(32),
                                          ),
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: ListTile(
                                              onTap: () {
                                                print(
                                                    "${logic.allCountry[index].name}");
                                                Get.to(() => ListCemetery(
                                                    country: logic
                                                        .allCountry[index]));
                                              },
                                              title: Text(
                                                "${logic.allCountry[index].name}",
                                                style: const TextStyle(
                                                    fontSize: 24),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ));
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return const Divider();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ),
                ))
              ])));
        });
  }
}
