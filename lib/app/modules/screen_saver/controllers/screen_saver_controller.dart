import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ScreenSaverController extends GetxController {
  PageController controllerPage = PageController(initialPage: 1, viewportFraction: 1.0);

  late RxString changeText = "".obs;

  List<Color> signInGradients = [
    Color(0xFF0EDED2),
    Color(0xFF03A0FE),
  ];

  List<Color> signUpGradients = [
    Color(0xfff5e02a),
    Color(0xFFFF9945),
  ];

  List<Color> orangeGradients = [
    Color(0xFFFF9844),
    Color(0xFFFE8853),
    Color(0xFFFD7267),];

  List<Color> aquaGradients = [
    Color(0xFF5AEAF1),
    Color(0xFF8EF7DA),
  ];


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
