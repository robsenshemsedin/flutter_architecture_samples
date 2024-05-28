import 'package:flutter/material.dart';
import 'package:mvc/controller.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class ItemTile extends StatelessWidget {
  final int itemNo;

  ItemTile(this.itemNo, {required key}) : super(key: key);
  final Con con = Con();

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
        trailing: SetState(builder: (
          context,
          _,
        ) {
          return IconButton(
            key: Key('icon_$itemNo'),
            icon: con.items.contains(itemNo)
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_border),
            onPressed: () {
              con.items.contains(itemNo) ? con.add(itemNo) : con.remove(itemNo);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(!con.items.contains(itemNo)
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
