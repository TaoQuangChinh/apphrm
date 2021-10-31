import 'package:apphrm/app/components/colors.dart';
import 'package:apphrm/app/modules/login/views/login_view.dart';
import 'package:apphrm/app/modules/screen_saver/component/background.dart';
import 'package:apphrm/app/modules/screen_saver/component/body.dart';
import 'package:apphrm/app/modules/signup/views/signup_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/screen_saver_controller.dart';

class ScreenSaverView extends GetView<ScreenSaverController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kColorWhite,
      body: Container(
        child: PageView(
          controller: controller.controllerPage,
          physics: new AlwaysScrollableScrollPhysics(),
          children: [
            LoginView(),
            body(controller.controllerPage),
            SignupView(),
          ],
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }

  Widget body(PageController controller){
    return Stack(
      children: [
        Background(),
        BodySaver(controller),
      ],
    );
  }
}
