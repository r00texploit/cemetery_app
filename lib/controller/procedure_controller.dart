import 'dart:convert';

import 'package:elrawdah/model/procedures.dart';
import 'package:get/get.dart';

import '../constants.dart';

class ProcedureController extends GetxController {
  var procedures = <Procedures>[];
  var loading;

  getProcedures() async {
    loading = true;
    print(" get response from: $baseUrlApi$proceduresApi");
    var response = await dio.get(proceduresApi);
    var data = jsonEncode(response.data["data"]);
    var res = jsonDecode(data);

    procedures = Procedures.parseJson(res);
    print("${procedures.length}");
    loading = false;
    update();
  }
}
