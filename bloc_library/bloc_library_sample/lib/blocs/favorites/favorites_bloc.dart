import 'package:bloc_library_sample/blocs/favorites/favorites.dart';
import 'package:bloc/bloc.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, List<int>> {
  FavoritesBloc() : super(<int>[]) {
    on<AddToFavorites>(_onAddToFavorites);
    on<RemoveFromFavorites>(_onRemoveFromFavorites);
  }
  void _onAddToFavorites(AddToFavorites event, Emitter<List<int>> emitter) {
    final currentState = state;
    currentState.add(event.item);
    emitter([...currentState]);
  }

  void _onRemoveFromFavorites(
      RemoveFromFavorites event, Emitter<List<int>> emitter) {
    final updatedState = state;
    updatedState.remove(event.item);
    emitter([...updatedState]);
  }
}
