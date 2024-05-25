import 'package:bloc_library_sample/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemTile extends StatelessWidget {
  final int itemNo;

  const ItemTile(this.itemNo, {super.key});

  @override
  Widget build(BuildContext context) {
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
        trailing: BlocConsumer<FavoritesBloc, List<int>>(
            listener: (context, state) => true,
            builder: (
              context,
              state,
            ) {
              return IconButton(
                key: Key('icon_$itemNo'),
                icon: state.contains(itemNo)
                    ? const Icon(Icons.favorite)
                    : const Icon(Icons.favorite_border),
                onPressed: () {
                  !state.contains(itemNo)
                      ? context
                          .read<FavoritesBloc>()
                          .add(FavoriteAdded(item: itemNo))
                      : context
                          .read<FavoritesBloc>()
                          .add(FavoriteRemoved(item: itemNo));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(!state.contains(itemNo)
                          ? 'Added to favorites.'
                          : 'Removed from favorites.'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}
