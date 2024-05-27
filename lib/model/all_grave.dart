class AllGrave {
  final String? name;
  final String? id;
  const AllGrave({this.name, this.id});
  factory AllGrave.fromJson(Map<String, dynamic> json) {
    return AllGrave(name: json["name"], id: json['id']);
  }
  static List<AllGrave> parseJson(json) {
    print("object: $json");
    var data = json as List<dynamic>;
    return data.map((item) => AllGrave.fromJson(item)).toList();
  }
}
