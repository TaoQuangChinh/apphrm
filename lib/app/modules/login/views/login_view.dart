import 'package:apphrm/app/components/check_size.dart';
import 'package:apphrm/app/components/elevation_button.dart';
import 'package:apphrm/app/components/colors.dart';
import 'package:apphrm/app/components/size_screen_phone.dart';
import 'package:apphrm/app/modules/fingerprint/views/fingerprint_view.dart';
import 'package:apphrm/app/modules/login/component/change_to_language/text_header_vn.dart';
import 'package:apphrm/app/modules/login/component/change_to_language/vertical_text_vn.dart';
import 'package:apphrm/app/modules/login/component/input_text.dart';
import 'package:apphrm/app/modules/login/component/input_text_pass.dart';
import 'package:apphrm/app/modules/login/component/text_hearder.dart';
import 'package:apphrm/app/modules/login/component/vertical_text.dart';
import 'package:apphrm/app/modules/screen_saver/controllers/screen_saver_controller.dart';
import 'package:apphrm/app/modules/signup/component/custom_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
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
                        screenSaverController.title.value == "Tiếng Việt" ?
                          Row(
                            children: [
                            VerticalTextLoginVN("sign_in".tr),
                            TextHeaderLoginVN('log_in_to'.tr),
                          ],
                        )
                        :
                        Row(
                          children: [
                            VerticalText("sign_in".tr),
                            TextHeader('log_in_to'.tr),
                          ],
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                top: checkSize() ? SizePhone(context).height/20 : SizePhone(context).height/30,
                                left: SizePhone(context).width/8, right: SizePhone(context).width/15),
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: controller.codeLoginController,
                                  style: TextStyle(
                                    color: kColorWhite,
                                    fontSize: SizePhone(context).height/28,
                                  ),
                                  textAlign: TextAlign.center,
                                  decoration: buildInputDecotation(
                                      context,
                                      'enter_the_staff'.tr,
                                      Icon(Icons.account_circle_rounded,color: Colors.white70,
                                        size: SizePhone(context).width/13,),
                                      kColorWhite70,
                                      kColorWhite70
                                  ),
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
                                  decoration: buildPassDecoration(
                                      context,
                                      'enter_pass'.tr,
                                      controller.checkHidePass),
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
                                onTap: (){
                                  Get.defaultDialog(
                                    titleStyle: TextStyle(
                                        fontSize: 0,
                                    ),
                                    content: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: SizePhone(context).width/30),
                                        child: SizedBox(
                                            width: SizePhone(context).width/1.5,
                                            child: Form(
                                              key: controller.confirmFormKey,
                                              child: TextFormField(
                                                style: TextStyle(
                                                  color: kColorBlueLight,
                                                  fontSize: SizePhone(context).height/28,
                                                ),
                                                textAlign: TextAlign.center,
                                                controller: controller.textDialogLoginController,
                                                decoration: buildInputDecotation(
                                                    context,
                                                    'enter_email'.tr,
                                                    Icon(Icons.email,color: Colors.blue, size: SizePhone(context).width/13),
                                                    Colors.blue,
                                                    Color(0xFFFF9E9E9E).withOpacity(0.5)
                                                ),
                                                validator: (value){
                                                  return controller.validatorEmail(value!);
                                                },
                                              ),
                                            )
                                        )
                                    ),
                                    cancel: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: SizePhone(context).width/20),
                                        child: Ink(
                                            child: TextButton(
                                              onPressed: (){
                                                Get.back();
                                              },
                                              child: Text("cancle".tr,style: TextStyle(
                                                  fontFamily: checkFont(),
                                                  fontWeight: FontWeight.w900,
                                                  color: Color(0xFFFF9E9E9E),
                                                  fontSize: SizePhone(context).height/30
                                              ),),
                                            )
                                        )
                                    ),
                                    confirm: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: SizePhone(context).width/20),
                                        child: Ink(
                                            child: TextButton(
                                              onPressed: (){
                                                final valida = controller.confirmFormKey.currentState!.validate();
                                                if(!valida){
                                                  return;
                                                }else{
                                                  controller.confirmFormKey.currentState!.save();
                                                }
                                              },
                                              child: Text("confirm".tr,style: TextStyle(
                                                  fontFamily: checkFont(),
                                                  fontWeight: FontWeight.w900,
                                                  color: kColorBlueLight,
                                                  fontSize: SizePhone(context).height/30
                                              ),),)
                                        )
                                    ),
                                    radius: 30,
                                  );
                                },
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                      padding: EdgeInsets.only(right: SizePhone(context).width/10),
                                      child: Text("forgot_pass2".tr,style: TextStyle(
                                          color: kColorWhite,
                                          fontSize: checkSizeForgotPassJP(context),
                                          fontFamily: checkFont(),
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
                                    title: "sign_in".tr,
                                    onPress: (){
                                      controller.checkLogin(context);
                                    },
                                    checkVisibility: checkLanguage() == "日本" ? false : true,
                                    widgets: Icon(Icons.arrow_forward, color: kColorBlueLight,size: SizePhone(context).height/33),
                                    colors: kColorWhite,
                                    colors2: kColorBlueLight,)
                              ),
                            ),
                       SizedBox(height: checkSize() ? SizePhone(context).height/15 : SizePhone(context).height/7.5),
                       Row(
                         children: [
                           Padding(
                               padding: EdgeInsets.only(left: SizePhone(context).width/15),
                               child:Align(
                                   alignment: Alignment.centerLeft,
                                   child: GestureDetector(
                                       onTap: (){
                                         Navigator.of(context).push(PageTransition(type: PageTransitionType.fade, child: FingerprintView()));
                                       },
                                       child: FittedBox(
                                           child:  Row(
                                             children: [
                                               Icon(Icons.fingerprint,color: kColorWhite,size: SizePhone(context).height/35,),
                                               Text("log_in_with".tr,style: TextStyle(
                                                   color: kColorWhite,
                                                   fontFamily: checkFont(),
                                                   fontSize: checkLanguage() == "Tiếng Việt" ? SizePhone(context).height/40 : SizePhone(context).height/35,
                                                   fontWeight: FontWeight.w600
                                               ),)
                                             ],
                                           )
                                       )
                                   )
                               )
                           ),
                           Padding(
                               padding: EdgeInsets.symmetric(horizontal: SizePhone(context).width/60),
                               child: Text("||", style: TextStyle(
                               color: kColorWhite,
                               fontSize: checkLanguage() == "Tiếng Việt" ? SizePhone(context).height/40 : SizePhone(context).height/35
                           ),),
                           ),
                           Align(
                             alignment: Alignment.centerRight,
                             child: GestureDetector(
                               onTap: (){
                                 Get.defaultDialog(
                                   title: "face_id".tr,
                                   titleStyle: TextStyle(
                                       fontFamily: checkFont(),
                                       fontWeight: FontWeight.w900,
                                       fontSize: SizePhone(context).height/25
                                   ),
                                   content: Center(
                                     child: Icon(Icons.face_retouching_natural, color: kColorBlueLight, size: SizePhone(context).height/8,),
                                   ),
                                   cancel: Padding(
                                       padding: EdgeInsets.symmetric(horizontal: SizePhone(context).width/20),
                                       child: Ink(
                                           child: TextButton(
                                             onPressed: (){
                                               Get.back();
                                             },
                                             child: Text("cancle".tr,style: TextStyle(
                                                 fontFamily: checkFont(),
                                                 fontWeight: FontWeight.w900,
                                                 color: Color(0xFFFF9E9E9E),
                                                 fontSize: SizePhone(context).height/30
                                             ),),
                                           )
                                       )
                                   ),
                                 );
                               },
                               child: Padding(
                                   padding: EdgeInsets.only(right: SizePhone(context).width/10),
                                   child: Text("face_recognition".tr,style: TextStyle(
                                       color: kColorWhite,
                                       fontSize: checkLanguage() == "Tiếng Việt" ? SizePhone(context).height/40 : SizePhone(context).height/35,
                                       fontFamily: checkFont(),
                                       fontWeight: FontWeight.w600
                                   ),
                                   )
                               ),
                             ),
                           ),
                         ],
                       ),
                        SizedBox(height: SizePhone(context).height/30),
                      ],
                    ))
              ],
            )
        )
      )
    );
  }
}
