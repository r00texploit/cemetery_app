import 'dart:convert';

import 'package:elrawdah/model/historical_grave.dart';
import 'package:get/get.dart';

import '../constants.dart';

class HistoricalGravesController extends GetxController {
  var listHistoricalGraves = <HistoricalGraves>[];
  var historicalGrave;

  var loading;
  getAllHistoricalGraves() async {
    loading = true;
    print(" get response from: $baseUrlApi$historicalGravesApi");
    var response = await dio.get(historicalGravesApi);
    var data = jsonEncode(response.data["data"]);
    var res = jsonDecode(data);

    print("res: $res");
    listHistoricalGraves = HistoricalGraves.parseJson(res);
    print("${listHistoricalGraves.length}");
    loading = false;
    update();
  }

  getHistoricalGraves(String? id) async {
    loading = true;
    print(" get response from: $baseUrlApi$historicalGravesApi/$id");
    var response = await dio.get("$historicalGravesApi/$id");
    var data = jsonEncode(response.data["data"]);
    var res = jsonDecode(data);

    print("API response: $res");
    historicalGrave = HistoricalGraves.fromJson(res);
    print("${historicalGrave.length}");
    loading = false;
    update();
  }
}
