import 'package:fashionista/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class ShowPaymentInfo extends StatelessWidget {
  const ShowPaymentInfo({
    super.key,
    required this.editCard,
    required this.savedCard,
  });

  final VoidCallback editCard;
  final dynamic savedCard;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: editCard,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset("assets/imgs/Mastercard.svg"),
              // Gap(5),
              CustomText(
                text:
                    "Master Card ending *****${savedCard['cardNumber'].substring(16) ?? ""}",
                size: 12,
                color: Color.fromARGB(255, 0, 0, 0),
                letterSpacing: 1,
                weight: FontWeight.bold,
              ),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
          Gap(40),
          Divider(color: Color(0xffE5E5E5)),
        ],
      ),
    );
  }
}
