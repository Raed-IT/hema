import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';

class AnimationSliverList extends StatelessWidget {
  late int length;
  late  Widget Function(BuildContext, int, Animation<double>)  builder;

  AnimationSliverList(
      {Key? key, required this.length, required this.builder})
      : super(key: key);
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return LiveSliverList(
      visibleFraction: 0.2,
      showItemInterval:
      const Duration(milliseconds: 100),
      showItemDuration:
      const Duration(milliseconds: 150),
      delay: const Duration(milliseconds: 0),
      controller: _scrollController,
      itemCount
          : length,
      itemBuilder:builder  ,
    );
  }
}
