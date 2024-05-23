sealed class FavoritesEvent {
  final int item;
  FavoritesEvent({required this.item});
}

class FavoriteAdded extends FavoritesEvent {
  FavoriteAdded({required super.item});
}

class FavoriteRemoved extends FavoritesEvent {
  FavoriteRemoved({required super.item});
}
