import 'package:flutter/material.dart';
import 'package:flutter_mvc/flutter_mvc.dart';
import 'package:mvc/model.dart';
import 'package:mvc/screens/home/controller.dart';
import 'package:mvc/widgets/item_butten_mvc/controller.dart';

class HomePageView extends MvcView<HomeScreenController> {
  @override
  Widget buildView() {
    return ListView.builder(
      itemCount: 100,
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemBuilder: (context, itemNo) => ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.primaries[itemNo % Colors.primaries.length],
        ),
        title: Text(
          'Item $itemNo',
          key: Key('item_text$itemNo'),
        ),
        trailing: Mvc(
          create: () => ItemButtonController(itemNo: itemNo),
          model: Favorites(),
        ),
      ),
    );
  }
}
