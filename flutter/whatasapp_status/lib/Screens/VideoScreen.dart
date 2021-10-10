import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:whatasapp_status/Bloc/BlocProvider.dart';
import 'package:whatasapp_status/Bloc/MainScreenBloc/MainScreenBloc.dart';
import 'package:whatasapp_status/Bloc/MainScreenBloc/MainScreenState.dart';

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
    List<String> videos = GetFileList.videos;

    MainScreenBloc bloc = BlocProvider.of<MainScreenBloc>(context);

    return StreamBuilder<MainScreenState>(
        stream: bloc.stateStream,
        initialData: LoadingCompleted(),
        builder: (context, snapshot) {
          print(snapshot);
          if (snapshot.hasData) {
            if (snapshot.data is Loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.data is LoadingCompleted) {
              return RefreshIndicator(
                onRefresh: () async {
                  await GetFileList.getFilesList();
                  setState(() {});
                },
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 3,
                  padding: EdgeInsets.all(5),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  itemCount: videos.length,
                  itemBuilder: (BuildContext context, int index) {
                    return VideoCardView(videos[index]);
                  },
                  staggeredTileBuilder: (int index) {
                    return StaggeredTile.fit(1);
                  },
                ),
              );
            } else {
              return Center(
                child: Text("Something went erong"),
              );
            }
          } else {
            return Center(
              child: Text("Something went erong"),
            );
          }
        });
  }
}
