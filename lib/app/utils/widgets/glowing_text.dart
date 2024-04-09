import 'package:flutter/material.dart';

class GlowingText extends StatelessWidget {
  final List<Shadow> shadows;
  final String text;
  final double fontsize;

  const GlowingText({
    super.key,
    required this.shadows,
    required this.text,
    required this.fontsize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: fontsize,
        shadows: shadows,
      ),
    );
  }
}
