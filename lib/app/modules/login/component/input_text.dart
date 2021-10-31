import 'package:apphrm/app/components/size_screen_phone.dart';
import 'package:flutter/material.dart';

InputDecoration buildInputDecotation(BuildContext context,String title, Widget widgets){
  return InputDecoration(
      isDense: true,
      contentPadding: EdgeInsets.all(13),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white ,width: 1),
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white ,width: 1),
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      hintText: title,
      hintStyle: TextStyle(
          color: Colors.white70,
          fontFamily: 'ZenKurenaido',
          fontWeight: FontWeight.w600,
          fontSize: SizePhone(context).height/25,
          height: 0
      ),
      prefixIcon: widgets,
      prefixText: "|",
      errorStyle: TextStyle(
          fontFamily: 'ZenKurenaido',
          fontWeight: FontWeight.w600,
          fontSize: SizePhone(context).height/45,
          height: 1
      ),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFFFD50000) ,width: 1),
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFFFD50000) ,width: 1),
          borderRadius: BorderRadius.all(Radius.circular(20))
      )
  );
}
