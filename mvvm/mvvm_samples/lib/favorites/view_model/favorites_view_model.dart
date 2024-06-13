import 'package:mvvm_samples/favorites/models/favorites.dart';
import 'package:riverpod/riverpod.dart';

class FavoritesViewModel extends Notifier<Favorites> {
  @override
  Favorites build() {
    return Favorites(items: []);
  }

  add(int item) {
    final updatedList = [...state.items, item];
    state = Favorites(items: updatedList);
  }

  remove(int item) {
    final updatedList = state.items;
    updatedList.remove(item);
    state = Favorites(items: updatedList);
  }
}

final favoriteViewModel =
    NotifierProvider<FavoritesViewModel, Favorites>(() => FavoritesViewModel());
