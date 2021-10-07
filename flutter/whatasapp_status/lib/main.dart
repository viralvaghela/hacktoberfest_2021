import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:whatasapp_status/Bloc/BlocProvider.dart';
import 'package:whatasapp_status/Bloc/MainScreenBloc/MainScreenBloc.dart';
import 'package:whatasapp_status/Bloc/MainScreenBloc/MainScreenEvent.dart';

import 'Screens.dart/HomeScreen.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainScreenBloc>(
      bloc: MainScreenBloc()..eventSink.add(InitilizeFiles()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //TODO add permision screen
    getStoragePermission(context);
    return HomeScreen();
  }

  Future<void> getStoragePermission(BuildContext context) async {
    await Permission.storage.request();
    var status = await Permission.storage.status;
    if (status.isDenied) {
      print("permision denied");
      showPermisionDeniedDailog(context);
    } else if (status.isGranted) {
      print("permision granted");
    } else if (status.isPermanentlyDenied) {
      print("permision permantly denied");
    } else if (status.isRestricted) {
      print("permision restricted");
    }
  }

  void showPermisionDeniedDailog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: Text("Please alow Storage Permission"),
          );
        });
  }
}
