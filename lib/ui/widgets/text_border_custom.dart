import 'package:flutter/material.dart';

class TextBorderCustom extends StatelessWidget {
  final String text;
  final double? fontSize;
  const TextBorderCustom({
    required this.text,
    this.fontSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: fontSize ?? 18,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 3.0
              ..color = Colors.black,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: fontSize ?? 18,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
