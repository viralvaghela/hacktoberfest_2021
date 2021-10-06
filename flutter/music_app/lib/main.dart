import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/pages/homepage.dart';
import 'package:music_app/pages/music_playing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Music App',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark().copyWith(
          colorScheme: const ColorScheme.dark().copyWith(
              ),
              scaffoldBackgroundColor:const Color(0xFF161616) ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
