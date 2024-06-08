import 'package:flutter/material.dart';
import 'package:flutter_mvc/flutter_mvc.dart';
import 'package:mvc/widgets/item_butten_mvc/controller.dart';

class ItemButtonView extends MvcView<ItemButtonController> {
  final int itemNo;

  ItemButtonView({required this.itemNo});
  @override
  Widget buildView() {
    return IconButton(
      key: Key('icon_$itemNo'),
      icon: controller.items.contains(itemNo)
          ? const Icon(Icons.favorite)
          : const Icon(Icons.favorite_border),
      onPressed: () {
        controller.items.contains(itemNo)
            ? controller.remove(itemNo)
            : controller.add(itemNo);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(!controller.items.contains(itemNo)
                ? 'Removed from favorites.'
                : 'Added to favorites.'),
            duration: const Duration(seconds: 1),
          ),
        );
      },
    );
  }
}
