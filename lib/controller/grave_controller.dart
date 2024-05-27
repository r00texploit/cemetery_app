import 'dart:convert';

import 'package:elrawdah/constants.dart';
import 'package:elrawdah/model/all_grave.dart';
import 'package:elrawdah/model/grave.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GraveController extends GetxController {
  List<AllGrave>? allGrave;
  Grave? grave;
  List<Grave> graveData = <Grave>[];
  CameraPosition? cameraPosition;
  List<Grave> graveDataSearch = <Grave>[];
  double lat = 0.0;
  double lng = 0.0;

  String? name;
  var id;

  bool loading = false;
  bool mapLoading = false;

  getAllGrave(int? id) async {
    loading = true;
    print("Get Grave");
    print(" get response from: $baseUrlApi$allGraveApi");
    var response = await dio.get("$allGraveApi/$id");
    var data = jsonEncode(response.data["data"]);
    var res = jsonDecode(data);
    allGrave = AllGrave.parseJson(res);
    loading = false;
    update();
  }

  getGraveDetails(String? id) async {
    mapLoading = true;
    var response = await dio.get("${graveDetailsApi}/$id");
    grave = Grave.fromJson(response.data['data'][0]);
    lat = grave!.latitude!;
    lng = grave!.Longitude!;
    print("grave lat: ${grave!.latitude}");
    print("grave lng: ${grave!.Longitude}");
    cameraPosition = CameraPosition(target: LatLng(lat, lng), zoom: 24.0);
    print("latitude: ${grave!.latitude!}");
    mapLoading = false;
    update();
  }

  getAllGraveData() async {
    var response = await dio.get("${searchApi}");
    graveDataSearch = Grave.parseJson(response.data["data"]);
    // for (var element in graveDataSearch) {
    //   print("search object: ${element.dead_name}");
    // }
    update();
  }

    List<Grave> filterSearchResults(String query,String cemetery_name){
    // setState(() {
      return graveDataSearch.where((item) {
        print("query object: $query");
        print("item object: ${item.dead_name}");
        if (item.dead_name!.contains(query) && item.cemetery_name!.contains(cemetery_name)) {
          return true;
        } else {
          return false;
        }
      }).toList();
    // });
  }

  List<Grave> GetSearchData(String search) {
    List<Grave> tempList = [];
    for (var i in graveDataSearch) {
      if (i.dead_name!.contains(search)) {
        print("father: ${i.dead_name}");
        tempList.add(i);
      } else if (i.cemetery_name!.contains(search)) {
        print("grand_father: ${i.cemetery_name}");
        tempList.add(i);
      } else if (i.city!.contains(search)) {
        print("great_grand_father: ${i.city}");
        tempList.add(i);
      }
    }
    return tempList;
  }

  Future<List<Grave>> getStreamData() async {
    var allGraveData = <Grave>[];
    for (var i = 0; i < allGrave!.length; i++) {
      print("${i}:${allGrave![i].id!}");
      allGraveData.add(await getGraveDetails(allGrave![i].id!));
    }
    return allGraveData;
  }
}
