
import 'package:flutter/material.dart';

class AnimatedAppBar extends StatelessWidget {
  AnimationController colorAnimationController;
  Animation colorTween, homeTween, workOutTween, iconTween, drawerTween;
  Function onPressed;

  AnimatedAppBar({
    @required this.colorAnimationController,
    @required this.onPressed,
    @required this.colorTween,
    @required this.homeTween,
    @required this.iconTween,
    @required this.drawerTween,
    @required this.workOutTween,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: AnimatedBuilder(
        animation: colorAnimationController,
        builder: (context, child) => AppBar(
          backgroundColor: colorTween.value,
          elevation: 0,
          titleSpacing: 0.0,
          title: Row(
            children: <Widget>[
              Text(
                "Trainings  ",
                style: TextStyle(
                    color: homeTween.value,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    letterSpacing: 1),
              ),

            ],
          ),
          actions: <Widget>[
            Icon(
              Icons.menu,
              color: iconTween.value,
            ),

          ],
        ),
      ),
    );

  }
}
