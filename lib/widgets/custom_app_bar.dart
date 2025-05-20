import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.isHome});
  final bool isHome;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppBar(
        backgroundColor: isHome ? Color.fromARGB(255, 0, 0, 0) : Colors.white,
        elevation: 0,
        leading:
            isHome
                ? SvgPicture.asset(
                  'assets/imgs/Menu.svg',
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                )
                : SvgPicture.asset(
                  'assets/imgs/Menu.svg',
                  colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
                ),
        centerTitle: true,
        title: Image.asset(
          "assets/imgs/Logo.png",
          color: isHome ? Colors.white : Colors.black,
        ),
        actions: [
          SvgPicture.asset(
            "assets/imgs/Search.svg",
            colorFilter: ColorFilter.mode(
              isHome ? Colors.white : Colors.black,
              BlendMode.srcIn,
            ),
          ),
          Gap(30),
          SvgPicture.asset(
            "assets/imgs/shopping bag.svg",
            colorFilter: ColorFilter.mode(
              isHome ? Colors.white : Colors.black,
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
    );
  }
}
