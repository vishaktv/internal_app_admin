// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class CustomGlassmorphicContainer extends StatelessWidget {
  final double height;
  final double? width;
  final double? border;
  final double? borderRadius;
  final double blur;
  final LinearGradient? linearGradient;
  final LinearGradient? borderGradient;
  final Widget childWidget;
  final List<Color>? colors;
  const CustomGlassmorphicContainer({
    Key? key,
    required this.height,
    this.width,
    this.border,
    this.borderRadius,
    required this.blur,
    this.linearGradient,
    this.borderGradient,
    required this.childWidget,
    this.colors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      height: height,
      width: width ?? double.infinity,
      border: border ?? 0.3,
      borderRadius: borderRadius ?? 20,
      linearGradient: linearGradient ??
          LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: colors ??
                [
                  Color(0xFFffffff).withOpacity(0.2),
                  Color(0xFFFFFFFF).withOpacity(0.03),
                ],
            stops: [
              0.1,
              1,
            ],
          ),
      blur: blur,
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFffffff).withOpacity(0.5),
          Color((0xFFFFFFFF)).withOpacity(0.5),
        ],
      ),
      child: childWidget,
    );
  }
}
