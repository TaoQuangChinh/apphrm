import 'package:apphrm/app/components/rounded_rec_button.dart';
import 'package:apphrm/app/components/size_screen_phone.dart';
import 'package:apphrm/app/modules/screen_saver/controllers/screen_saver_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodySaver extends StatelessWidget {
  PageController controllerPage;
  BodySaver(this.controllerPage,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScreenSaverController>(
        init: ScreenSaverController(),
        builder: (controller){
          return Positioned(
            top: SizePhone(context).height/1.8,
            left: SizePhone(context).width/7,
            child: Column(
              children: [
                RoundedRecButton(
                    "SIGN IN",
                    controller.signInGradients,
                    30,
                        (){
                      controllerPage.animateToPage(
                          0,
                          duration: Duration(milliseconds: 800),
                          curve: Curves.bounceOut);
                    }
                ),
                SizedBox(height: SizePhone(context).height/200),
                RoundedRecButton(
                    "SIGN UP",
                    controller.signUpGradients,
                    30,
                        (){
                      controllerPage.animateToPage(
                          2,
                          duration: Duration(milliseconds: 800),
                          curve: Curves.bounceOut);
                    }
                ),
              ],
            ),
          );
        });
  }
}
