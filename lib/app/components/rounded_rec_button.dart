import 'package:apphrm/app/components/check_size.dart';
import 'package:apphrm/app/components/colors.dart';
import 'package:apphrm/app/components/size_screen_phone.dart';
import 'package:apphrm/app/modules/screen_saver/controllers/screen_saver_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoundedRecButton extends StatelessWidget {
  String title;
  List<Color> gradient;
  double radiusBorder;
  VoidCallback press;

  var screenSaverController = Get.put(ScreenSaverController());

  RoundedRecButton(this.title,this.gradient, this.radiusBorder, this.press,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Stack(
          alignment: Alignment.center,
          children: [
            InkWell(
              onTap: press,
              child: Container(
                alignment: Alignment.center,
                width: SizePhone(context).width/1.4,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radiusBorder),
                  ),
                  gradient: LinearGradient(
                      colors: gradient,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight
                  ),
                ),
                child: Text(title,style: TextStyle(
                    color: kColorWhite,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    fontFamily: checkFont(),
                ),),
                padding: EdgeInsets.only(top: 16, bottom: 16),
              ),
            )
          ],
        ),
      );
  }
}
