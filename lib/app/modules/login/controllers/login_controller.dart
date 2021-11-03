import 'package:apphrm/app/modules/fingerprint/views/fingerprint_view.dart';
import 'package:apphrm/app/modules/login/component/input_text_pass.dart';
import 'package:apphrm/app/modules/setting/views/setting_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

class LoginController extends GetxController {
  RxBool checkHidePass = true.obs;
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> confirmFormKey = GlobalKey<FormState>();
  late TextEditingController passLoginController;
  late TextEditingController codeLoginController;
  late TextEditingController textDialogLoginController;
  var code ='';
  var pass = '';
  final word = RegExp(r'^[a-zA-Z]+$');
  final wordAndNum = RegExp(r'^[a-zA-Z0-9]+$');


  List<Color> signInGradients = [
    Color(0xFF03A0FE),
    Color(0xFF0EDED2),
  ];

  @override
  void onInit() {
    super.onInit();
    passLoginController = TextEditingController();
    codeLoginController = TextEditingController();
    textDialogLoginController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    passLoginController.dispose();
    codeLoginController.dispose();
    textDialogLoginController.dispose();
  }

  String? validatorCode(String value){
    if(value.isEmpty){
      return "please_enter_the".tr;
    }else{
      return null;
    }
  }

  String? validatorPass(String value){
    if(value.isEmpty){
      return "please_enter_pass".tr;
    }else if(value.length < 8){
      return "please_enter_pass_minimum".tr;
    }else if(value.isNum || word.hasMatch(value) || !wordAndNum.hasMatch(value)){
      return "please_enter_pass_include".tr;
    }else{
      return null;
    }
  }

  String? validatorEmail(String value){
    if(value.isEmpty){
      return "please_enter_email".tr;
    }else if(!value.isEmail){
      return "please_email_correct".tr;
    }else{
      return null;
    }
  }

  void checkLogin(BuildContext context){
    final valida = loginFormKey.currentState!.validate();
    if(!valida){
      return;
    }else{
      loginFormKey.currentState!.save();
      Navigator.of(context).push(PageTransition(type: PageTransitionType.rightToLeft, child: SettingView()));
    }
  }
}
