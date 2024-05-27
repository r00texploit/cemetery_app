import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_google_street_view/flutter_google_street_view.dart';
import 'package:google_fonts/google_fonts.dart';

const logo = "images/raheel.png";
const slogin = "images/slogin.png";
const fogira = "images/fogira.png";

// const LatLng SYDNEY = LatLng(-33.87365, 151.20689);
// const LatLng SAN_FRAN = LatLng(37.769263, -122.450727);
// const String SANTORINI = "WddsUw1geEoAAAQIt9RnsQ";
// const LatLng INVALID = LatLng(-45.125783, 151.276417);
const int PAN_BY_DEG = 30;
const double ZOOM_BY = 0.5;

const greetText = TextStyle(
  color: Colors.white,
  fontSize: 27.0,
  fontWeight: FontWeight.bold,
);

const logoText = TextStyle(
  color: Colors.white,
  fontSize: 32.0,
  fontWeight: FontWeight.bold,
);

const baseUrlApi = "https://cemetery.bmwit.com/api/";

const posts = "posts";
const graves = "graves";

const cemeteries = "cemeteries";

const quoteApi = "$posts/quote";
const teachingApi = "$posts/teaching";
const proceduresApi = "$posts/procedure";
const historicalGravesApi = "$posts/historical-grave";
const allHistoricalGravesApi = "$posts/historical-grave-all";

const countryApi = "$cemeteries/get-country";
const cemeteryApi = "$cemeteries/get-cemetery";
const cemeteryDetailsApi = "$cemeteries/get-cemetery-details";

const graveDetailsApi = "$graves/get-grave-details";
const allGraveApi = "$graves/get-all-grave";
const searchApi = "$graves/get-graves";

const backgroundColor = Colors.blue;

const appNameText = Text(
  ' تطبيق راحيل',
  textAlign: TextAlign.center,
  style: greetText,
);

const textStyle = TextStyle(
  fontSize: 24,
);

var fontStyle = GoogleFonts.cairo(fontSize: 19, color: Colors.white);

var dio = Dio(
  BaseOptions(
    baseUrl: baseUrlApi,
  ),
);
