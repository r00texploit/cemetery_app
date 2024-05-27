import 'package:json_annotation/json_annotation.dart';

part 'procedures.g.dart';

@JsonSerializable()
class Procedures {
  final String? title;
  final String? subTitle;
  final String? text;

  Procedures({
    this.title,
    this.subTitle,
    this.text,
  });

  factory Procedures.fromJson(Map<String, dynamic> json) =>
      _$ProceduresFromJson(json);

  Map<String, dynamic> toJson() => _$ProceduresToJson(this);

  static List<Procedures> parseJson(jsonData) {
    print("object: ${jsonData.runtimeType}");
    var data = jsonData as List<dynamic>;
    return data.map((item) => Procedures.fromJson(item)).toList();
  }
}
