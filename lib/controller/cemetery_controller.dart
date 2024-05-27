import 'dart:convert';

import 'package:elrawdah/constants.dart';
import 'package:elrawdah/model/cemetery.dart';
import 'package:elrawdah/model/country.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CemeteryController extends GetxController {
  List<Cemetery> allCemetery = <Cemetery>[];
  Cemetery? selectedCemetery;
  CemeteryData? cemeteryData;
  CameraPosition? cameraPosition;
  double lat = 0.0;
  double lng = 0.0;

  String? name;
  var id;

  bool loading = false;
  bool mapLoading = false;

  // Grave? grave;
  getAllCemetery(Country selectedCountry) async {
    id = selectedCountry.id!;
    // print("Get Cemetery of ${country.allCountry[id]}");
    print(" get response from: $baseUrlApi$cemeteryApi/$id");

    loading = true;
    var response = await dio.get("$cemeteryApi/$id");
    var data = jsonEncode(response.data["data"]);
    var res = jsonDecode(data);
    allCemetery = Cemetery.parseJson(res);
    loading = false;
    update();
  }

  getCemeteryDetails(int id) async {
    print(" get response from: $baseUrlApi$cemeteryDetailsApi/$id");

    mapLoading = true;
    var response = await dio.get("$cemeteryDetailsApi/$id");
    print("data: ${response.data}");

    cemeteryData = CemeteryData.fromJson(response.data["data"]);
    lat = double.parse(cemeteryData!.latitude!);
    lng = double.parse(cemeteryData!.longitude!);
    cameraPosition = CameraPosition(target: LatLng(lat, lng), zoom: 10);
    print("latitude: ${cemeteryData!.latitude!}");
    mapLoading = false;
    update();
  }
}
