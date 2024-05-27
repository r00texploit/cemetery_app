import 'package:flutter/material.dart';
// import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import '../../constants.dart';

class Greet extends StatelessWidget {
  const Greet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'مرحبا بك',
          style: greetText,
        ),
        IconButton(
          onPressed: () async {
            var res = await scanBarcode();
            var barCode = res;
            print(barCode);
            launchUrl(barCode);
          },
          icon: const Icon(Icons.qr_code_scanner),
        )
      ],
    );
  }

  Future<String?> scanBarcode() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);
    final List<BarcodeFormat> formats = [BarcodeFormat.all];
    // final barcodeScanner = BarcodeScanner(formats: formats);

    if (pickedImage != null) {
      final inputImage = InputImage.fromFilePath(pickedImage.path);
      final barcodeScanner = BarcodeScanner(formats: formats);
      final visionLabels = await barcodeScanner.processImage(inputImage);
      for (final Barcode barcode in visionLabels) {
        final rawValue = barcode.rawValue;
        return rawValue;
      }
    }
    return "not-found";
  }

  void launchUrl(String? res) async {
    if (await canLaunchUrl(Uri.parse(res!))) {
      await launchUrlString(res, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $res';
    }
  }
}
