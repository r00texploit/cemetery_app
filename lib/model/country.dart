class Country {
  final String? name;
  final int? id;
  const Country({this.name, this.id});
  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(name: json["name"], id: json['id']);
  }
  static List<Country> parseJson(json) {
    print("Country: $json");
    var data = json as List<dynamic>;
    return data.map((item) => Country.fromJson(item)).toList();
  }
}
