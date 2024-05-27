import 'dart:convert';

import 'package:elrawdah/constants.dart';
import 'package:elrawdah/model/country.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  Rx<LatLng> currentLocation = const LatLng(18.0563677, 33.9861381).obs;
  List<Country>? country;

  void updateLocation(LatLng newLocation) {
    currentLocation.value = newLocation;
  }

  getLocation() async {
    print("Get Location");
    print(" get response from: $baseUrlApi$countryApi");

    var response = await dio.get(countryApi);
    var data = jsonEncode(response.data["data"]);
    var res = jsonDecode(data);
    country = Country.parseJson(res);
    update();
  }
}
