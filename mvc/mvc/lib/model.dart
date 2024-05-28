class Favorites {
  final List<int> _favorites = [];
  addToFavorites(int item) {
    _favorites.add(item);
  }

  removeFromFavorites(int item) {
    _favorites.remove(item);
  }

  List<int> get favorites => _favorites;
}
