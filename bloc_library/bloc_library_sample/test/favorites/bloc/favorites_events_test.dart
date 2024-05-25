import 'package:bloc_library_sample/blocs/blocs.dart';
import 'package:bloc_library_sample/blocs/favorites/favorites_event.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Events Are FavoritesEvent', () {
    test('FavoriteAdded is a FavoritesEvent',
        () => expect(FavoriteAdded(item: 0), isA<FavoritesEvent>()));
    test('FavoriteRemoved is a FavoritesEvent',
        () => expect(FavoriteRemoved(item: 0), isA<FavoritesEvent>()));
  });
}
