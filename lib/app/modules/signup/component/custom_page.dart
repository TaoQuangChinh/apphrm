import 'package:flutter/material.dart';

class CustomPage extends PageRouteBuilder{
  final Widget child;
  final AxisDirection direction;

  CustomPage({required this.child, this.direction = AxisDirection.right}) : super(
      transitionDuration: Duration(milliseconds: 600),
      reverseTransitionDuration: Duration(milliseconds: 600),
      pageBuilder: (context, animator, secondaryAnimator) => child,
  );
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) =>
    SlideTransition(
      position: Tween<Offset>(
        begin: Offset(-1,0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );

}