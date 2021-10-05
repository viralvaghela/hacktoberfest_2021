

import 'package:flutter/material.dart';

import 'ImageScreen.dart';
import 'VideoScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Whatsapp Status"),
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Icon(
                    Icons.image,
                    semanticLabel: "Images",
                  ),
                ),
                Tab(
                  child: Icon(
                    Icons.video_call,
                    semanticLabel: "videos",
                  ),
                )
              ],
            ),
          ),
          body: TabBarView(children: [
            ImageScreen(),
            VideoScreen(),
          ])),
    );
  }
}
