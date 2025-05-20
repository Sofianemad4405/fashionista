import 'package:flutter/material.dart';

class October extends StatelessWidget {
  const October({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 60,
      left: 85,
      child: Text(
        "October",
        style: TextStyle(
          color: Color(0xffFCFCFC),
          fontSize: 50,
          fontWeight: FontWeight.w700,
          fontFamily: "BodoniModa",
        ),
      ),
    );
  }
}
