import 'package:elrawdah/constants.dart';
import 'package:elrawdah/controller/grave_controller.dart';
import 'package:elrawdah/model/grave.dart';
import 'package:elrawdah/screens/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GraveDetails extends StatefulWidget {
  final String? id;
  const GraveDetails({super.key, this.id});

  @override
  State<GraveDetails> createState() => _GraveDetailsState();
}

class _GraveDetailsState extends State<GraveDetails> {
  final GraveController _cemeteryController = Get.put(GraveController());
  late GoogleMapController _mapController;

  @override
  void initState() {
    initGrave();
    super.initState();
  }

  initGrave() async {
    await _cemeteryController.getGraveDetails(widget.id!);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GraveController>(
        init: GraveController(),
        builder: (logic) {
          logic.grave = _cemeteryController.grave;

          return _cemeteryController.mapLoading
              ? Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  child: const AlertDialog(
                    backgroundColor: Colors.white,
                    content: Center(
                      child: SpinKitPouringHourGlassRefined(
                        color: backgroundColor,
                        size: 50,
                      ),
                    ),
                  ),
                )
              : Scaffold(
                  appBar: AppBar(
                    title: Text(
                      logic.grave!.dead_name!,
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: backgroundColor,
                  ),
                  body: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                        colors: [backgroundColor, Colors.blueAccent],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )),
                      child: ListView(children: [
                        // buildGraveDetailsTable(logic.grave!),
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 18),
                              child:
                                  // Row(
                                  //   mainAxisAlignment:
                                  //       MainAxisAlignment.spaceEvenly,
                                  //   children: [
                                  SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Text(
                                      textAlign: TextAlign.justify,
                                      softWrap: true,
                                      logic.grave!.dead_name!,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Text(
                                      ": اسم المدفون",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              // Row(
                              //   children: [
                              //     Column(
                              //       crossAxisAlignment:
                              //           CrossAxisAlignment.start,
                              //       children: [
                              //         // buildText(logic.grave!.dead_name!)
                              //         Wrap(children: [
                              //           Text(
                              //             textAlign: TextAlign.justify,
                              //             softWrap: true,
                              //             logic.grave!.dead_name!,
                              //             style: const TextStyle(
                              //               fontSize: 15,
                              //               fontWeight: FontWeight.bold,
                              //             ),
                              //           ),
                              //           const Text(
                              //             ": اسم المدفون",
                              //             style: TextStyle(
                              //                 fontSize: 15,
                              //                 fontWeight: FontWeight.bold),
                              //           ),
                              //         ]),
                              //       ],
                              //     ),
                              //     // const SizedBox(
                              //     //   width: 10,
                              //     // ),
                              //   ],
                              // ),
                              //   ],
                              // ),
                            ),
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 12.0),
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(
                        //         20,
                        //       ),
                        //       color: Colors.white,
                        //     ),
                        //     child: Padding(
                        //       padding: const EdgeInsets.all(18.0),
                        //       child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         children: [
                        //           Row(
                        //             children: [
                        //               Text(
                        //                 logic.grave!.age!,
                        //                 style: const TextStyle(
                        //                     fontSize: 19,
                        //                     fontWeight: FontWeight.bold),
                        //               ),
                        //               const Text(
                        //                 ": العمر",
                        //                 style: TextStyle(
                        //                     fontSize: 19,
                        //                     fontWeight: FontWeight.bold),
                        //               ),
                        //             ],
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 12.0),
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(
                        //         20,
                        //       ),
                        //       color: Colors.white,
                        //     ),
                        //     child: Padding(
                        //       padding: const EdgeInsets.all(18.0),
                        //       child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         children: [
                        //           Row(
                        //             children: [
                        //               Text(
                        //                 logic.grave!.nationality!,
                        //                 style: const TextStyle(
                        //                     fontSize: 19,
                        //                     fontWeight: FontWeight.bold),
                        //               ),
                        //               const Text(
                        //                 ": الجنسية",
                        //                 style: TextStyle(
                        //                     fontSize: 19,
                        //                     fontWeight: FontWeight.bold),
                        //               ),
                        //             ],
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 12.0),
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(
                        //         20,
                        //       ),
                        //       color: Colors.white,
                        //     ),
                        //     child: Padding(
                        //       padding: const EdgeInsets.all(18.0),
                        //       child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         children: [
                        //           Row(
                        //             children: [
                        //               Text(
                        //                 logic.grave!.identity!,
                        //                 style: const TextStyle(
                        //                     fontSize: 19,
                        //                     fontWeight: FontWeight.bold),
                        //               ),
                        //               const Text(
                        //                 ": رقم الهوية",
                        //                 style: TextStyle(
                        //                     fontSize: 19,
                        //                     fontWeight: FontWeight.bold),
                        //               ),
                        //             ],
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Padding(
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        logic.grave!.burial_date!,
                                        style: const TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Text(
                                        ": تاريخ الوفاة",
                                        style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        logic.grave!.medical_diagnosis!,
                                        style: const TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Text(
                                        ": سبب الوفاة",
                                        style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        logic.grave!.hospital_name!,
                                        style: const TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Text(
                                        ": المشفى",
                                        style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Container(
                          height: 600,
                          width: double.infinity,
                          child: GoogleMap(
                            indoorViewEnabled: true,
                            zoomControlsEnabled: true,
                            zoomGesturesEnabled: true,
                            mapToolbarEnabled: true,
                            myLocationEnabled: true,
                            myLocationButtonEnabled: true,
                            trafficEnabled: true,
                            minMaxZoomPreference: MinMaxZoomPreference(18, 24),
                            padding: EdgeInsets.symmetric(vertical: 99),
                            mapType: MapType.satellite,
                            onCameraMove: (position) {
                              setState(() {
                                logic.cameraPosition = CameraPosition(
                                    target: position.target,
                                    zoom: position.zoom);
                              });
                            },
                            onCameraMoveStarted: () {
                              _mapController.moveCamera(
                                  CameraUpdate.newCameraPosition(CameraPosition(
                                      target: LatLng(logic.lat, logic.lng),
                                      zoom: 24.0)));
                            },
                            initialCameraPosition: logic.cameraPosition == null
                                ? CameraPosition(
                                    target: LatLng(logic.lat, logic.lng),
                                    zoom: 24.0)
                                : logic.cameraPosition!,
                            onMapCreated: (controller) {
                              _mapController = controller;
                            },
                            markers: {
                              Marker(
                                markerId: const MarkerId('my_marker'),
                                position: LatLng(logic.lat, logic.lng),
                                infoWindow: InfoWindow(
                                  title: logic.grave != null
                                      ? logic.grave!.dead_name
                                      : "",
                                  snippet: logic.grave != null
                                      ? logic.grave!.city
                                      : "",
                                ),
                              ),
                            },
                          ),
                        ),
                      ]),
                    ),
                  ),
                  // floatingActionButton: ,
                );
        });
  }

//   Table buildGraveDetailsTable(Grave preson) {
//     return Table(
//       textBaseline: TextBaseline.alphabetic,
//       border: TableBorder(
//           horizontalInside: BorderSide(
//               color: const Color.fromARGB(255, 178, 223, 219), width: 0.5)),
//       columnWidths: const {
//         0: FlexColumnWidth(2), // Adjust column widths as needed
//         1: FlexColumnWidth(1),
//       },
//       children: [
//         TableRow(children: [
//           const Text('Name:'),
//           Text(preson.name!),
//         ]),
//         TableRow(children: [
//           const Text('Age:'),
//           Text(preson.age.toString()),
//         ]),
//         TableRow(children: [
//           const Text('Nationality:'),
//           Text(preson.nationality!),
//         ]),
//         TableRow(children: [
//           const Text('Burial Date:'),
//           Text(preson.burial_date!),
//         ]),
//       ],
//     );
//   }
}
