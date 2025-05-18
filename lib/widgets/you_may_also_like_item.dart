import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class YouMayAlsoLikeItem extends StatelessWidget {
  const YouMayAlsoLikeItem({
    super.key,
    required this.image,
    required this.name,
  });
  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image.asset(image, fit: BoxFit.cover),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Text(
            name.toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Tenor Sans",
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 2,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
