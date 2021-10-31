import 'package:apphrm/app/components/size_screen_phone.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class ElevationButton extends StatelessWidget {
  double sizeWidth;
  String title;
  VoidCallback onPress;
  bool checkVisibility;
  Widget widgets;
  Color colors, colors2;

  ElevationButton({
    required this.sizeWidth,
    required this.title,
    required this.onPress,
    required this.checkVisibility,
    required this.widgets,
    required this.colors,
    required this.colors2,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
        child: SizedBox(
          width: sizeWidth,
          child: MaterialButton(
              elevation: 10,
              shape:  RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              padding: EdgeInsets.all(15),
              color: colors,
              onPressed: onPress,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title, style: TextStyle(
                      color: colors2,
                      fontSize: SizePhone(context).height/33,
                      fontFamily: 'ZenKurenaido',
                      fontWeight: FontWeight.w900
                  ),),
                  Visibility(
                    visible: checkVisibility,
                    child: widgets
                  )
                ],
              )
          ),
        )
    );
  }
}
