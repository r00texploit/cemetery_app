import 'dart:convert';

import 'package:elrawdah/model/quotes_model.dart';
import 'package:get/get.dart';

import '../constants.dart';

class QuotesController extends GetxController {
  var quotes = <Quote>[];
  var loading;
  getQuotes() async {
    loading = true;
    print(" get response from: $baseUrlApi$quoteApi");
    var response = await dio.get(quoteApi);
    var data = jsonEncode(response.data["data"]);
    var res = jsonDecode(data);

    quotes = Quote.parseJson(res);
    print("${quotes.length}");
    loading = false;
    update();
  }
}
