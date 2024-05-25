import 'package:bloc_library_sample/blocs/favorites/favorites.dart';
import 'package:bloc/bloc.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, List<int>> {
  FavoritesBloc() : super(<int>[]) {
    on<FavoriteAdded>(_onAddToFavorites);
    on<FavoriteRemoved>(_onRemoveFromFavorites);
  }
  void _onAddToFavorites(FavoriteAdded event, Emitter<List<int>> emitter) {
    final newState = List<int>.from(state)..add(event.item);
    emitter(newState);
  }

  void _onRemoveFromFavorites(
      FavoriteRemoved event, Emitter<List<int>> emitter) {
    final newState = List<int>.from(state)..remove(event.item);
    emitter(newState);
  }
}
