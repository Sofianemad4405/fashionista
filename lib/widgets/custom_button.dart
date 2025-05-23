import 'package:fashionista/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.image, required this.text, this.onTap});
  final String? image;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 66,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.black),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image != null
                ? SvgPicture.asset(
                  image!,
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                )
                : SizedBox.shrink(),
            Gap(20),
            CustomText(
              text: text,
              size: 20,
              color: Colors.white,
              letterSpacing: 3,
            ),
          ],
        ),
      ),
    );
  }
}
