
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      padding: const EdgeInsets.only(top: 48, left: 22, right: 22),
      decoration: BoxDecoration(
          color: Colors.pink[200],
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                CupertinoIcons.list_bullet_indent,
                color: mColor,
                size: 26,
              ),
              SvgPicture.asset(
                "assets/icons/cart.svg",
                height: 24,
                color: mColor,
              )
            ],
          ),
          const SizedBox(
            height: 26,
          ),
          FadeInLeft(
            child: const Text(
              "Find Your Favourite",
              style: TextStyle(
                  color: Color.fromARGB(255, 94, 31, 31),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1),
            ),
          ),
          FadeInLeft(
            child: const Text(
              "Items!",
              style: TextStyle(
                  color: Color.fromARGB(255, 94, 31, 31),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 45,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(44),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                SizedBox(
                  width: 12,
                ),
                Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  "Search",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
