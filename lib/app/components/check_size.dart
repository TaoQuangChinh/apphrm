import 'package:apphrm/app/components/size_screen_phone.dart';
import 'package:apphrm/app/modules/screen_saver/controllers/screen_saver_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

String? checkFont(){
  var screenSaverController = Get.put(ScreenSaverController());
  if(screenSaverController.title.value == "Tiếng Việt"){
    return null;
  }else{
    return 'ZenKurenaido';
  }
}

bool checkSize(){
  var screenSaverController = Get.put(ScreenSaverController());
  if(screenSaverController.title.value == "Tiếng Việt"){
    return true;
  }else if(checkLanguage() == "日本"){
    return true;
  }else{
    return false;
  }
}
double checkSizeFont(BuildContext context){
  var screenSaverController = Get.put(ScreenSaverController());
  if(screenSaverController.title.value == "Tiếng Việt"){
    return SizePhone(context).height/48;
  }else if(checkLanguage() == "日本"){
    return SizePhone(context).height/39;
  }else{
    return SizePhone(context).height/33;
  }
}

double? checkSizeFontInputText(BuildContext context){
  var screenSaverController = Get.put(ScreenSaverController());
  if(screenSaverController.title.value == "Tiếng Việt"){
    return null;
  }else if(screenSaverController.title.value == "日本"){
    return SizePhone(context).height/33;
  }else{
    return SizePhone(context).height/25;
  }
}

String checkLanguage(){
  var screenSaverController = Get.put(ScreenSaverController());
  return screenSaverController.title.value;
}

double checkSizeTextVerticalJP(BuildContext context){
  if(checkLanguage() == "Tiếng Việt"){
    return SizePhone(context).height/15;
  }else if(checkLanguage() == "日本"){
    return SizePhone(context).height/14;
  }else{
    return SizePhone(context).height/10;
  }
}

double checkSizeForgotPassJP(BuildContext context){
  if(checkLanguage() == "Tiếng Việt"){
    return SizePhone(context).height/40;
  }else if(checkLanguage() == "日本"){
    return SizePhone(context).height/40;
  }else{
    return SizePhone(context).height/35;
  }
}

double checkSizeTextSetting(BuildContext context){
  if(checkLanguage() == "Tiếng Việt"){
    return SizePhone(context).height/30;
  }else if(checkLanguage() == "日本"){
    return SizePhone(context).height/30;
  }else{
    return SizePhone(context).height/32;
  }
}




