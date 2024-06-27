class Cemetery {
  String? name, city;
  int? id;
  Cemetery({this.name, this.id, this.city});
  factory Cemetery.fromJson(Map<String, dynamic> json) {
    return Cemetery(name: json["name"], id: json['id'], city: json['city']);
  }
  static List<Cemetery> parseJson(json) {
    print("Cemetery: $json");
    var data = json as List<dynamic>;
    return data.map((item) => Cemetery.fromJson(item)).toList();
  }
}

class CemeteryData {
  String? name, latitude, longitude, description,phone;
  int? id;
  CemeteryData(
      {required this.name,

      required this.latitude,
      required this.longitude,
      required this.description,
      required this.phone,
      required this.id});
  factory CemeteryData.fromJson(Map<String, dynamic> json) {
    return CemeteryData(
        name: json["name"],
        id: json["id"],
        latitude: json['latitude'],
        longitude: json['Longitude'],
        description: json['description'],
        phone: json['phone']);
  }
}

  double convertDmsToLat(String dms) {
  // Split the DMS string into degrees, minutes, and seconds
  List<double> parts = dms.split(RegExp(r"[^\d\-+\.]")).map(double.parse).toList();

  // Check for valid DMS format (Degrees, Minutes, Seconds, optional direction)
  if (parts.length < 2 || parts.length > 4) {
    throw Exception("Invalid DMS format");
  }

  // Extract degrees, minutes, and seconds (handle negative values)
  double degrees = parts[0];
  double minutes = parts.length > 1 ? parts[1] : 0;
  double seconds = parts.length > 2 ? parts[2] : 0;
  bool isNegative = degrees < 0;

  // Convert minutes and seconds to decimal degrees
  double decimalDegrees = degrees + minutes / 60 + seconds / 3600;

  // Apply negative sign if necessary
  return isNegative ? -decimalDegrees : decimalDegrees;
}

 double convertDmsToLong(String dms) {
  // Similar logic as convertDmsToLat, but consider longitude range
  double decimalDegrees = convertDmsToLat(dms);
  if (decimalDegrees > 180 || decimalDegrees < -180) {
    throw Exception("Invalid longitude value (must be between -180 and 180)");
  }
  return decimalDegrees;
}
