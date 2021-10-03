import 'package:bmicalculator/core/notifiers/bmi_calculate.notifiers.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProvider{

  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => BmiNotifier())
  ];
}