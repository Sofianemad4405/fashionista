import 'package:fashionista/models/you_may_also_like_item_model.dart';
import 'package:flutter/material.dart';

class YouMayAlsoLikeItem extends StatelessWidget {
  const YouMayAlsoLikeItem({super.key, required this.youMayAlsoLikeItemModel});
  final YouMayAlsoLikeItemModel youMayAlsoLikeItemModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image.asset(youMayAlsoLikeItemModel.image, fit: BoxFit.cover),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Text(
            youMayAlsoLikeItemModel.name.toUpperCase(),
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
