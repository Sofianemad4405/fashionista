import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Poster extends StatelessWidget {
  const Poster({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 160),
          child: Image.asset("assets/imgs/image 20.png"),
        ),
        Positioned(
          top: 450,
          left: 160,
          child: SvgPicture.asset(
            "assets/imgs/10.svg",
            colorFilter: ColorFilter.mode(
              Color.fromARGB(255, 16, 16, 16),
              BlendMode.srcIn,
            ),
            height: 200,
            width: 200,
          ),
        ),
      ],
    );
  }
}
