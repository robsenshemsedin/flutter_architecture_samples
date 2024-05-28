import 'package:flutter/material.dart';
import 'package:mvc/controller.dart';
import 'package:mvc/widgets/favorite_item_tile.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State createState() => _FavoritesPageState();
}

class _FavoritesPageState extends StateMVC<FavoritesPage> {
  final Con con = Con();
  _FavoritesPageState() : super(Con());
  @override
  Widget build(BuildContext context) {
    /// Using [BlocBuilder] instead of `context.read<FavoritesBloc>()`
    /// help us to not rebuild the app bar.
    return Scaffold(
        appBar: AppBar(
          title: const Text('Favorites'),
        ),
        body: SetState(builder: (context, _) {
          return ListView.builder(
            itemCount: con.items.length,
            padding: const EdgeInsets.symmetric(vertical: 16),
            itemBuilder: (context, index) => FavoriteItemTile(con.items[index]),
          );
        }));
  }
}
