import 'package:fashionista/widgets/custom_app_bar.dart';
import 'package:fashionista/widgets/custom_line.dart';
import 'package:fashionista/widgets/header.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class BasePlaceOrder extends StatelessWidget {
  const BasePlaceOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(isHome: false),
        Gap(30),
        Header(text: "Place Order"),
        Center(child: CustomLine()),
        Gap(20),
      ],
    );
  }
}
