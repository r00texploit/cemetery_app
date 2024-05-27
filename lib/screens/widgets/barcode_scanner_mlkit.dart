// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:google_ml_kit/google_ml_kit.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:url_launcher/url_launcher.dart';
// // import 'package:firebase_ml_vision/firebase_ml_vision.dart';

// // void main() => runApp(MyHomePage());

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   String? scannedText;

//   Future<void> _scanBarcode() async {
//     final barcode = await scanBarcode();
//     if (barcode != null) {
//       setState(() {
//         scannedText = barcode;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Barcode Scanner'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(scannedText ?? 'No barcode scanned yet'),
//               // scannedText != null ? launchUrl(scannedText) : Container(),
//               ElevatedButton(
//                 onPressed: () async {
//                   await _scanBarcode();
//                   launchUrl(scannedText!);
//                 },
//                 child: Text('Scan Barcode'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future<String?> scanBarcode() async {
//     final picker = ImagePicker();
//     final pickedImage = await picker.pickImage(source: ImageSource.camera);

//     if (pickedImage != null) {
//       final inputImage = InputImage.fromFilePath(pickedImage.path);
//       final barcodeScanner = GoogleMlKit.vision.barcodeScanner();
//       final visionLabels = await barcodeScanner.processImage(inputImage);
//       for (final Barcode barcode in visionLabels) {
//         final rawValue = barcode.rawValue;
//         return rawValue;
//       }
//     }
//     return null;
//   }

//   void launchUrl(String res) async {
//     if (await canLaunchUrl(Uri.parse(res))) {
//       launchUrl(res);
//     } else {
//       throw 'Could not launch $res';
//     }
//   }
// }
