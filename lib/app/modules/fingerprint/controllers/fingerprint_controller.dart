import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FingerprintController extends GetxController {
  List<Color> fingerprintGradients = [
    Color(0xFFFFE040FB),
    Color(0xFFFF651FFF)];

  final count = 0.obs;
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
  void increment() => count.value++;
}
