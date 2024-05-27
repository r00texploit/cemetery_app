import 'package:json_annotation/json_annotation.dart';

part 'teaching.g.dart';

@JsonSerializable()
class Teaching {
  final String? title;
  final String? subTitle;
  final String? text;

  Teaching({
    this.title,
    this.subTitle,
    this.text,
  });

  factory Teaching.fromJson(Map<String, dynamic> json) =>
      _$TeachingFromJson(json);

  Map<String, dynamic> toJson() => _$TeachingToJson(this);

  static List<Teaching> parseJson(jsonData) {
    print("object: ${jsonData.runtimeType}");
    var data = jsonData as List<dynamic>;
    return data.map((item) => Teaching.fromJson(item)).toList();
  }
}
