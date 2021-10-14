import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:whatasapp_status/Bloc/BlocProvider.dart';
import 'package:whatasapp_status/Bloc/MainScreenBloc/MainScreenBloc.dart';
import 'package:whatasapp_status/Bloc/MainScreenBloc/MainScreenEvent.dart';
import 'package:whatasapp_status/Bloc/MainScreenBloc/MainScreenState.dart';
import 'package:whatasapp_status/helper/getFilesList.dart';

import 'package:whatasapp_status/ui/ImageCardView.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({
    Key? key,
  }) : super(key: key);

  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> images = GetFileList.images;

    MainScreenBloc bloc = BlocProvider.of<MainScreenBloc>(context);
    return StreamBuilder<MainScreenState>(
        initialData: LoadingCompleted(),
        stream: bloc.stateStream,
        builder: (context, snapshot) {
          print(bloc);
          if (snapshot.hasData) {
            if (snapshot.data is Loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.data is LoadingCompleted) {
              return RefreshIndicator(
                onRefresh: () async {
                  bloc.eventSink.add(RefreshFiles());
                },
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 3,
                  padding: EdgeInsets.all(5),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  itemCount: images.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ImageCardView(images[index]);
                  },
                  staggeredTileBuilder: (int index) {
                    return StaggeredTile.fit(1);
                  },
                ),
              );
            } else {
              return Center(child: Text("Something went wrong"));
            }
          } else {
            return Center(
              child: Text("Something went wrong"),
            );
          }
        });
  }
}
