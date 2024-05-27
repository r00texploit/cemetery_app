import 'package:json_annotation/json_annotation.dart';

part 'contact.g.dart';

@JsonSerializable()
class Contact {
  final String? name;
  final String? url;
  final String? icon;

  Contact({
    this.name,
    this.url,
    this.icon,
  });

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);

  Map<String, dynamic> toJson() => _$ContactToJson(this);

  static List<Contact> parseJson(Map<String, dynamic> jsonData) {
    print("object: ${jsonData['data'].runtimeType}");
    var data = jsonData['data'] as List<dynamic>;
    return data.map((item) => Contact.fromJson(item)).toList();
  }
}
