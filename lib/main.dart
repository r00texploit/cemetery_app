import 'package:elrawdah/constants.dart';
import 'package:elrawdah/controller/cemetery_controller.dart';
import 'package:elrawdah/controller/grave_controller.dart';
import 'package:elrawdah/screens/widgets/on_bourding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splash_view/splash_view.dart';

void main() {
  var logic = Get.put(GraveController());
  WidgetsFlutterBinding.ensureInitialized();
  logic.getAllGraveData();
  runApp(GetMaterialApp(
      initialBinding: initBinding(),
      debugShowCheckedModeBanner: false,
      title: 'Raheel App',
      home: SplashView(
        backgroundColor: Colors.indigo,
        duration: const Duration(seconds: 9),
        done: Done(const OnBoarding(), curve: Curves.easeOut),
        gradient: const LinearGradient(
          colors: [Colors.blueAccent, Colors.blue],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        logo: Image.asset(logo),
      )));
}

initBinding() {
  Get.put<CemeteryController>(CemeteryController());
  Get.put<GraveController>(GraveController());
}
