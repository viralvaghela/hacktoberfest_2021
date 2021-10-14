import 'dart:io';

import 'package:flutter/material.dart';

import 'package:whatasapp_status/Screens/ImagePreviewScreen.dart';

class ImageCardView extends StatelessWidget {
  ImageCardView(this.location);
  final String location;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Share.shareFiles([location]);
        // print(location);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ImagePreviewScreen(location: location);
        }));
      },
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 4,
        child: Image(
          image: Image.file(File(location)).image,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.low,
        ),
      ),
    );
  }
}
