import 'package:change_notifier_provider_sample/models/favorites.dart';
import 'package:change_notifier_provider_sample/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  static String routeName = 'favorites_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Favorites'),
        ),
        body: Consumer<Favorites>(builder: (context, model, _) {
          return ListView.builder(
            itemCount: model.items.length,
            padding: const EdgeInsets.symmetric(vertical: 16),
            itemBuilder: (context, index) =>
                FavoriteItemTile(model.items[index]),
          );
        }));
  }
}
