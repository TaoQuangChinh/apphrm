import 'package:apphrm/app/components/colors.dart';
import 'package:apphrm/app/components/elevation_button.dart';
import 'package:apphrm/app/components/size_screen_phone.dart';
import 'package:apphrm/app/modules/login/component/input_text.dart';
import 'package:apphrm/app/modules/login/component/text_hearder.dart';
import 'package:apphrm/app/modules/login/component/vertical_text.dart';
import 'package:apphrm/app/modules/screen_saver/controllers/screen_saver_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  var screenSaverController = Get.put(ScreenSaverController());
  var controller = Get.put(SignupController());

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
              colors: controller.signUpGradients,
            ),
          ),
          child: ListView(
            children: [
              Form(
                  key: controller.formKeySignup,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          VerticalText('SIGN UP'),
                          TextHeader('Register to experience the benefits of the application'),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: SizePhone(context).height/17,
                            left: SizePhone(context).width/8,
                            right: SizePhone(context).width/15),
                        child: Column(
                          children: [
                            TextFormField(
                              style: TextStyle(
                                color: kColorWhite,
                                fontSize: SizePhone(context).height/28,
                              ),
                              textAlign: TextAlign.center,
                              controller: controller.hontenController,
                              decoration: buildInputDecotation(
                                  context,
                                  'enter the full name',
                                  Icon(Icons.account_circle_rounded,color: Colors.white70, size: SizePhone(context).width/13)),
                              onSaved: (value){
                                controller.name = value!;
                              },
                              validator: (value){
                                return controller.validatorName(value!);
                              },
                            ),
                            SizedBox(height: SizePhone(context).height/50),
                            TextFormField(
                              readOnly: true,
                              style: TextStyle(
                                color: kColorWhite,
                                fontSize: SizePhone(context).height/28,
                              ),
                              textAlign: TextAlign.center,
                              controller: controller.namSinhController,
                              decoration: buildInputDecotation(
                                  context,
                                  'dd/mm/yyyy',
                                  Icon(Icons.date_range,color: Colors.white70, size: SizePhone(context).width/13)),
                              onTap: (){
                                controller.selelectDate(context, controller.namSinhController);
                              },
                              onSaved: (value){
                                controller.date = value!;
                              },
                              validator: (value){
                                return controller.validatorDate(value!);
                              },
                            ),
                            SizedBox(height: SizePhone(context).height/50),
                            TextFormField(
                              style: TextStyle(
                                color: kColorWhite,
                                fontSize: SizePhone(context).height/28,
                              ),
                              textAlign: TextAlign.center,
                              controller: controller.soDienThoaiController,
                              decoration: buildInputDecotation(
                                  context,
                                  'enter phone number',
                                  Icon(Icons.smartphone,color: Colors.white70, size: SizePhone(context).width/13)),
                              onSaved: (value){
                                controller.phone = value!;
                              },
                              validator: (value){
                                return controller.validatorPhone(value!);
                              },
                              keyboardType: TextInputType.phone,
                            ),
                            SizedBox(height: SizePhone(context).height/50),
                            TextFormField(
                              style: TextStyle(
                                color: kColorWhite,
                                fontSize: SizePhone(context).height/28,
                              ),
                              textAlign: TextAlign.center,
                              controller: controller.emailController,
                              decoration: buildInputDecotation(
                                  context,
                                  'enter the email',
                                  Icon(Icons.email_outlined,color: Colors.white70, size: SizePhone(context).width/13)),
                              keyboardType: TextInputType.emailAddress,
                              onSaved: (value){
                                controller.email = value!;
                              },
                              validator: (value){
                                return controller.validatorEmail(value!);
                              },
                            ),
                            SizedBox(height: SizePhone(context).height/50),
                            Obx(() => Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: controller.validatorGender.value ? kColorWhite : Color(0xFFFFD50000), width: 1),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                child: Row(
                                  children: [
                                    radioButton(context, 0, controller.group, "Male"),
                                    radioButton(context, 1, controller.group, "Famale"),
                                    radioButton(context, 2, controller.group, "Is different"),
                                  ],
                                )
                            ),),
                            //Obx(() => !controller.validatorGender() ? Text("Please select Gender") : Text(""),)
                          ],
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(right: SizePhone(context).width/10, top: SizePhone(context).height/20),
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: ElevationButton(
                                  sizeWidth: SizePhone(context).width/3,
                                  title: "SIGN UP",
                                  onPress: (){
                                    controller.checkSignup();
                                    controller.textRadio.value == "" ? controller.validatorGender.value = false : controller.validatorGender.value = true;
                                  },
                                  checkVisibility: true,
                                  widgets: Icon(Icons.arrow_forward, color: kColorOrangeLight,size: SizePhone(context).height/33),
                                  colors: kColorWhite,
                                  colors2: kColorOrangeLight)
                          )
                      ),
                      SizedBox(height: SizePhone(context).height/30),
                    ],
                  )),
            ],
          ),
        ),
      )
    );
  }

  Color getColor(Set<MaterialState> states) {
    return Colors.white70;
  }

  Widget radioButton(BuildContext context, int index, RxInt group, String title){
    return Row(
      children: [
        Obx(()=> Radio(
            fillColor: MaterialStateProperty.resolveWith(getColor),
            activeColor: kColorWhite,
            value: index,
            groupValue: group.value,
            onChanged: (value){
              group.value = int.parse(value.toString());
              controller.textRadio.value = value.toString();
            })),
        Text(title, style: TextStyle(
          color: kColorWhite,
          fontFamily: 'ZenKurenaido',
          fontWeight: FontWeight.w600,
          fontSize: SizePhone(context).width/23
        ),)
      ],
    );
  }
}
