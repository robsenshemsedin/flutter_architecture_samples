import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_samples/favorites/view_model/favorites_view_model.dart';

class FavoriteItemTile extends ConsumerWidget {
  const FavoriteItemTile(this.itemNo, {super.key});

  final int itemNo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.primaries[itemNo % Colors.primaries.length],
        ),
        title: Text(
          'Item $itemNo',
          key: Key('favorites_text_$itemNo'),
        ),
        trailing: IconButton(
          key: Key('remove_icon_$itemNo'),
          icon: const Icon(Icons.close),
          onPressed: () {
            ref.read(favoriteViewModel.notifier).remove(itemNo);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Removed from favorites.'),
                duration: Duration(seconds: 1),
              ),
            );
          },
        ),
      ),
    );
  }
}
