import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:whatasapp_status/helper/getFilesList.dart';
import 'package:whatasapp_status/ui/VideoCardView.dart';


class VideoScreen extends StatefulWidget {
  const VideoScreen({
    Key? key,
  }) : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  Widget build(BuildContext context) {

    List<String> images = GetFileList.videos;
    return RefreshIndicator(
      onRefresh: () async {
         await GetFileList.getFilesList();
        setState(() {
        });
      },
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 3,
        padding: EdgeInsets.all(5),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index) {
          return VideoCardView(images[index]);
        },
        staggeredTileBuilder: (int index) {
          return StaggeredTile.fit(1);
        },
      ),
    );
  }
}
