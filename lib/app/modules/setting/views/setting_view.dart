import 'package:apphrm/app/components/check_size.dart';
import 'package:apphrm/app/components/colors.dart';
import 'package:apphrm/app/components/size_screen_phone.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  var controller = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios_sharp,color: kColorVioletLight,)),
        title: Text("setting".tr),
        titleTextStyle: TextStyle(
          color:kColorVioletLight,
          fontFamily: checkFont(),
          fontWeight: FontWeight.w900,
          fontSize: SizePhone(context).height/30,
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFFAFAFA),
        elevation: 0,
      ),
      body: Column(
        children: [
          Obx(() => SwitchListTile(
            title: Text("Vân tay"),
              value: controller.checkVanTay.value,
              onChanged: (value){
                controller.checkVanTay.value = value;
              }),),
          items(
              context,
              Icon(Icons.announcement_outlined,color: kColorVioletLight, size: SizePhone(context).width/15,),
              Icon(Icons.arrow_forward,color: kColorVioletLight,size: SizePhone(context).width/15,),
              "introduce".tr),
          items(
              context,
              Icon(Icons.account_box_outlined,color: kColorVioletLight, size: SizePhone(context).width/15,),
              Icon(Icons.arrow_forward,color: kColorVioletLight,size: SizePhone(context).width/15,),
              "profile".tr),
          items(
              context,
              Icon(Icons.vpn_key_outlined,color: kColorVioletLight, size: SizePhone(context).width/15,),
              Icon(Icons.arrow_forward,color: kColorVioletLight,size: SizePhone(context).width/15,),
              "change_pass".tr),
          items(
              context,
              Icon(Icons.smartphone,color: kColorVioletLight, size: SizePhone(context).width/15,),
              Icon(Icons.arrow_forward,color: kColorVioletLight,size: SizePhone(context).width/15,),
              "otp".tr),
        ],
      )
    );
  }

  Widget items(BuildContext context, Widget widgetIconLeft, Widget widgetIconRight, String title){
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
          width: SizePhone(context).width/1.1,
          child: Card(
              color: kColorVioleWhite,
              elevation: 8,
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide.none
              ),
              child: InkWell(
                  onTap: (){

                  },
                  child: ListTile(
                    leading: widgetIconLeft,
                    title: Text(title,style: TextStyle(
                        color: kColorVioletLight,
                        fontFamily: checkFont(),
                        fontWeight: FontWeight.w700,
                        fontSize: checkSizeTextSetting(context)
                    ),),
                    trailing: widgetIconRight,
                  )
              )
          )
      )
    );
  }
}
