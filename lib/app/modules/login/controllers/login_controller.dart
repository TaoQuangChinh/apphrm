import 'package:apphrm/app/modules/login/component/input_text_pass.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool checkHidePass = true.obs;
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController passLoginController;
  late TextEditingController codeLoginController;
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
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    passLoginController.dispose();
    codeLoginController.dispose();
  }

  String? validatorCode(String value){
    if(value.isEmpty){
      return "Please enter the staff code*";
    }else{
      return null;
    }
  }

  String? validatorPass(String value){
    if(value.isEmpty){
      return "Please enter a password*";
    }else if(value.length < 8){
      return "Minimum password 8 characters*";
    }else if(value.isNum || word.hasMatch(value) || !wordAndNum.hasMatch(value)){
      return "Passwords include letters and numbers";
    }else{
      return null;
    }
  }

  void checkLogin(){
    final valida = loginFormKey.currentState!.validate();
    if(!valida){
      return;
    }else{
      loginFormKey.currentState!.save();
    }
  }
}
