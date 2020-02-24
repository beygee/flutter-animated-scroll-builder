import 'package:flutter/material.dart';
import 'dart:math' as math;

typedef AnimatedScrollBuilderFunction = Widget Function(
    BuildContext context, double tween);

class AnimatedScrollBuilder extends StatelessWidget {
  final ScrollController controller;
  final AnimatedScrollBuilderFunction builder;
  final double maxScrollExtent;

  AnimatedScrollBuilder({
    @required this.controller,
    @required this.builder,
    this.maxScrollExtent,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, widget) {
        if (!controller.hasClients) return builder(context, 0);

        double maxExtent =
            maxScrollExtent ?? controller.position.maxScrollExtent;

        double scrollTween = (maxExtent - controller.offset) / maxExtent;

        return builder(context, _truncate(scrollTween, 0, 1));
      },
    );
  }

  double _truncate(double value, double min, double max) {
    return math.min(math.max(0, value), 1);
  }
}
