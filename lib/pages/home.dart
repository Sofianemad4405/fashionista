import 'package:fashionista/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: CustomAppBar(isHome: true),
      body: Stack(
        children: [
          Positioned(
            top: 30,
            left: 100,
            child: SvgPicture.asset(
              "assets/imgs/10.svg",
              colorFilter: ColorFilter.mode(Color(0xff343434), BlendMode.srcIn),
              height: 125.2817153930664,
              width: 173.6627960205078,
            ),
          ),
          Positioned(
            top: 30,
            left: 100,
            child: Text(
              "October",
              style: TextStyle(
                color: Color(0xffFCFCFC),
                fontSize: 41.86,
                fontWeight: FontWeight.w700,
                fontFamily: "BodoniModa",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
