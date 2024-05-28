import 'package:flutter/material.dart';
import 'package:mvc/screens/favorites.dart';
import 'package:mvc/widgets/item_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item List'),
        actions: <TextButton>[
          TextButton.icon(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const FavoritesPage())));
            },
            icon: const Icon(Icons.favorite_border),
            label: const Text('Favorites'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 100,
        cacheExtent: 20.0,
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (context, index) => ItemTile(
          index,
          key: UniqueKey(),
        ),
      ),
    );
  }
}
