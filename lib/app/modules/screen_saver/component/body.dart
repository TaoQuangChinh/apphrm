import 'package:apphrm/app/components/rounded_rec_button.dart';
import 'package:apphrm/app/components/size_screen_phone.dart';
import 'package:apphrm/app/modules/screen_saver/controllers/screen_saver_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodySaver extends StatelessWidget {
  PageController controllerPage;

  var screenSaverController = Get.put(ScreenSaverController());

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
                    "sign_in".tr,
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
                    "sign_up".tr,
                    controller.signUpGradients,
                    30,
                        (){
                      controllerPage.animateToPage(
                          2,
                          duration: Duration(milliseconds: 800),
                          curve: Curves.bounceOut);
                    }
                ),
                SizedBox(height: SizePhone(context).height/10),
                PopupMenuButton(
                  onSelected: (value){
                    screenSaverController.title.value = value.toString();
                    if(value.toString() == "Tiếng Việt"){
                      var locale = Locale('vi','VN');
                      Get.updateLocale(locale);
                    }else if(value.toString() == "English"){
                      var locale = Locale('en','US');
                      Get.updateLocale(locale);
                    }else if(value.toString() == "日本"){
                      var locale = Locale('ja','JP');
                      Get.updateLocale(locale);
                    }
                  },
                  itemBuilder: (BuildContext context) =>[
                    PopupMenuItem(
                        value: "Tiếng Việt",
                        child: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Text("🇻🇳",style: TextStyle(
                                  fontSize: SizePhone(context).height/30
                                ),)
                            ),
                            Text("Tiếng Việt")
                          ],
                        )),
                    PopupMenuItem(
                        value: "English",
                        child: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Text("🇺🇸",style: TextStyle(
                                    fontSize: SizePhone(context).height/30
                                ))
                            ),
                            Text("English")
                          ],
                        )),
                    PopupMenuItem(
                        value: "日本",
                        child: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Text("🇯🇵",style: TextStyle(
                                    fontSize: SizePhone(context).height/30
                                ))
                            ),
                            Text("日本")
                          ],
                        )),
                  ],
                  child: Obx(() => widgets(context)),
                ),
              ],
            ),
          );
        });
  }
  Widget widgets(BuildContext context){
    if(screenSaverController.title.value == "Tiếng Việt"){
      return Row(
        children: [
          Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text("🇻🇳",style: TextStyle(
                  fontSize: SizePhone(context).height/30
              ))
          ),
          Text("Tiếng Việt",style: TextStyle(
              fontSize: SizePhone(context).height/40
          ))
        ],
      );
    }else if(screenSaverController.title.value == "English"){
      return Row(
        children: [
          Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text("🇺🇸",style: TextStyle(
                  fontSize: SizePhone(context).height/30
              ))
          ),
          Text("English")
        ],
      );
    }else{
      return  Row(
        children: [
          Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text("🇯🇵",style: TextStyle(
                  fontSize: SizePhone(context).height/30
              ))
          ),
          Text("日本")
        ],
      );
    }
  }
}
