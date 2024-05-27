import 'dart:convert';

import 'package:elrawdah/constants.dart';
import 'package:elrawdah/model/country.dart';
import 'package:get/get.dart';

class CountryController extends GetxController {
  List<Country> allCountry = <Country>[];
  Country? selectedCountry;
  bool loading = true;

  getAllCountry() async {
    print(" Get Country");
    print(" get response from: $baseUrlApi$countryApi");

    loading = true;
    var response = await dio.get(countryApi);
    var data = jsonEncode(response.data["data"]);
    var res = jsonDecode(data);
    allCountry = Country.parseJson(res);
    loading = false;
    update();
  }

  void getCities(int i) {}

}
