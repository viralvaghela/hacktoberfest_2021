

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:share/share.dart';

class ImageCardView extends StatelessWidget {
  ImageCardView(this.location);
  final String location;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Share.shareFiles([location]);
        print(location);
      },
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 4,
        child: Stack(
            fit: StackFit.passthrough,
            alignment: Alignment.center,
            children: [
              Image(
                image: Image.file(File(location)).image,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.low,
              ),
              Icon(
                Icons.share,
                color: Colors.white.withAlpha(200),
              ),
            ]),
      ),
    );
  }
}
