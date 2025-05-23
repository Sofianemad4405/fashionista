import 'package:fashionista/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.text, this.size = 24});
  final String text;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          text: text,
          size: size ?? 24,
          color: Colors.black,
          letterSpacing: 4,
          isUpper: true,
        ),
      ],
    );
  }
}
