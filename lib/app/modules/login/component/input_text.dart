import 'package:apphrm/app/components/check_size.dart';
import 'package:apphrm/app/components/size_screen_phone.dart';
import 'package:apphrm/app/modules/screen_saver/controllers/screen_saver_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

InputDecoration buildInputDecotation(BuildContext context,String title, Widget widgets, Color color, color2){
  var screenSaverController = Get.put(ScreenSaverController());
  return InputDecoration(
      isDense: true,
      contentPadding: EdgeInsets.all(13),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color ,width: 1),
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color ,width: 1),
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      hintText: title,
      hintStyle: TextStyle(
          color: color2,
          fontFamily: checkFont(),
          fontWeight: FontWeight.w600,
          fontSize: checkSizeFontInputText(context),
          height: 0
      ),
      prefixIcon: widgets,
      prefixText: "|",
      errorStyle: TextStyle(
          fontFamily: checkFont(),
          fontWeight: FontWeight.w600,
          fontSize: SizePhone(context).height/45,
          height: 1
      ),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFFFD50000) ,width: 1),
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFFFD50000) ,width: 1),
          borderRadius: BorderRadius.all(Radius.circular(20))
      )
  );
}
