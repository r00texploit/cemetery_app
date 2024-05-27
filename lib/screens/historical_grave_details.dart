import 'package:elrawdah/constants.dart';
import 'package:elrawdah/controller/historical_grave_controller.dart';
import 'package:elrawdah/screens/all_grave.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HistoricalGravesDetails extends StatefulWidget {
  final String? id;
  const HistoricalGravesDetails({super.key, this.id});

  @override
  State<HistoricalGravesDetails> createState() =>
      _HistoricalGravesDetailsState();
}

class _HistoricalGravesDetailsState extends State<HistoricalGravesDetails> {
  HistoricalGravesController _historicalGravesController =
      Get.put(HistoricalGravesController());
  late GoogleMapController _mapController;

  @override
  void initState() {
    super.initState();
    initCemetery();
  }

  initCemetery() async {
    await _historicalGravesController.getHistoricalGraves(widget.id!);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoricalGravesController>(builder: (logic) {
      logic.historicalGrave = _historicalGravesController.historicalGrave;
      // logic.cameraPosition = _cemeteryController.cameraPosition;
      // logic.lat = _cemeteryController.lat;
      // logic.lng = _cemeteryController.lng;
      return _historicalGravesController.loading
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
                title: Text(
                  "${logic.historicalGrave!.name!}",
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: backgroundColor,
              ),
              body: Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  colors: [backgroundColor, Colors.blueAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
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
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        logic.historicalGrave!.name!,
                                        style: const TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    ":اسم المقبرة",
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
                    // SizedBox(
                    //   height: 480,
                    //   width: double.infinity,
                    //   child: GoogleMap(
                    //     zoomControlsEnabled: true,
                    //     zoomGesturesEnabled: true,
                    //     indoorViewEnabled: true,
                    //     myLocationButtonEnabled: true,
                    //     minMaxZoomPreference: MinMaxZoomPreference(10, 24),
                    //     onCameraMove: (position) {
                    //       setState(() {
                    //         logic.cameraPosition = CameraPosition(
                    //             target: position.target, zoom: position.zoom);
                    //       });
                    //     },
                    //     onCameraMoveStarted: () {
                    //       _mapController.moveCamera(
                    //           CameraUpdate.newCameraPosition(CameraPosition(
                    //               target: LatLng(logic.lat, logic.lng),
                    //               zoom: 10.0)));
                    //     },
                    //     initialCameraPosition: logic.cameraPosition == null
                    //         ? CameraPosition(
                    //             target: LatLng(logic.lat, logic.lng),
                    //             zoom: 10.0)
                    //         : logic.cameraPosition!,
                    //     onMapCreated: (controller) {
                    //       _mapController = controller;
                    //     },
                    //     markers: {
                    //       Marker(
                    //         markerId: const MarkerId('my_marker'),
                    //         position: LatLng(
                    //             logic.lat,
                    //             logic
                    //                 .lng), // Replace with the latitude and longitude you want to locate
                    //         infoWindow: InfoWindow(
                    //           title: logic.selectedCemetery != null
                    //               ? logic.selectedCemetery!.name
                    //               : "",
                    //           snippet: logic.selectedCemetery != null
                    //               ? logic.selectedCemetery!.city
                    //               : "",
                    //         ),
                    //       ),
                    //     },
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
                                  TextButton(
                                    onPressed: () {
                                      Get.to(() => AllGraves(
                                          id: logic.historicalGrave!.id!,
                                          cemetery_name: logic.historicalGrave!.name!));
                                    },
                                    child: const Text(
                                      "عرض التفاصيل",
                                      style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ));
    });
  }
}
