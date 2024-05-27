import 'package:json_annotation/json_annotation.dart';

part 'historical_grave.g.dart';

@JsonSerializable()
class HistoricalGraves {
  final String? title;
  final String? subTitle;
  final String? text;

  HistoricalGraves({
    this.title,
    this.subTitle,
    this.text,
  });

  factory HistoricalGraves.fromJson(Map<String, dynamic> json) =>
      _$HistoricalGravesFromJson(json);

  Map<String, dynamic> toJson() => _$HistoricalGravesToJson(this);

  static List<HistoricalGraves> parseJson(jsonData) {
    print("object: ${jsonData}");
    var data = jsonData as List<dynamic>;
    return data.map((item) => HistoricalGraves.fromJson(item)).toList();
  }
}
