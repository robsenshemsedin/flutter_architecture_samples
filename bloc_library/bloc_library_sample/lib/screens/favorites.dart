import 'package:bloc_library_sample/blocs/blocs.dart';
import 'package:bloc_library_sample/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});
  @override
  Widget build(BuildContext context) {
    /// Using [BlocBuilder] instead of `context.read<FavoritesBloc>()`
    /// help us to not rebuild the app bar.
    return Scaffold(
        appBar: AppBar(
          title: const Text('Favorites'),
        ),
        body: BlocBuilder<FavoritesBloc, List<int>>(builder: (context, state) {
          return ListView.builder(
            itemCount: state.length,
            padding: const EdgeInsets.symmetric(vertical: 16),
            itemBuilder: (context, index) => FavoriteItemTile(state[index]),
          );
        }));
  }
}
