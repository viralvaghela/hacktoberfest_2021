import 'package:bmicalculator/app/app.routes.dart';
import 'package:bmicalculator/app/providers/app.providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Core());
}

class Core extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(child: Lava(), providers: AppProvider.providers);
  }
}

class Lava extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData.light(),
      initialRoute: AppRoutes.SplashRoute,
      routes: AppRoutes.routes,
    );
  }
}
