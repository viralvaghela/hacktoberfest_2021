import 'package:flutter/material.dart';
import 'package:notes_flutter/UI/CustomSideDrawer.dart';
import 'package:notes_flutter/UI/card.dart';
import 'package:notes_flutter/bloc/BlocProvider.dart';
import 'package:notes_flutter/bloc/NoteListBloc/NoteListBloc.dart';
import 'package:notes_flutter/bloc/NoteListBloc/NoteListState.dart';
import 'package:notes_flutter/model/Notes.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'EditNote.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //by default set grid view
  bool isGrid = true;
  //size of single card based on gid view or list view
  int cardSize = 1;

//change view to grid or list

  void changeView() {
    setState(() {
      if (isGrid) {
        cardSize = 2;
      } else {
        cardSize = 1;
      }
      isGrid = !isGrid;
    });
  }

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<NoteListBloc>(context);
    return Scaffold(
      // backgroundColor: Colors.grey[200],
      drawer: CustomSideDrawer(),
      appBar: AppBar(
        title: Row(
          children: [
            Text("Notes"),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                changeView();
              },
              //change icon button based on grid view or list view
              icon: Icon(
                !isGrid ? Icons.grid_view : Icons.view_list_rounded,
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "newNote",
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return EditNote();
          }));
        },
        child: Icon(
          Icons.add,
        ),
      ),
      body: StreamBuilder<NoteListState>(
          initialData: bloc.currentState,
          stream: bloc.stateStream,
          builder: (context, snapshot) {
            print(snapshot.data);
            if (snapshot.hasData) {
              if (snapshot.data is InitialState) {
                print("initial state");
              } else if (snapshot.data is NotesLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.data is NotesLoadingCompletedState) {
                return NotesGrid(
                    cardSize: cardSize, data: snapshot.data!.data!);
              }
              return NotesGrid(cardSize: cardSize, data: snapshot.data!.data!);
            } else {
              return Center(
                child: Text("Something went wrong..."),
              );
            }
          }),
    );
  }
}

class NotesGrid extends StatelessWidget {
  const NotesGrid({Key? key, required this.cardSize, required this.data})
      : super(key: key);

  final int cardSize;
  final List<Note> data;

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        padding: EdgeInsets.all(20),
        itemCount: data.length,
        staggeredTileBuilder: (index) {
          return StaggeredTile.fit(cardSize);
        },
        itemBuilder: (context, position) {
          return NoteCard(data[position]);
        });
  }
}
