import 'package:fashionista/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddressView extends StatelessWidget {
  const AddressView({
    super.key,
    required this.onPressed,
    required this.savedAddress,
  });
  final void Function() onPressed;
  final dynamic savedAddress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GestureDetector(
        onTap: onPressed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text:
                          "${savedAddress['firstName']} ${savedAddress['lastName']}",
                      size: 16,
                      color: Color.fromARGB(255, 0, 0, 0),
                      letterSpacing: 3,
                      weight: FontWeight.bold,
                    ),
                    Gap(5),
                    CustomText(
                      maxlines: 2,
                      text: "${savedAddress['address']}",
                      size: 12,
                      color: Color.fromARGB(255, 0, 0, 0),
                      letterSpacing: 3,
                    ),
                    Gap(5),
                    CustomText(
                      text: "${savedAddress['phoneNumber']}",
                      size: 16,
                      color: Color(0xff888888),
                      letterSpacing: 3,
                    ),
                    CustomText(
                      text: "${savedAddress['city']}",
                      size: 16,
                      color: Color(0xff888888),
                      letterSpacing: 3,
                    ),
                    CustomText(
                      text: "${savedAddress['state']}",
                      size: 16,
                      color: Color(0xff888888),
                      letterSpacing: 3,
                    ),
                    CustomText(
                      text: "${savedAddress['zipCode']}",
                      size: 16,
                      color: Color(0xff888888),
                      letterSpacing: 3,
                    ),
                  ],
                ),
                Spacer(),
                IconButton(
                  onPressed: onPressed,
                  icon: Icon(Icons.arrow_forward_ios, color: Colors.black),
                ),
              ],
            ),
            Gap(10),
            Divider(color: Color(0xffE5E5E5)),
          ],
        ),
      ),
    );
  }
}
