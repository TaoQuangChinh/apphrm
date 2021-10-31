import 'package:apphrm/app/components/colors.dart';
import 'package:apphrm/app/components/size_screen_phone.dart';
import 'package:apphrm/app/modules/screen_saver/controllers/screen_saver_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kColorWhite,
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                  top: SizePhone(context).height/9,
                  left: SizePhone(context).width/4,
                  child: Image.asset("assets/images/logo.png",height: (SizePhone(context).height/2.5)/1.4,),
              ),
              WavyHeader(),
            ],
          ),
          SizedBox(height: SizePhone(context).height/50,),
          Text("Human Resource Management",style: TextStyle(
            fontSize: SizePhone(context).height/25,
            fontFamily: 'ZenKurenaido',
            fontWeight: FontWeight.w900
          ),),
          Expanded(child: Container()),
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              WavyFooter(),
              CirclePink(),
              CircleYellow(),
            ],
          )
        ],
      ),
    );
  }
}

class WavyHeader extends GetView<ScreenSaverController> {
  const WavyHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TopWaveClipper(),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: controller.orangeGradients,
            begin: Alignment.topLeft,
            end: Alignment.center,
          )
        ),
        height:SizePhone(context).height / 2.5,
      ),
    );
  }
}

class WavyFooter extends GetView<ScreenSaverController> {
  const WavyFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: FooterWaveClipper(),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: controller.aquaGradients,
              begin: Alignment.center,
              end: Alignment.bottomRight,
            )
        ),
        height:SizePhone(context).height / 3,
      ),
    );
  }
}

class CirclePink extends StatelessWidget {
  const CirclePink({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
        offset: Offset(-70.0, 90.0),
        child: Material(
          color: kColorPink,
          child: Padding(padding: EdgeInsets.all(120),),
          shape: CircleBorder(side: BorderSide(color: kColorWhite, width: 15.0)),
      ),
    );
  }
}

class CircleYellow extends StatelessWidget {
  const CircleYellow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
        offset: Offset(0.0, 210.0),
        child: Material(
          color: kColorYellow,
          child: Padding(padding: EdgeInsets.all(140),),
          shape: CircleBorder(side: BorderSide(color: kColorWhite,width: 15.0)),
        ),
    );
  }
}



class TopWaveClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
    var path = Path();
    path.lineTo(0.0, size.height);
    var firstControllerPoint = new Offset(size.width/7, size.height - 30);
    var firstEndPoint = new Offset(size.width/6, size.height/1.5);
    path.quadraticBezierTo(firstControllerPoint.dx, firstControllerPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width/5, size.height/4);
    var secondEndPoint = Offset(size.width/1.5, size.height/5);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

    var thirControlPoint = Offset(size.width -(size.width/9), size.height/6);
    var thirEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(thirControlPoint.dx, thirControlPoint.dy, thirEndPoint.dx, thirEndPoint.dy);

    path.lineTo(size.width, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class FooterWaveClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path  = Path();
    path.moveTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(0.0, size.height - 60);
    var secondControlPoint = Offset(size.width -(size.width/6), size.height);
    var secondEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

