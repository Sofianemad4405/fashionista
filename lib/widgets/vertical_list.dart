import 'package:fashionista/models/you_may_also_like_item_model.dart';
import 'package:fashionista/widgets/you_may_also_like_item.dart';
import 'package:flutter/material.dart';

class VerticalList extends StatelessWidget {
  const VerticalList({super.key, required this.list});
  final List<YouMayAlsoLikeItemModel> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
      itemBuilder: (context, index) {
        return index != list.length - 1
            ? Padding(
              padding: const EdgeInsets.only(right: 16),
              child: YouMayAlsoLikeItem(youMayAlsoLikeItemModel: list[index]),
            )
            : YouMayAlsoLikeItem(youMayAlsoLikeItemModel: list[index]);
      },
    );
  }
}
