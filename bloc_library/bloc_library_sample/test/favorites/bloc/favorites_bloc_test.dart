import 'package:bloc_library_sample/blocs/blocs.dart';
import 'package:bloc_library_sample/blocs/favorites/favorites.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  group('Initial State', () {
    blocTest(
      'initial state should be empty',
      build: () => FavoritesBloc(),
      expect: () => [],
    );
  });
  group('Add Item', () {
    blocTest(
      'should add an Item',
      build: () => FavoritesBloc(),
      act: (favoritesBloc) => favoritesBloc.add(FavoriteAdded(item: 1)),
      expect: () => [
        [1]
      ],
    );

    blocTest<FavoritesBloc, List<int>>(
      'should add an multiple items',
      build: () => FavoritesBloc(),
      act: (bloc) => bloc
        ..add(
          FavoriteAdded(item: 0),
        )
        ..add(FavoriteAdded(item: 1))
        ..add(FavoriteAdded(item: 2)),
      expect: () => [
        [0],
        [0, 1],
        [0, 1, 2],
      ],
    );
  });
  group('Remove Item', () {
    blocTest(
      'should remove an Item',
      build: () => FavoritesBloc(),
      act: (favoritesBloc) => favoritesBloc
        ..add(FavoriteAdded(item: 1))
        ..add(FavoriteRemoved(item: 1)),
      expect: () => [
        [1],
        []
      ],
    );
    blocTest<FavoritesBloc, List<int>>(
      'should remove multiple items',
      build: () => FavoritesBloc(),
      act: (bloc) => bloc
        ..add(
          FavoriteAdded(item: 0),
        )
        ..add(FavoriteAdded(item: 1))
        ..add(FavoriteAdded(item: 2))
        ..add(
          FavoriteRemoved(item: 2),
        )
        ..add(FavoriteRemoved(item: 1))
        ..add(FavoriteRemoved(item: 0)),
      expect: () => [
        [0],
        [0, 1],
        [0, 1, 2],
        [0, 1],
        [0],
        []
      ],
    );
  });
}
