
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class CategoryCard1 extends StatelessWidget {
  const CategoryCard1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideInLeft(
      child: Container(
        height: 70,
        width: 70,
        color: Colors.pink[200]!.withOpacity(0.6),
        child: Column(
          children: [
            const SizedBox(
              height: 4,
            ),
            Image.network(
              "https://cdn2.iconfinder.com/data/icons/smileys-people-accessories-add-on/48/v-24-512.png",
              width: 44,
              height: 44,
            ),
            const Text(
              "Bags",
              style: TextStyle(
                color: Color.fromARGB(255, 132, 110, 110),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
