import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    this.isUpper = true,
    required this.text,
    required this.size,
    required this.color,
    required this.letterSpacing,
    this.wordSpacing = 0,
    this.weight = FontWeight.w400,
    this.maxlines = 1,
  });
  final bool isUpper;
  final String text;
  final double size;
  final double letterSpacing;
  final double wordSpacing;
  final FontWeight? weight;
  final Color color;
  final int? maxlines;

  @override
  Widget build(BuildContext context) {
    return Text(
      isUpper ? text.toUpperCase() : text,
      style: TextStyle(
        letterSpacing: letterSpacing,
        fontSize: size,
        fontWeight: weight,
        fontFamily: "Tenor Sans",
        color: color,
        wordSpacing: wordSpacing,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: maxlines,
    );
  }
}
