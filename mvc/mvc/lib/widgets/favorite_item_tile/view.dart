import 'package:flutter/material.dart';
import 'package:flutter_mvc/flutter_mvc.dart';
import 'package:mvc/app_controller.dart';
import 'package:mvc/widgets/favorite_item_tile/controller.dart';

class FavoriteRemoveButtonView extends MvcView<FavoriteRemoveButtonController> {
  final int itemNo;

  FavoriteRemoveButtonView({required this.itemNo});
  @override
  Widget buildView() {
    return IconButton(
        key: Key('remove_icon_$itemNo'),
        icon: const Icon(Icons.close),
        onPressed: () {
          controller.remove(itemNo);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Removed from favorites.'),
              duration: Duration(seconds: 1),
            ),
          );
        });
  }
}
