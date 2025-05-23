import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomLine extends StatelessWidget {
  const CustomLine({super.key, this.width = 20, this.length = 15});
  final int width;
  final int length;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "assets/imgs/12.svg",
      width: 20,
      height: 15,
      colorFilter: ColorFilter.mode(Color(0xff555555), BlendMode.srcIn),
    );
  }
}
