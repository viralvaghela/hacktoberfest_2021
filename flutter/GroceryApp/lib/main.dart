import 'package:flutter/material.dart';
import 'package:grocery_app/pages/store_list_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Grocery App",
      home: StoreListPage(), 
      theme: ThemeData(
        primaryColor: Colors.green 
      )
    );
    
  }
}
