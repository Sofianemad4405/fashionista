import 'package:fashionista/models/product_model.dart';
import 'package:fashionista/pages/Place_order.dart';
import 'package:fashionista/widgets/custom_app_bar.dart';
import 'package:fashionista/widgets/custom_button.dart';
import 'package:fashionista/widgets/custom_line.dart';
import 'package:fashionista/widgets/custom_text.dart';
import 'package:fashionista/widgets/header.dart';
import 'package:fashionista/widgets/product_checkout_card.dart';
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
  bool isEditing = false;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(isHome: false),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Gap(30),
                    Header(text: "CheckOut"),
                    CustomLine(),
                    Gap(20),
                    ProductCheckoutCard(
                      count: count,
                      product: widget.product,
                      onPlusTap: () {
                        setState(() {
                          count++;
                        });
                      },
                      onminusTap: () {
                        if (count > 1) {
                          setState(() {
                            count--;
                          });
                        }
                      },
                    ),
                    Gap(20),
                    Divider(),
                    Gap(15),
                    promo(text: "Add promo code", image: "promo1.svg"),
                    Gap(20),
                    Divider(),
                    Gap(15),
                    promo(text: "Delivery", image: "promo2.svg"),
                    Gap(20),
                    Divider(),
                  ],
                ),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                CustomText(
                  text: "Est. Total",
                  size: 20,
                  color: Colors.black,
                  letterSpacing: 3,
                ),
                Spacer(),
                CustomText(
                  text: "\$${widget.product.price * count}",
                  size: 24,
                  color: Color(0xffDD8560),
                  letterSpacing: 3,
                ),
              ],
            ),
          ),
          Gap(30),
          CustomButton(
            image: "assets/imgs/shopping bag.svg",
            text: "Checkout",
            onTap: () {
              if (formKey.currentState!.validate()) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PlaceOrder(
                        count: count,
                        totalPrice: widget.product.price * count,
                        product: widget.product,
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

Widget ctr(ontap, sign) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: SvgPicture.asset(sign),
      ),
    ),
  );
}

Widget promo({required String text, required String image}) {
  return Row(
    children: [
      SvgPicture.asset(
        "assets/imgs/$image",
        width: text != "Delivery" ? 25 : 32,
        height: text != "Delivery" ? 25 : 32,
      ),
      Gap(text != "Delivery" ? 10 : 18),
      CustomText(
        text: text,
        size: 16,
        color: Color.fromARGB(255, 9, 9, 9),
        letterSpacing: 0,
      ),
      Spacer(),
      text == "Delivery"
          ? CustomText(
            text: "Free",
            size: 16,
            color: Colors.black,
            letterSpacing: 0,
          )
          : Container(),
      Gap(25),
    ],
  );
}
