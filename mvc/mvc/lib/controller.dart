import 'package:mvc/model.dart';
import 'package:mvc_pattern/mvc_pattern.dart' show ControllerMVC;

class Con extends ControllerMVC {
  factory Con() {
    return con ??= Con();
  }
  final Favorites _favorites = Favorites();
  static Con? con;
  List<int> get items => _favorites.favorites;
  add(int item) {
    _favorites.addToFavorites(item);
    buildInherited();
  }

  remove(int item) {
    _favorites.addToFavorites(item);
    buildInherited();
  }
}
