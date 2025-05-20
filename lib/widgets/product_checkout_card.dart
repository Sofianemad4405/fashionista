import 'package:fashionista/models/product_model.dart';
import 'package:fashionista/pages/product_details.dart';
import 'package:fashionista/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductCheckoutCard extends StatefulWidget {
  const ProductCheckoutCard({
    super.key,
    required this.product,
    required this.onPlusTap,
    required this.onminusTap,
    required this.count,
  });
  final Product product;
  final int count;
  final Function onPlusTap;
  final Function onminusTap;

  @override
  State<ProductCheckoutCard> createState() => _ProductCheckoutCardState();
}

class _ProductCheckoutCardState extends State<ProductCheckoutCard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(widget.product.image, height: 150),
        Gap(10),
        SizedBox(
          width: size.width * 0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(10),
              //title
              CustomText(
                text: widget.product.name,
                size: 24,
                color: Colors.black,
                letterSpacing: 4,
              ),
              //description
              CustomText(
                text: widget.product.description,
                size: 12,
                color: Color.fromARGB(255, 9, 9, 9),
                letterSpacing: 0,
              ),
              Gap(10),
              Row(
                children: [
                  ctr(widget.onminusTap, "assets/imgs/minus.svg"),
                  Gap(10),
                  Text(widget.count.toString()),
                  Gap(10),
                  ctr(widget.onPlusTap, "assets/imgs/Pluss.svg"),
                ],
              ),
              Gap(10),
              CustomText(
                text: "\$${widget.product.price * widget.count}",
                size: 24,
                color: Color(0xffDD8560),
                letterSpacing: 4,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
