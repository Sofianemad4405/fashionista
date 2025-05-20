import 'dart:developer';

import 'package:fashionista/helper.dart';
import 'package:fashionista/widgets/collection.dart';
import 'package:fashionista/widgets/custom_app_bar.dart';
import 'package:fashionista/widgets/custom_ten.dart';
import 'package:fashionista/widgets/custom_text.dart';
import 'package:fashionista/widgets/october.dart';
import 'package:fashionista/widgets/poster.dart';
import 'package:fashionista/widgets/psoducts_list.dart';
import 'package:fashionista/widgets/social_media_icon.dart';
import 'package:fashionista/widgets/vertical_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Future<bool> openApp({required String link}) async {
    try {
      final Uri url = Uri.parse(link);
      final bool launched = await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
      if (!launched) {
        debugPrint('Failed to launch URL: $link');
      }
      return launched;
    } catch (e) {
      debugPrint('Error launching URL: $e');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: CustomAppBar(isHome: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          children: [
            CustomTen(),
            October(),
            Collection(),
            SingleChildScrollView(
              child: Column(
                children: [
                  Poster(),
                  Gap(30),
                  Products(products: Helper.products),
                  Gap(20),
                  CustomText(
                    isUpper: true,
                    text: "You may also like",
                    size: 22,
                    color: Colors.white,
                    letterSpacing: 4,
                  ),
                  Gap(10),
                  SvgPicture.asset("assets/imgs/12.svg", width: 40, height: 15),
                  Gap(20),
                  SizedBox(
                    height: 330,
                    child: VerticalList(list: Helper.mayAlsoLike),
                  ),
                  Gap(20),
                  Center(
                    child: SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SocialMediaIcon(
                            icon: Ionicons.logo_twitter,
                            onPressed: () async {
                              log("message");
                              final url = Uri.parse(
                                "https://www.facebook.com/sofian.emad.44",
                              );
                              try {
                                log("sofiiii");
                                await launchUrl(
                                  url,
                                  mode: LaunchMode.externalApplication,
                                );
                              } catch (e) {
                                log(e.toString() + "susususuusu");
                                // Optionally show error
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Could not launch $url'),
                                  ),
                                );
                              }
                            },
                          ),
                          SocialMediaIcon(
                            icon: Ionicons.logo_facebook,
                            onPressed: () async {
                              openApp(
                                link: "https://www.facebook.com/sofian.emad.44",
                              );
                            },
                          ),
                          SocialMediaIcon(
                            icon: Ionicons.logo_instagram,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(10),
                  SvgPicture.asset("assets/imgs/12.svg", width: 40, height: 15),
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
                  SvgPicture.asset("assets/imgs/12.svg", width: 40, height: 15),
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
          ],
        ),
      ),
    );
  }
}
