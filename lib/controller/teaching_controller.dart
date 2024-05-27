import 'dart:convert';

import 'package:elrawdah/model/teaching.dart';
import 'package:get/get.dart';

import '../constants.dart';

class TeachingController extends GetxController {
  var teaching = <Teaching>[];
  var loading;

  getTeaching() async {
    loading = true;
    print(" get response from: $baseUrlApi$teachingApi");
    var response = await dio.get(teachingApi);
    var data = jsonEncode(response.data["data"]);
    var res = jsonDecode(data);

    teaching = Teaching.parseJson(res);
    print("${teaching.length}");
    loading = false;
    update();
  }
}
