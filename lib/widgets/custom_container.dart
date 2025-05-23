import 'package:fashionista/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.text,
    required this.icon,
    this.free = false,
  });
  final String text;
  final IconData icon;
  final bool? free;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Color(0xffF9F9F9),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: [
            Gap(20),
            CustomText(
              text: text,
              size: 16,
              color: Colors.black,
              letterSpacing: 0,
            ),
            Spacer(),
            free == true
                ? CustomText(
                  text: "Free",
                  size: 16,
                  color: Colors.black,
                  letterSpacing: 0,
                )
                : SizedBox.shrink(),
            IconButton(onPressed: () {}, icon: Icon(icon, size: 24)),
            Gap(10),
          ],
        ),
      ),
    );
  }
}
