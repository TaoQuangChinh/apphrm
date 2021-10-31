import 'package:apphrm/app/components/colors.dart';
import 'package:apphrm/app/components/size_screen_phone.dart';
import 'package:flutter/material.dart';

class TextHeader extends StatelessWidget {
  String title;

  TextHeader(this.title,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: SizePhone(context).height/25, left: SizePhone(context).width/35),
      child: Container(
        height: SizePhone(context).height/3,
        width: SizePhone(context).width/1.5,
        child: Column(
          children: [
            SizedBox(height: SizePhone(context).height/50),
            Center(
              child: Text(title,style: TextStyle(
                fontSize: (SizePhone(context).width/3)/4,
                color: kColorWhite,
                fontFamily: 'ZenKurenaido',
                fontWeight: FontWeight.w600
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
