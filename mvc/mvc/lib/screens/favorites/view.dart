import 'package:flutter/material.dart';
import 'package:flutter_mvc/flutter_mvc.dart';
import 'package:mvc/model.dart';
import 'package:mvc/screens/favorites/controller.dart';
import 'package:mvc/widgets/favorite_item_tile/controller.dart';

class FavoritePageView extends MvcView<FavoriteScreenController> {
  FavoritePageView();
  @override
  Widget buildView() {
    return ListView.builder(
      itemCount: controller.items.length,
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemBuilder: (context, itemNo) => ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.primaries[itemNo % Colors.primaries.length],
        ),
        title: Text(
          'Item $itemNo',
          key: Key('favorites_text_$itemNo'),
        ),
        trailing: Mvc(
          create: () => FavoriteRemoveButtonController(itemNo: itemNo),
          model: Favorites(),
        ),
      ),
    );
  }
}
