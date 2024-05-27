// import 'dart:html';
// import 'package:regexpattern/regexpattern.dart'
// as regex; // Import the regex package

class Grave {
  final String? id;
  final String? name;
  final String? dead_name;
  // final String? father;
  // final String? grand_father;
  // final String? great_grand_father;
  final String? medical_diagnosis;
  final String? hospital_name;
  // final String? age;
  // final String? nationality;
  // final String? identity;
  final String? date_of_death;
  final String? burial_date;
  final String? cemetery_name;
  final String? city;
  final String? country;
  final double? latitude;
  final double? Longitude;

  const Grave({
    this.id,
    this.name,
    this.dead_name,
    this.date_of_death,
    this.burial_date,
    this.cemetery_name,
    this.city,
    this.country,
    this.latitude,
    this.Longitude,
    this.medical_diagnosis,
    this.hospital_name,
    // this.age,
    // this.nationality,
    // this.identity
    // this.father,
    // this.great_grand_father,
    // this.grand_father,
  });

  static double convertDmsToLat(String latitudeString) {
    var lat = 0.0;

    // String regexPattern =
    //     r"(?P<degrees>\\d+)°\s+(?P<minutes>\\d+)'\s+(?P<seconds>[0-9.]+)\s*(?P<direction>[EW])";
    // String regexPattern = r"[°']";

    try {
      // var re = RegExp(regexPattern);
      String lastLetter =
          latitudeString.trim().substring(latitudeString.length - 1);
      List<String> parts = latitudeString
          .split(RegExp(r'[^0-9.]'))
          .where((e) => e.isNotEmpty)
          .toList();

      // print("$latitudeString");

      // final match = re.firstMatch(latitudeString);
      // if (match != null) {
      final degrees = double.parse(parts[0]);
      final minutes = double.parse(parts[1]);
      final seconds = double.parse(parts[2]);
      // final direction = lastLetter;

      // Convert minutes and seconds to decimal degrees
      final decimalDegrees = (minutes / 60) + (seconds / 3600);

      // Handle easting (positive) or westing (negative)
      // final multiplier = direction == 'E' || direction == 'N' ? 1 : -1;

      // Add the sign based on the direction
      final latitude = degrees + decimalDegrees;
      // print("Converted latitude: ${double.parse(latitude.toStringAsFixed(7))}");
      return latitude;
      // } else {
      //   print("Invalid latitude format");
      // }
    } catch (e) {
      print("Error parsing latitude values");
    }
    // print("converted lat: ${double.parse(lat.toStringAsFixed(10))}");
    return double.parse(lat.toStringAsFixed(7));
  }

  static double convertDmsToLong(String dms) {
    // Similar logic as convertDmsToLat, but consider longitude range
    double decimalDegrees = convertDmsToLat(dms);
    if (decimalDegrees > 180 || decimalDegrees < -180) {
      throw Exception("Invalid longitude value (must be between -180 and 180)");
    }
    return decimalDegrees;
  }

  factory Grave.fromJson(Map<String, dynamic> json) {
    var lat = convertDmsToLat(json["latitude"]);
    var long = convertDmsToLong(json["Longitude"]);
    // print("${json["dead_name"]}");

    return Grave(
        id: json['id'],
        name: json["name"],
        dead_name: json["dead_name"],
        date_of_death: json['date_of_death'],
        burial_date: json['burial_date'],
        cemetery_name: json['cemetery_name'],
        city: json['city'],
        country: json['country'],
        latitude: long,
        Longitude: lat,
        // father: json['father'],
        // great_grand_father: json['great_grand_father'],
        // grand_father: json['grand_father'],
        medical_diagnosis: json['medical_diagnosis'],
        hospital_name: json['hospital_name']);
    // age: json['age'] ?? "0",
    // nationality: json['nationality'] ?? "غير مبين",
    // identity: json['identity'] ?? "غير مبين");
  }
  static List<Grave> parseJson(json) {
    var data = json as List<dynamic>;
    return data.map((item) => Grave.fromJson(item)).toList();
  }
}
