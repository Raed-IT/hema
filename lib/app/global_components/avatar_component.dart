import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvatarComponent extends StatelessWidget {
  // this Widget perform draw padding around insides widget
  late Widget widget;
  double? radius;
  Color? bgColor;
  AvatarComponent({Key? key, required this.widget, this.radius, this.bgColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: bgColor ?? Colors.white,
      radius: radius ?? 55.sp,
      child: widget,
    );
  }
}
