import 'package:flutter/material.dart';
import 'package:mvvm_samples/favorites/view/widgets/favorite_item_tile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_samples/favorites/view_model/favorites_view_model.dart';

class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Favorites'),
        ),
        body: Builder(builder: (context) {
          final viewModel = ref.watch(favoriteViewModel);
          return ListView.builder(
            itemCount: viewModel.items.length,
            padding: const EdgeInsets.symmetric(vertical: 16),
            itemBuilder: (context, index) =>
                FavoriteItemTile(viewModel.items[index]),
          );
        }));
  }
}
