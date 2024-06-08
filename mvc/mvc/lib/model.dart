class Favorites {
  factory Favorites() => _this ??= Favorites._();
  Favorites._();
  static Favorites? _this;
  final List<int> _favorites = [];
  addToFavorites(int item) {
    _favorites.add(item);
  }

  removeFromFavorites(int item) {
    _favorites.remove(item);
  }

  List<int> get favorites => _favorites;
}
