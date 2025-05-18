import 'package:fashionista/models/product_model.dart';
import 'package:fashionista/widgets/custom_app_bar.dart';
import 'package:fashionista/widgets/product_card.dart';
import 'package:fashionista/widgets/you_may_also_like_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: CustomAppBar(isHome: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          children: [
            Positioned(
              top: 30,
              left: 60,
              child: SvgPicture.asset(
                "assets/imgs/10.svg",
                colorFilter: ColorFilter.mode(
                  Color(0xff343434),
                  BlendMode.srcIn,
                ),
                height: 150,
                width: 200,
              ),
            ),
            Positioned(
              top: 60,
              left: 85,
              child: Text(
                "October",
                style: TextStyle(
                  color: Color(0xffFCFCFC),
                  fontSize: 50,
                  fontWeight: FontWeight.w700,
                  fontFamily: "BodoniModa",
                ),
              ),
            ),
            Positioned(
              top: 120,
              left: 80,
              child: Text(
                "Collection".toUpperCase(),
                style: TextStyle(
                  color: Color(0xffFCFCFC),
                  fontSize: 22,
                  fontWeight: FontWeight.normal,
                  fontFamily: "Tenor Sans",
                  letterSpacing: 6.06,
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 160),
                          child: Image.asset("assets/imgs/image 20.png"),
                        ),
                        Positioned(
                          top: 270,
                          left: 160,
                          child: SvgPicture.asset(
                            "assets/imgs/10.svg",
                            colorFilter: ColorFilter.mode(
                              Color.fromARGB(255, 16, 16, 16),
                              BlendMode.srcIn,
                            ),
                            height: 200,
                            width: 200,
                          ),
                        ),
                      ],
                    ),
                    Gap(20),
                    GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 15,
                        crossAxisCount: 2,
                        childAspectRatio: 0.45,
                      ),
                      itemCount: Product.products.length,
                      itemBuilder: (context, index) {
                        final product = Product.products[index];
                        return ProductCard(product: product);
                      },
                    ),
                    Gap(10),
                    Text(
                      "You may also like".toUpperCase(),
                      style: TextStyle(
                        letterSpacing: 4,
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Tenor Sans",
                        color: Colors.white,
                      ),
                    ),
                    Gap(10),
                    SvgPicture.asset(
                      "assets/imgs/12.svg",
                      width: 40,
                      height: 15,
                    ),
                    Gap(20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          YouMayAlsoLikeItem(
                            image: "assets/imgs/Rectangle 440.png",
                            name: "Black collection",
                          ),
                          Gap(20),
                          YouMayAlsoLikeItem(
                            image: "assets/imgs/Rectangle 440.png",
                            name: "HAE BY HAEKIM",
                          ),
                        ],
                      ),
                    ),
                    Gap(20),
                    Center(
                      child: SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Ionicons.logo_twitter,
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Ionicons.logo_instagram,
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Ionicons.logo_facebook,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Gap(10),
                    SvgPicture.asset(
                      "assets/imgs/12.svg",
                      width: 40,
                      height: 15,
                    ),
                    Gap(20),
                    Column(
                      children: [
                        Text(
                          "Sofianemad98@gmail.com",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Tenor Sans",
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "+20 100 279 2637",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Tenor Sans",
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "08:00 - 22:00 - Everyday",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Tenor Sans",
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Gap(20),
                    SvgPicture.asset(
                      "assets/imgs/12.svg",
                      width: 40,
                      height: 15,
                    ),
                    Gap(30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 44),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "About",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Tenor Sans",
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),

                          Text(
                            "Contact",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Tenor Sans",
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "Blog",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Tenor Sans",
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(40),
                    Center(
                      child: Text(
                        "Copyright© OpenUI All Rights Reserved.",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Tenor Sans",
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Gap(20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
