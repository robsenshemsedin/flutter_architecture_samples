import 'package:flutter_mvc/flutter_mvc.dart';
import 'package:mvc/app_controller.dart';
import 'package:mvc/screens/favorites/controller.dart';
import 'package:mvc/widgets/favorite_item_tile/view.dart';

class FavoriteRemoveButtonController extends AppController {
  final int itemNo;

  FavoriteRemoveButtonController({required this.itemNo});
  @override
  MvcView<MvcController> view() => FavoriteRemoveButtonView(itemNo: itemNo);
}
