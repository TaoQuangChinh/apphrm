import 'package:apphrm/app/components/elevation_button.dart';
import 'package:apphrm/app/components/colors.dart';
import 'package:apphrm/app/components/size_screen_phone.dart';
import 'package:apphrm/app/modules/login/component/input_text.dart';
import 'package:apphrm/app/modules/login/component/input_text_pass.dart';
import 'package:apphrm/app/modules/login/component/text_hearder.dart';
import 'package:apphrm/app/modules/login/component/vertical_text.dart';
import 'package:apphrm/app/modules/screen_saver/controllers/screen_saver_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController>{
  var controller = Get.put(LoginController());
  var screenSaverController = Get.put(ScreenSaverController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: SizePhone(context).height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: controller.signInGradients,
              ),
            ),
            child: ListView(
              children: [
                Form(
                  key: controller.loginFormKey,
                    child: Column(
                      children: [
                        SizedBox(height: SizePhone(context).height/44),
                        Center(
                          child: Icon(Icons.tag_faces_outlined, color: kColorWhite,size: SizePhone(context).height/20,),
                        ),
                        Row(
                          children: [
                            VerticalText("SIGN IN"),
                            TextHeader('Log in to experience the benefits of the app'),
                          ],
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: SizePhone(context).height/30, left: SizePhone(context).width/8, right: SizePhone(context).width/15),
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: controller.codeLoginController,
                                  style: TextStyle(
                                    color: kColorWhite,
                                    fontSize: SizePhone(context).height/28,
                                  ),
                                  textAlign: TextAlign.center,
                                  decoration: buildInputDecotation(context,'enter the staff code',Icon(Icons.account_circle_rounded,color: Colors.white70, size: SizePhone(context).width/13,)),
                                  onSaved: (value){
                                    controller.code = value!;
                                  },
                                  validator: (value){
                                    return controller.validatorCode(value!);
                                  },
                                ),
                                SizedBox(height: SizePhone(context).height/50),
                                //InputTextPass('enter password',controller.checkHidePass),
                                Obx(() => TextFormField(
                                  controller: controller.passLoginController,
                                  style: TextStyle(
                                      color: kColorWhite,
                                      fontSize: SizePhone(context).height/28
                                  ),
                                  textAlign: TextAlign.center,
                                  decoration: buildPassDecoration(context, 'enter password', controller.checkHidePass),
                                  obscureText: controller.checkHidePass.value,
                                  onSaved: (value){
                                    controller.pass = value!;
                                  },
                                  validator: (value){
                                    return controller.validatorPass(value!);
                                  },
                                ))
                              ],
                            )
                        ),
                        SizedBox(height: SizePhone(context).height/45),
                        GestureDetector(
                            onTap: (){},
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                    padding: EdgeInsets.only(right: SizePhone(context).width/10),
                                    child: Text("Forgot password ?",style: TextStyle(
                                        color: kColorWhite,
                                        fontSize: SizePhone(context).height/35,
                                        fontFamily: 'ZenKurenaido',
                                        fontWeight: FontWeight.w600
                                    ),
                                    )
                                )
                            )
                        ),
                        SizedBox(height: SizePhone(context).height/15),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                                padding: EdgeInsets.only(right: SizePhone(context).width/15),
                                child: ElevationButton(
                                    sizeWidth: SizePhone(context).width/3,
                                    title: "SIGN IN",
                                    onPress: (){
                                      controller.checkLogin();
                                    },
                                    checkVisibility: true,
                                    widgets: Icon(Icons.arrow_forward, color: kColorBlueLight,size: SizePhone(context).height/33),
                                    colors: kColorWhite,
                                    colors2: kColorBlueLight,)
                            )
                        ),
                       SizedBox(height: SizePhone(context).height/25),
                       Padding(
                           padding: EdgeInsets.only(left: SizePhone(context).width/15),
                           child: Row(
                             children: [
                               Icon(Icons.fingerprint,color: kColorWhite,size: SizePhone(context).height/25,),
                               Text("Log in with fingerprint",style: TextStyle(
                                   color: kColorWhite,
                                   fontFamily: 'ZenKurenaido',
                                   fontSize: SizePhone(context).height/35,
                                   fontWeight: FontWeight.w600
                               ),)
                             ],
                           )
                       )
                      ],
                    ))
              ],
            )
        )
      )
    );
  }
}
