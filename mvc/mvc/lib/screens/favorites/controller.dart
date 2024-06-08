import 'package:flutter_mvc/flutter_mvc.dart';
import 'package:mvc/app_controller.dart';
import 'package:mvc/screens/favorites/view.dart';

class FavoriteScreenController extends AppController {
  @override
  MvcView<MvcController> view() => FavoritePageView();
}
