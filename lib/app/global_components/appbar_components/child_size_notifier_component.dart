import 'package:flutter/material.dart';

class ChildSizeNotifierComponent extends StatelessWidget {
  final ValueNotifier<Size> notifier = ValueNotifier(const Size(0, 0));
  final Widget Function(BuildContext context, Size size, Widget? child) builder;
  final Widget child;

  ChildSizeNotifierComponent({
    Key? key,
    required this.builder,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        notifier.value = (context.findRenderObject() as RenderBox).size;
      },
    );
    return ValueListenableBuilder(
      valueListenable: notifier,
      builder: builder,
      child: child,
    );
  }
}
