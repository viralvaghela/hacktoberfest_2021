import 'dart:io';

import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:video_player/video_player.dart';

class VideoPreviewScreen extends StatefulWidget {
  const VideoPreviewScreen({required this.location});
  final String location;

  @override
  State<VideoPreviewScreen> createState() => _VideoPreviewScreenState();
}

class _VideoPreviewScreenState extends State<VideoPreviewScreen> {
  late final VideoPlayerController controller;
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller = VideoPlayerController.file(File("/" + widget.location));
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<void>(
          future: controller.initialize(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              controller.play();
              return Center(
                  child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                    VideoPlayer(controller),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              if (controller.value.isPlaying) {
                                controller.pause();
                              } else {
                                controller.play();
                              }
                            },
                            icon: controller.value.isPlaying
                                ? Icon(Icons.pause, color: Colors.white)
                                : Icon(Icons.play_arrow, color: Colors.white)),
                        IconButton(
                            onPressed: () {
                              controller.pause();
                              Share.shareFiles([widget.location]);
                            },
                            icon: Icon(
                              Icons.share,
                              color: Colors.white,
                            )),
                      ],
                    )
                  ]));
            } else {}
            return Center(
              child: Text("Something went wrong..."),
            );
          },
        ),
      ),
    );
  }
}
