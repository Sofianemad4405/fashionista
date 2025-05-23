import 'dart:developer';

import 'package:fashionista/models/product_model.dart';
import 'package:fashionista/pages/add_address.dart';
import 'package:fashionista/pages/home.dart';
import 'package:fashionista/pages/payment.dart';
import 'package:fashionista/widgets/address_view.dart';
import 'package:fashionista/widgets/base_place_order.dart';
import 'package:fashionista/widgets/custom_container.dart';
import 'package:fashionista/widgets/custom_button.dart';
import 'package:fashionista/widgets/custom_line.dart';
import 'package:fashionista/widgets/custom_text.dart';
import 'package:fashionista/widgets/payment_method.dart';
import 'package:fashionista/widgets/product_checkout_card.dart';
import 'package:fashionista/widgets/total_in_place_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class PlaceOrder extends StatefulWidget {
  PlaceOrder({
    super.key,
    required this.totalPrice,
    required this.product,
    required this.count,
  });
  final double totalPrice;
  final Product product;
  int count;

  @override
  State<PlaceOrder> createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  dynamic savedAddress;
  dynamic savedCard;
  bool addressAdded = false;
  bool cardAdded = false;

  void goToAddress(context) async {
    final addressData = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return AddAddress();
        },
      ),
    );
    if (addressData != null) {
      setState(() {
        savedAddress = addressData;
        addressAdded = true;
      });
    }
  }

  void goToCard(context) async {
    final cardData = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return Payment(cardData: savedCard);
        },
      ),
    );
    if (cardData != null) {
      setState(() {
        savedCard = cardData;
        cardAdded = true;
      });
    }
  }

  void editAddress(context) async {
    final data = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return AddAddress(editData: savedAddress);
        },
      ),
    );
    if (data != null) {
      setState(() {
        savedAddress = data;
      });
    }
  }

  void editCard(context) async {
    final data = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return Payment(cardData: savedCard);
        },
      ),
    );
    if (data != null) {
      setState(() {
        savedCard = data;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //base
          BasePlaceOrder(),

          //before address added
          !addressAdded
              ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomText(
                  text: "Shipping adress",
                  size: 16,
                  color: Color(0xff888888),
                  letterSpacing: 3,
                ),
              )
              : SizedBox.shrink(),

          //shipping address
          addressAdded
              ? AddressView(
                onPressed: () {
                  editAddress(context);
                },
                savedAddress: savedAddress,
              )
              : SizedBox.shrink(),

          // add shipping address
          Gap(20),
          addressAdded == false
              ? GestureDetector(
                onTap: () {
                  goToAddress(context);
                },
                child: CustomContainer(
                  text: "Add Shipping Address",
                  icon: Icons.add,
                ),
              )
              : SizedBox.shrink(),
          addressAdded == false && cardAdded == false
              ? Gap(50)
              : SizedBox.shrink(),

          //shipping method
          !cardAdded
              ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomText(
                  text: "Shipping Method",
                  size: 16,
                  color: Color(0xff888888),
                  letterSpacing: 3,
                ),
              )
              : SizedBox.shrink(),
          cardAdded ? Gap(20) : Gap(20),

          //shipping method
          !cardAdded
              ? CustomContainer(
                text: "Pickup at store",
                icon: Icons.keyboard_arrow_down,
                free: true,
              )
              : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ShowPaymentInfo(
                  editCard: () {
                    log("message");
                    editCard(context);
                  },
                  savedCard: savedCard,
                ),
              ),

          Gap(50),

          //before adding card
          !cardAdded
              ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomText(
                  text: "Payment Method",
                  size: 16,
                  color: Color(0xff888888),
                  letterSpacing: 3.5,
                ),
              )
              : SizedBox.shrink(),

          Gap(20),
          cardAdded == false
              ? GestureDetector(
                onTap: () {
                  goToCard(context);
                },
                child: CustomContainer(
                  text: "Add Payment Method",
                  icon: Icons.add,
                ),
              )
              : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ProductCheckoutCard(
                  count: widget.count,
                  product: widget.product,
                  onPlusTap: () {
                    setState(() {
                      widget.count++;
                    });
                  },
                  onminusTap: () {
                    if (widget.count > 1) {
                      setState(() {
                        widget.count--;
                      });
                    }
                  },
                ),
              ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TotalInPlaceOrder(
              totalValue: widget.product.price * widget.count,
            ),
          ),
          Gap(20),
          CustomButton(
            image: "assets/imgs/shopping bag.svg",
            text: "Place Order",
            onTap: () {
              if (cardAdded && addressAdded) {
                showPaymentSuccessDialog(context, () {});
              } else {
                if (!addressAdded) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Please add an address"),
                      duration: Duration(milliseconds: 200),
                    ),
                  );
                }
                if (!cardAdded) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Please add a payment method"),
                      duration: Duration(milliseconds: 200),
                    ),
                  );
                }
              }
            },
          ),
        ],
      ),
    );
  }
}

void showPaymentSuccessDialog(BuildContext context, VoidCallback onTap) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            // borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CustomText(
                text: "PAYMENT SUCCESS",
                size: 20,
                color: Colors.black,
                letterSpacing: 1,
                weight: FontWeight.bold,
              ),
              Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: SvgPicture.asset("assets/imgs/stars3.svg"),
                  ),
                  SvgPicture.asset("assets/imgs/stars.svg"),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: SvgPicture.asset("assets/imgs/stars2.svg"),
                  ),
                ],
              ),
              Gap(20),
              const CustomText(
                text: "Your payment was successful",
                size: 14,
                color: Colors.black,
                letterSpacing: 0,
                weight: FontWeight.w500,
              ),
              Gap(10),
              CustomText(
                text: "Payment ID : 15263541",
                size: 14,
                color: Colors.grey,
                letterSpacing: 0,
                weight: FontWeight.bold,
              ),
              Gap(20),
              CustomLine(length: 5, width: 10),
              Gap(20),
              const CustomText(
                isUpper: false,
                text: "Rate your purchase",
                size: 16,
                color: Colors.black,
                letterSpacing: 0,
                weight: FontWeight.bold,
              ),
              Gap(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: Duration(milliseconds: 800),
                            content: CustomText(
                              text: "ليه يا عرص؟",
                              size: 12,
                              color: Colors.white,
                              letterSpacing: 0,
                              weight: FontWeight.bold,
                              maxlines: 1,
                            ),
                          ),
                        );
                      },
                      child: SvgPicture.asset("assets/imgs/sad.svg"),
                    ),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: Duration(milliseconds: 800),
                            content: CustomText(
                              text: "ليه يا عرص؟",
                              size: 12,
                              color: Colors.white,
                              letterSpacing: 0,
                              weight: FontWeight.bold,
                              maxlines: 1,
                            ),
                          ),
                        );
                      },
                      child: SvgPicture.asset("assets/imgs/Happy.svg"),
                    ),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: Duration(milliseconds: 800),
                            content: CustomText(
                              text:
                                  "فحححححححححححححححححححححححححححححححححححححححححححل",
                              size: 12,
                              color: Colors.white,
                              letterSpacing: 0,
                              weight: FontWeight.bold,
                              maxlines: 1,
                            ),
                          ),
                        );
                      },
                      child: SvgPicture.asset("assets/imgs/so_happy.svg"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              Row(
                children: [
                  Container(
                    height: 60,
                    width: 120,
                    decoration: BoxDecoration(color: Colors.black),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: Duration(milliseconds: 800),
                              content: CustomText(
                                text: "Purchace Completed Successfuly",
                                size: 12,
                                color: Colors.white,
                                letterSpacing: 0,
                                weight: FontWeight.bold,
                                maxlines: 1,
                              ),
                            ),
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                          );
                        },
                        child: CustomText(
                          text: "Submit",
                          size: 16,
                          color: Colors.white,
                          letterSpacing: 0,
                          weight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Gap(20),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 0.1),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: CustomText(
                            text: "Back To Home",
                            size: 16,
                            color: Colors.black,
                            letterSpacing: 0,
                            weight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
