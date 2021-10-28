import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/screen_saver_controller.dart';

class ScreenSaverView extends GetView<ScreenSaverController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScreenSaverView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ScreenSaverView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
