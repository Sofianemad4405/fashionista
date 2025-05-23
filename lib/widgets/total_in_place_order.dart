import 'package:fashionista/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TotalInPlaceOrder extends StatelessWidget {
  const TotalInPlaceOrder({super.key, required this.totalValue});

  final double totalValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(
          text: "Total",
          size: 20,
          color: Colors.black,
          letterSpacing: 3,
        ),
        Spacer(),
        CustomText(
          text: "\$ $totalValue",
          size: 24,
          color: Color(0xffDD8560),
          letterSpacing: 3,
        ),
      ],
    );
  }
}
