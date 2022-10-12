import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_shop_app/screens/new_home_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.pink[200],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                )),
            height: MediaQuery.of(context).size.height / 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 44, left: 22, right: 22),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => NewHomeScreen())));
                        },
                        child: SvgPicture.asset(
                          "assets/icons/back.svg",
                          height: 14,
                          width: 20,
                          color: Colors.white,
                        ),
                      ),
                      SvgPicture.asset(
                        "assets/icons/heart.svg",
                        height: 18,
                      )
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 22, right: 22, top: 38),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FadeInLeft(
                                child: Text(
                                  "Brand",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Color.fromARGB(255, 212, 94, 94),
                                  ),
                                ),
                              ),
                              FadeInLeft(
                                child: Text(
                                  "Moon",
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.7),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              FadeInLeft(
                                child: Text(
                                  "Code",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 212, 94, 94),
                                  ),
                                ),
                              ),
                              FadeInLeft(
                                child: Text(
                                  "Y2d435",
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.7),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              FadeInLeft(
                                child: Text(
                                  "Leather",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 212, 94, 94),
                                  ),
                                ),
                              ),
                              FadeInLeft(
                                child: Text(
                                  "100%",
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.7),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              // Row(
                              //   children: [
                              //     Icon(
                              //       Icons.circle,
                              //       color: Colors.pink[800],
                              //     ),
                              //     SizedBox(
                              //       width: 6,
                              //     ),
                              //     Icon(
                              //       Icons.circle,
                              //       color: Colors.red,
                              //     ),
                              //     SizedBox(
                              //       width: 6,
                              //     ),
                              //     Icon(Icons.circle, color: Colors.amber[400])
                              //   ],
                              // )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        BounceInLeft(
                          child: Hero(
                            tag: "lemon",
                            child: Container(
                              height: 200,
                              width: 200,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage("assets/images/bag_5.png"),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FadeInLeft(
                  child: Text(
                    "Pink Bag",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
                Row(
                  children: [
                    FadeInRight(
                      child: Text(
                        "\$90",
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    FadeInRight(
                      child: Text(
                        "\$60",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.pink,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 18),
            margin: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Size",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.red),
                      child: Center(
                        child: Text(
                          "S",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white),
                      child: Center(
                        child: Text(
                          "M",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white),
                      child: Center(
                        child: Text(
                          "L",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 22),
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "About",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                FadeInUpBig(
                  child: Text(
                    "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          FadeInUpBig(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 22),
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0xffDDDDDD),
                                blurRadius: 6.0,
                                spreadRadius: 1.0,
                                offset: Offset(
                                    0.0, 0.0), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(40)),
                        child: const Icon(
                          Icons.add,
                          color: Colors.pink,
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xffDDDDDD),
                                blurRadius: 6.0,
                                spreadRadius: 1.0,
                                offset: Offset(
                                    0.0, 0.0), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(40)),
                        child: Center(
                          child: Text(
                            "2",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xffDDDDDD),
                                blurRadius: 6.0,
                                spreadRadius: 1.0,
                                offset: Offset(
                                    0.0, 0.0), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(40)),
                        child: Icon(
                          Icons.remove,
                          color: Colors.pink,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Container(
                      height: 50,
                      width: 160,
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xffDDDDDD),
                              blurRadius: 6.0,
                              spreadRadius: 1.0,
                              offset: Offset(
                                  0.0, 0.0), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(40)),
                      child: Center(
                        child: Text(
                          "ADD TO CART",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
