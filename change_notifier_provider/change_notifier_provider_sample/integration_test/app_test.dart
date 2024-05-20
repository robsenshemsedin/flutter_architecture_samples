import 'package:change_notifier_provider_sample/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test The Whole App', () {
    testWidgets('Favorites operations test', (tester) async {
      await tester.pumpWidget(const MyApp());

      const iconKeys = [
        'icon_0',
        'icon_1',
        'icon_2',
      ];

      for (String iconKey in iconKeys) {
        await tester.tap(find.byKey(ValueKey(iconKey)));
        await tester.pumpAndSettle(const Duration(seconds: 1));
        expect(find.text('Added to favorites.'), findsOneWidget);
      }
      await tester.tap(find.text('Favorites'));
      await tester.pumpAndSettle();

      final removeIconKeys = [
        'remove_icon_0',
        'remove_icon_1',
        'remove_icon_2',
      ];
      for (String removeIconKey in removeIconKeys) {
        await tester.tap(find.byKey(ValueKey(removeIconKey)));
        await tester.pumpAndSettle(const Duration(seconds: 1));
        expect(find.text('Removed from favorites.'), findsOneWidget);
      }
    });
    testWidgets('Navigation test', (tester) async {
      await tester.pumpWidget(const MyApp());
      expect(find.text('Item List'), findsOneWidget);
      await Future.delayed(const Duration(seconds: 3));
      await tester.tap(find.text('Favorites'));
      await tester.pumpAndSettle(const Duration(seconds: 3));
      expect(find.text('Favorites'), findsOneWidget);
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle(const Duration(seconds: 3));
      expect(find.text('Item List'), findsOneWidget);
    });
  });
}
