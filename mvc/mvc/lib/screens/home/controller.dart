import 'package:flutter_mvc/flutter_mvc.dart';
import 'package:mvc/app_controller.dart';
import 'package:mvc/screens/home/view.dart';

class HomeScreenController extends AppController {
  @override
  MvcView<MvcController> view() => HomePageView();
}
