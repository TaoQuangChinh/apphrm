import 'package:apphrm/app/components/check_size.dart';
import 'package:apphrm/app/components/colors.dart';
import 'package:apphrm/app/components/size_screen_phone.dart';
import 'package:apphrm/app/modules/login/component/text_hearder.dart';
import 'package:apphrm/app/modules/login/component/vertical_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/fingerprint_controller.dart';

class FingerprintView extends GetView<FingerprintController> {
  var controller = Get.put(FingerprintController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: SizePhone(context).height,
        width: SizePhone(context).width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: controller.fingerprintGradients,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: SizePhone(context).height/44),
            Center(
              child: Icon(Icons.check, color: kColorWhite,size: SizePhone(context).height/20,),
            ),
            Row(
              children: [
                VerticalText("fingerprint".tr),
                TextHeader('fingerprint_login'.tr),
              ],
            ),
            SizedBox(height: checkSize() ? SizePhone(context).height/2.8 : SizePhone(context).height/7),
            Center(
              child: Icon(Icons.fingerprint, color: kColorWhite, size: SizePhone(context).height/9,)
            ),
            SizedBox(height: SizePhone(context).height/44),
            GestureDetector(
              onTap: (){
                Get.back();
              },
              child: FittedBox(
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back_ios_sharp, color: kColorWhite,size: SizePhone(context).height/40,),
                      Icon(Icons.arrow_back_ios_sharp, color: kColorWhite,size: SizePhone(context).height/40,),
                      Text("for_you_firts".tr, style: TextStyle(
                          fontFamily: checkFont(),
                          color: kColorWhite,
                          fontWeight: FontWeight.w600,
                          fontSize: SizePhone(context).height/40
                      ),)
                    ],
                  )
              )
            )
          ],
        )
      )
    );
  }
}
