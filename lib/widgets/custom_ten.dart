import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTen extends StatelessWidget {
  const CustomTen({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30,
      left: 60,
      child: SvgPicture.asset(
        "assets/imgs/10.svg",
        colorFilter: ColorFilter.mode(Color(0xff343434), BlendMode.srcIn),
        height: 150,
        width: 200,
      ),
    );
  }
}
