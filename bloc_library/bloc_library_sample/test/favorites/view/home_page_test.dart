import 'package:bloc_library_sample/blocs/blocs.dart';
import 'package:bloc_library_sample/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockFavoritesBloc extends MockBloc<FavoritesEvent, List<int>>
    implements FavoritesBloc {}

extension on WidgetTester {
  Future<void> pumpHomePage(FavoritesBloc favoritesBloc) async {
    return pumpWidget(MaterialApp(
      home: BlocProvider.value(
        value: favoritesBloc,
        child: const HomePage(),
      ),
    ));
  }
}

void main() {
  final mockFavoritesBloc = _MockFavoritesBloc();
  setUp(() => registerFallbackValue(FavoriteAdded(item: 0)));
  group('HomePage Test', () {
    const itemNo = 0;
    const iconButtonKey = Key('icon_$itemNo');
    when(() => mockFavoritesBloc.state).thenReturn(<int>[]);
    testWidgets('renders items list', (widgetTester) async {
      await widgetTester.pumpHomePage(mockFavoritesBloc);
      expect(find.byType(ListView), findsOneWidget);
    });
    testWidgets('no favorite item initialy', (widgetTester) async {
      await widgetTester.pumpHomePage(mockFavoritesBloc);
      expect(find.byIcon(Icons.favorite), findsNothing);
    });
    testWidgets('should add to favorites', (widgetTester) async {
      await widgetTester.pumpHomePage(mockFavoritesBloc);
      await widgetTester.tap(find.byIcon(Icons.favorite_border).first);
      verify(() => mockFavoritesBloc.add(
              any(that: isA<FavoriteAdded>().having((e) => e.item, 'item', 0))))
          .called(1);
    });
    testWidgets('should remove from favorites', (widgetTester) async {
      when(() => mockFavoritesBloc.state).thenReturn(<int>[itemNo]);
      await widgetTester.pumpHomePage(mockFavoritesBloc);
      await widgetTester.tap(find.byKey(iconButtonKey));
      verify(() => mockFavoritesBloc.add(any(
          that: isA<FavoriteRemoved>()
              .having((e) => e.item, 'item', itemNo)))).called(1);
    });
  });
}
