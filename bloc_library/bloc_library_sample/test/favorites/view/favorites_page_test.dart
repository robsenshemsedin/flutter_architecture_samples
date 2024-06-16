import 'package:bloc_library_sample/blocs/blocs.dart';
import 'package:bloc_library_sample/screens/favorites.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockFavoritesBloc extends MockBloc<FavoritesEvent, List<int>>
    implements FavoritesBloc {}

extension on WidgetTester {
  Future<void> pumpFavoritesPage(FavoritesBloc favoritesBloc) async {
    return pumpWidget(MaterialApp(
      home: BlocProvider.value(
        value: favoritesBloc,
        child: const FavoritesPage(),
      ),
    ));
  }
}

void main() {
  final mockFavoritesBloc = _MockFavoritesBloc();
  setUp(() => registerFallbackValue(FavoriteAdded(item: 0)));
  group('FavoritePage Test', () {
    const itemNo = 0;
    const removeButtonKey = Key('remove_icon_$itemNo');
    when(() => mockFavoritesBloc.state).thenReturn(<int>[itemNo]);
    testWidgets('renders items list', (widgetTester) async {
      await widgetTester.pumpFavoritesPage(mockFavoritesBloc);
      expect(find.byType(ListView), findsOneWidget);
    });
    testWidgets('one favorite item initialy', (widgetTester) async {
      await widgetTester.pumpFavoritesPage(mockFavoritesBloc);
      expect(find.byIcon(Icons.close), findsOne);
    });
    testWidgets('should remove from favorites', (widgetTester) async {
      // when(() => mockFavoritesBloc.state).thenReturn(<int>[itemNo]);
      await widgetTester.pumpFavoritesPage(mockFavoritesBloc);
      await widgetTester.tap(find.byKey(removeButtonKey));
      verify(() => mockFavoritesBloc.add(any(
          that: isA<FavoriteRemoved>()
              .having((e) => e.item, 'item', itemNo)))).called(1);
    });
  });
}
