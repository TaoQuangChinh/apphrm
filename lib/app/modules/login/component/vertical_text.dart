import 'package:apphrm/app/components/colors.dart';
import 'package:apphrm/app/components/size_screen_phone.dart';
import 'package:flutter/material.dart';

class VerticalText extends StatelessWidget {
  String title1;

  VerticalText(this.title1,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: SizePhone(context).height/300, left: SizePhone(context).width/50),
        child: RotatedBox(
          quarterTurns: -1,
          child: Text(title1,
            style: TextStyle(
              color: kColorWhite,
              fontSize: SizePhone(context).height/10,
              fontWeight: FontWeight.w900,
              fontFamily: 'ZenKurenaido'
            ),
          ),
        )
    );
  }
}
