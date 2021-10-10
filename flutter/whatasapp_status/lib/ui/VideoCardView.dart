import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:whatasapp_status/Screens/VideoPreviewScreen.dart';

class VideoCardView extends StatelessWidget {
  VideoCardView(this.location);
  final String location;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Image>(
        future: getVideoThumbnail(location),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return InkWell(
              onTap: () {
                // Share.shareFiles([location]);
                // print(location);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return VideoPreviewScreen(location: location);
                }));
              },
              child: Card(
                margin: EdgeInsets.zero,
                elevation: 4,
                child: Image(
                  image: snapshot.data!.image,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.low,
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Future<Image> getVideoThumbnail(String path) async {
    Uint8List? data = await VideoThumbnail.thumbnailData(
      video: "/" + path,
      imageFormat: ImageFormat.JPEG,
      maxWidth: 128,
      quality: 25,
    );

    return Image.memory(data!);
  }
}
