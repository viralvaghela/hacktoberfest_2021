import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_app/components/bag_card.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components/app_bar.dart';
import '../components/category_card.dart';

class NewHomeScreen extends StatelessWidget {
  NewHomeScreen({Key? key}) : super(key: key);

  List<Map<String, String>> categoryIcons = [
    {
      "url": "assets/images/bag_5.png",
      "name": "Pink bag",
      "star": "⭐ 4.5",
      "price": "\$ 60"
    },
    {
      "url": "assets/images/bag_4.png",
      "name": "Mens bag",
      "star": "⭐ 4.8",
      "price": "\$ 80"
    },
    {
      "url": "assets/images/bag_2.png",
      "name": "Leather bag",
      "star": "⭐ 4.2",
      "price": "\$ 69.99"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // AppBar
            const CustomAppBar(),
            const SizedBox(
              height: 20,
            ),
            //Category cards
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CategoryCard1(),
                    CategoryCard1(),
                    CategoryCard1(),
                    CategoryCard1(),
                  ]),
            ),
            const SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FadeInLeft(
                    child: const Text(
                      "Popular",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    ),
                  ),
                  Text(
                    "View All",
                    style: TextStyle(color: Colors.pink[200], letterSpacing: 1),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 18,
            ),

            //bag cards
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                    children:
                        categoryIcons.map((e) => LeftCard(items: e)).toList()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22, bottom: 16),
              child: FadeInUpBig(
                child: const Text(
                  "Recommend",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.1),
                ),
              ),
            ),

            //recommend section
            FadeInUpBig(
              child: Container(
                margin: const EdgeInsets.only(left: 22, right: 22),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xffDDDDDD),
                        blurRadius: 6.0,
                        spreadRadius: 1.0,
                        offset: Offset(0.0, 0.0), // changes position of shadow
                      ),
                    ]),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/images/bag_1.png",
                        height: 70,
                        width: 70,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Blue Bag",
                            style: TextStyle(
                                color: Color.fromARGB(255, 88, 80, 80),
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1),
                          ),
                          Text(
                            "⭐ 4.4",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/heart.svg",
                            color: Colors.pink[300],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const Text(
                            "\$ 79.00",
                            style: TextStyle(
                              color: Color.fromARGB(255, 104, 91, 91),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      )
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
