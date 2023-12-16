import 'package:bino_kids/applications/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class MainApplication{
  static final List<SingleChildWidget> applicationList = [
    ChangeNotifierProvider<HomeProvider>(
        lazy:false,
        create: (context) => HomeProvider()),
  ];
}

