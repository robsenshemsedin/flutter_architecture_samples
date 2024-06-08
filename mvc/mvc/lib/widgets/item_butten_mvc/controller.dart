import 'package:flutter_mvc/flutter_mvc.dart';
import 'package:mvc/app_controller.dart';
import 'package:mvc/model.dart';
import 'package:mvc/screens/home/controller.dart';
import 'package:mvc/widgets/item_butten_mvc/view.dart';

class ItemButtonController extends HomeScreenController {
  final int itemNo;
  ItemButtonController({required this.itemNo});
  @override
  MvcView<MvcController> view() => ItemButtonView(itemNo: itemNo);
}
