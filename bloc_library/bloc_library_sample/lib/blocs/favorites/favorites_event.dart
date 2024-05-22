sealed class FavoritesEvent {
  final int item;
  FavoritesEvent({required this.item});
}

class AddToFavorites extends FavoritesEvent {
  AddToFavorites({required super.item});
}

class RemoveFromFavorites extends FavoritesEvent {
  RemoveFromFavorites({required super.item});
}
