import 'dart:io';

import 'package:flutter/material.dart';
import 'package:share/share.dart';

class ImagePreviewScreen extends StatelessWidget {
  ImagePreviewScreen({required this.location});
  final String location;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.file(File(location)),
              SizedBox(
                height: 50,
              ),
              IconButton(
                onPressed: () {
                  Share.shareFiles([location]);
                },
                icon: Icon(Icons.share),
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
