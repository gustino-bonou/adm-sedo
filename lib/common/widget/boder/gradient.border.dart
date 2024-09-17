import 'package:adms/common/widget/boder/pain.dart';
import 'package:flutter/material.dart';


class GradientBorderContainer extends StatelessWidget {
  final Widget child;
  final double borderWidth;
  final Gradient gradient;

  const GradientBorderContainer({super.key,
    required this.child,
    required this.borderWidth,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: GradientBorderPainter(borderWidth: borderWidth, gradient: gradient),
      child: child,
    );
  }
}
