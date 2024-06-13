import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_samples/favorites/view_model/favorites_view_model.dart';

class ItemTile extends ConsumerWidget {
  final int itemNo;

  const ItemTile(this.itemNo, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(favoriteViewModel);

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
          icon: viewModel.items.contains(itemNo)
              ? const Icon(Icons.favorite)
              : const Icon(Icons.favorite_border),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(viewModel.items.contains(itemNo)
                    ? 'Removed from favorites.'
                    : 'Added to favorites'),
                duration: const Duration(seconds: 1),
              ),
            );
            !viewModel.items.contains(itemNo)
                ? ref.read(favoriteViewModel.notifier).add(itemNo)
                : ref.read(favoriteViewModel.notifier).remove(itemNo);
          },
        ),
      ),
    );
  }
}
