import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Future Function() onPressed;
  final Color color;
  final double elevation;
  final double width;
  final double height;
  final EdgeInsetsGeometry padding;
  final BorderRadiusGeometry borderRadius;
  final TextStyle textStyle;
  final double textSize;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = const Color(0xFF8C1D18),
    this.elevation = 8.0,
    this.width = 200.0,
    this.height = 50.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 68, vertical: 12),
    this.borderRadius = const BorderRadius.all(Radius.circular(15)),
    required this.textStyle,
    this.textSize = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        elevation: elevation,
        fixedSize: Size(width, height),
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
      ),
      child: Text(
        text,
        style: textStyle.copyWith(fontSize: textSize),
      ),
    );
  }
}
