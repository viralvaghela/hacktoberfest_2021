import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_flutter/bloc/BlocProvider.dart';
import 'package:notes_flutter/bloc/ThemeBloc/ThemeBloc.dart';
import 'package:notes_flutter/bloc/ThemeBloc/ThemeEvent.dart';
import 'package:notes_flutter/bloc/ThemeBloc/ThemeState.dart';

class CustomSideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeBloc bloc = BlocProvider.of<ThemeBloc>(context);
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Image.asset(
              "asset/note.png",
              height: 100,
              width: 100,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Your Notes",
              style: Theme.of(context).textTheme.headline6,
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Theme:"),
                SizedBox(
                  width: 10,
                ),
                StreamBuilder<ThemeState>(
                  initialData: bloc.currentState,
                    stream: bloc.stateStream,
                    builder: (context, snapshot) {
                      List<bool> selected;
                      print(snapshot.data);
                      if (snapshot.data is DarkTheme) {
                        selected = [true, false];
                      } else {
                        selected = [false, true];
                      }
                      return ToggleButtons(
                        children: [Text("Night"), Text("Day")],
                        isSelected: selected,
                        borderRadius: BorderRadius.circular(5),
                        onPressed: (index) {
                          if (index == 0) {
                            bloc.eventSink.add(ChangeTheme(true));
                          } else {
                            bloc.eventSink.add(ChangeTheme(false));
                          }
                        },
                        selectedBorderColor: Theme.of(context).primaryColor,
                      );
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
