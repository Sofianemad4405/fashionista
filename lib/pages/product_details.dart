import 'package:fashionista/models/product_model.dart';
import 'package:fashionista/widgets/custom_app_bar.dart';
import 'package:fashionista/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.product});
  final Product product;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(isHome: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Gap(30),
            //checkout & 12
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: "Checkout",
                  size: 24,
                  color: Colors.black,
                  letterSpacing: 4,
                  isUpper: true,
                ),
              ],
            ),
            SvgPicture.asset(
              "assets/imgs/12.svg",
              width: 20,
              height: 15,
              colorFilter: ColorFilter.mode(Color(0xff555555), BlendMode.srcIn),
            ),

            //details row
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //product image
                  Image.asset(widget.product.image, height: 150),
                  Gap(10),
                  //title & description&count
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(10),
                      CustomText(
                        text: widget.product.name,
                        size: 24,
                        color: Colors.black,
                        letterSpacing: 4,
                      ),
                      CustomText(
                        text: widget.product.description,
                        size: 12,
                        color: Color.fromARGB(255, 9, 9, 9),
                        letterSpacing: 0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black26),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: SvgPicture.asset(
                      "assets/imgs/minus.svg",
                      colorFilter: ColorFilter.mode(
                        Colors.black26,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                Text(count.toString()),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black26),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: SvgPicture.asset(
                      "assets/imgs/minus.svg",
                      colorFilter: ColorFilter.mode(
                        Colors.black26,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Container(
              color: const Color.fromARGB(255, 62, 62, 62),
              height: 0.7,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
