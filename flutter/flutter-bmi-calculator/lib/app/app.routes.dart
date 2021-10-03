import 'package:bmicalculator/meta/views/home.views.dart';
import 'package:bmicalculator/meta/views/splash.views.dart';

class AppRoutes {
  static const String HomeRoute = '/home';
  static const String SplashRoute = '/splash';

  static final routes = {
    HomeRoute: (context) => HomeView(),
    SplashRoute: (context) => SplashView(),
  };
}
