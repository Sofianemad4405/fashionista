import 'package:flutter/material.dart';

class Collection extends StatelessWidget {
  const Collection({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 120,
      left: 80,
      child: Text(
        "Collection".toUpperCase(),
        style: TextStyle(
          color: Color(0xffFCFCFC),
          fontSize: 22,
          fontWeight: FontWeight.normal,
          fontFamily: "Tenor Sans",
          letterSpacing: 6.06,
        ),
      ),
    );
  }
}
