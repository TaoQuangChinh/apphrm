import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SignupController extends GetxController {
  GlobalKey<FormState> formKeySignup = GlobalKey<FormState>();
  late TextEditingController hontenController;
  late TextEditingController namSinhController;
  late TextEditingController soDienThoaiController;
  late TextEditingController emailController;
  RxInt group = 0.obs;
  RxBool validatorGender = true.obs;
  DateTime selcted = DateTime.now();
  static var format = DateFormat("dd/MM/yyyy");
  RxString textRadio = "".obs;
  final emailValid = RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  final regexPhone =RegExp(r"^0\\d{9}$");

  var name = "";
  var date = "";
  var phone = "";
  var email = "";

  List<Color> signUpGradients = [
    Color(0xFFFF9945),
    Color(0xFFFFFFC107),
  ];

  @override
  void onInit() {
    super.onInit();
    hontenController = TextEditingController();
    namSinhController = TextEditingController();
    soDienThoaiController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    hontenController.dispose();
    namSinhController.dispose();
    soDienThoaiController.dispose();
    emailController.dispose();
  }

  String? validatorName(String value){
    if(value.isEmpty){
      return "please_enter_full_name".tr;
    }else{
      return null;
    }
  }

  String? validatorDate(String value){
    if(value.isEmpty){
      return "please_enter_choose_date".tr;
    }else{
      return null;
    }
  }

  String? validatorPhone(String value){
    if(value.isEmpty){
      return "please_enter_phone".tr;
    }else if(value.length < 10 || value.length > 10){
      return "phone_number_incorrect".tr;
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

  void checkSignup(){
    final valida = formKeySignup.currentState!.validate();
    if(!valida){
      return;
    }else{
      formKeySignup.currentState!.save();
    }
  }

  void selelectDate(BuildContext context, TextEditingController ctrl) async {
    final DateTime? picker = await showDatePicker(
        context: context,
        initialDate: selcted,
        firstDate: DateTime(2000),
        lastDate: DateTime(2030),
        cancelText: 'cancle'.tr,
        confirmText: 'confirm'.tr,
        helpText:'select_date'.tr,
        locale: changeDate(),
    );
    if(picker != null && picker != selcted){
      selcted = picker;
      ctrl.text = format.format(selcted);
    }
  }

  changeDate(){
    update();
  }
}
