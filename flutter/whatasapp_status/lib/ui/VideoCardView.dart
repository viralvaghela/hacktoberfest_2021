
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

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
                        image: snapshot.data!.image,
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
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Future<Image> getVideoThumbnail(String path) async {
    Uint8List? data = await VideoThumbnail.thumbnailData(
      video: "/"+path,
      imageFormat: ImageFormat.JPEG,
      maxWidth: 128,
      quality: 25,
    );

    return Image.memory(data!);
  }
}
