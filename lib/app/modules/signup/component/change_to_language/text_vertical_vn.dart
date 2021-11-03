import 'package:apphrm/app/components/check_size.dart';
import 'package:apphrm/app/components/colors.dart';
import 'package:apphrm/app/components/size_screen_phone.dart';
import 'package:apphrm/app/modules/screen_saver/controllers/screen_saver_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerticalTextSingupVN extends StatelessWidget {
  String title1;

  var screenSaverController = Get.put(ScreenSaverController());

  VerticalTextSingupVN(this.title1,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            top: SizePhone(context).height/330,
            left: SizePhone(context).width/20),
        child: RotatedBox(
          quarterTurns: -1,
          child: Text(title1,
            style: TextStyle(
                color: kColorWhite,
                fontSize: screenSaverController.title.value == "Tiếng Việt" ? SizePhone(context).height/15 : SizePhone(context).height/10,
                fontWeight: FontWeight.w900,
                fontFamily: checkFont()
            ),
          ),
        )
    );
  }
}
