import 'package:fashionista/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          text: text,
          size: 24,
          color: Colors.black,
          letterSpacing: 4,
          isUpper: true,
        ),
      ],
    );
  }
}
