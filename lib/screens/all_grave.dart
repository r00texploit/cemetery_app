import 'package:elrawdah/constants.dart';
import 'package:elrawdah/controller/grave_controller.dart';
import 'package:elrawdah/screens/grave_details.dart';
import 'package:elrawdah/screens/search_grave.dart';
import 'package:elrawdah/screens/widgets/bottom_sheet_header_title.dart';
import 'package:elrawdah/screens/widgets/search_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AllGraves extends StatefulWidget {
  final int id;
  final String cemetery_name;
  const AllGraves({super.key, required this.id, required this.cemetery_name});

  @override
  State<AllGraves> createState() => _AllGravesState();
}

class _AllGravesState extends State<AllGraves> {
  GraveController gravesController = Get.put(GraveController());
  @override
  void initState() {
    super.initState();

    initGrave();
  }

  initGrave() async {
    await gravesController.getAllGrave(widget.id);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GraveController>(
        init: GraveController(),
        builder: (logic) {
          logic.allGrave = gravesController.allGrave;
          return gravesController.loading
              ? Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  child: const AlertDialog(
                    backgroundColor: Colors.white,
                    content: Center(
                      child: SpinKitPouringHourGlassRefined(
                        color: Colors.green,
                        size: 50,
                      ),
                    ),
                  ),
                )
              : Scaffold(
                  appBar: AppBar(
                    title: appNameText,
                    backgroundColor: backgroundColor,
                  ),
                  backgroundColor: backgroundColor,
                  body: SafeArea(
                      child: Column(children: [
                     Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
      onTap: () {
        Get.to(SearchGraveData(cemetery_name: widget.cemetery_name,allGrave: logic.allGrave,));
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
    ),
    const SizedBox(
      height: 20,
    ),
                          BottomSheetHeaderTitle(
                            fontSize: 25,
                            titleText: 'قائمة المدفونين',
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
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 50.0, top: 25.0, bottom: 25, right: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  itemCount: logic.allGrave!.length,
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
                                                  "${logic.allGrave![index].name}");
                                              Get.to(() => GraveDetails(
                                                  id: logic
                                                      .allGrave![index].id));
                                            },
                                            title: Text(
                                              "${logic.allGrave![index].name}",
                                              style: GoogleFonts.cairo(
                                                  fontSize: 19,
                                                  color: Colors.black),
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
