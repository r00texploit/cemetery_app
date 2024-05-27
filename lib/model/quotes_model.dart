import 'package:json_annotation/json_annotation.dart';

part 'quotes_model.g.dart';

@JsonSerializable()
class Quote {
  String? title;
  String? subTitle;
  String? text;

  Quote({
    this.title,
    this.subTitle,
    this.text,
  });

  factory Quote.fromJson(Map<String, dynamic> json) => _$QuoteFromJson(json);

  Map<String, dynamic> toJson() => _$QuoteToJson(this);

  static List<Quote> parseJson(jsonData) {
    print("object: ${jsonData.runtimeType}");
    var data = jsonData as List<dynamic>;
    return data.map((item) => Quote.fromJson(item)).toList();
  }
}
