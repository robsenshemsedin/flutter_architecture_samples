import 'package:change_notifier_provider_sample/models/favorites.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemTile extends StatelessWidget {
  final int itemNo;

  const ItemTile(this.itemNo, {super.key});

  @override
  Widget build(BuildContext context) {
    var favoritesState = Provider.of<Favorites>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.primaries[itemNo % Colors.primaries.length],
        ),
        title: Text(
          'Item $itemNo',
          key: Key('text_$itemNo'),
        ),
        trailing: IconButton(
          key: Key('icon_$itemNo'),
          icon: favoritesState.items.contains(itemNo)
              ? const Icon(Icons.favorite)
              : const Icon(Icons.favorite_border),
          onPressed: () {
            !favoritesState.items.contains(itemNo)
                ? favoritesState.addItem(itemNo)
                : favoritesState.removeItem(itemNo);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(favoritesState.items.contains(itemNo)
                    ? 'Added to favorites.'
                    : 'Removed from favorites.'),
                duration: const Duration(seconds: 1),
              ),
            );
          },
        ),
      ),
    );
  }
}
