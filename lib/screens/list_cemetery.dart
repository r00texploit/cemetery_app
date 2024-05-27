import 'package:elrawdah/constants.dart';
import 'package:elrawdah/controller/cemetery_controller.dart';
import 'package:elrawdah/model/country.dart';
import 'package:elrawdah/screens/cemetery_details.dart';
import 'package:elrawdah/screens/widgets/bottom_sheet_header_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class ListCemetery extends StatefulWidget {
  final Country? country;
  ListCemetery({super.key, this.country});

  @override
  State<ListCemetery> createState() => _ListCemeteryState();
}

class _ListCemeteryState extends State<ListCemetery> {
  CemeteryController cemeteryController = Get.put(CemeteryController());
  @override
  void initState() {
    super.initState();
    initCemetery();
  }

  initCemetery() async {
    await cemeteryController.getAllCemetery(widget.country!);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CemeteryController>(
        init: CemeteryController(),
        builder: (logic) {
          logic.allCemetery = cemeteryController.allCemetery;
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
                        titleText: 'قائمة المقابر',
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
                          child: cemeteryController.loading
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
                                      left: 50.0,
                                      top: 25.0,
                                      bottom: 25,
                                      right: 25),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: ListView.separated(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: logic.allCemetery.length,
                                          itemBuilder: (context, index) {
                                            return ListTile(
                                              onTap: () {
                                                print(
                                                    "${logic.allCemetery[index].name}");
                                                Get.to(() => CemeteryDetails(
                                                    id: logic.allCemetery[index]
                                                        .id!));
                                              },
                                              title: Text(
                                                "${logic.allCemetery[index].name}",
                                                style: textStyle,
                                                textAlign: TextAlign.center,
                                              ),
                                            );
                                          },
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            return const Divider();
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                        )))
              ])));
        });
  }
}
