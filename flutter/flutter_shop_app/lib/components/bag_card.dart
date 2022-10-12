import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../screens/info_page.dart';

class LeftCard extends StatelessWidget {
  Map<String, String> items;

  LeftCard({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: FadeInLeft(
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: "lemon",
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => InfoPage())));
                    },
                    child: Container(
                      height: 180,
                      width: 200,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 236, 202, 214),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xffDDDDDD),
                              blurRadius: 6.0,
                              spreadRadius: 1.0,
                              offset: Offset(
                                  0.0, 0.0), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: FadeInLeft(
                          child: Image.asset(items["url"].toString())),
                    ),
                  ),
                ),
                Positioned(
                    top: 15,
                    right: 15,
                    child: FadeInDownBig(
                      child: SvgPicture.asset(
                        "assets/icons/heart.svg",
                        color: Colors.white,
                      ),
                    )),
              ],
            ),
            Container(
              height: 60,
              width: 200,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xffDDDDDD),
                      blurRadius: 6.0,
                      spreadRadius: 2.0,
                      offset: Offset(0.0, 0.0), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 12, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeInLeftBig(
                      child: Text(
                        items["name"].toString(),
                        style: const TextStyle(
                            color: Color.fromARGB(255, 87, 82, 82),
                            letterSpacing: 1.2,
                            wordSpacing: 2,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FadeInUpBig(
                          child: Text(
                            items["star"].toString(),
                            style: const TextStyle(
                              color: Color.fromARGB(255, 154, 145, 145),
                            ),
                          ),
                        ),
                        Text(
                          items["price"].toString(),
                          style: const TextStyle(
                            color: Color.fromARGB(255, 154, 145, 145),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            )
          ],
        ),
      ),
    );
  }
}
