import 'package:flutter/material.dart';

class AnimationWidgets {
  static Widget simpleAnimation({required Widget widget, int duration = 1000}) {
    return TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 1),
        duration: Duration(milliseconds: duration),
        builder: (BuildContext context, double animation, Widget? child) {
          return Opacity(
            opacity: animation,
            child: Transform.scale(
              scale: animation,
              child: child,
            ),
          );
        },
        child: widget);
  }
}
