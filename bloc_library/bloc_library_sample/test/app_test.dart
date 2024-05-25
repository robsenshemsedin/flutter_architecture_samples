import 'package:bloc_library_sample/app.dart';
import 'package:bloc_library_sample/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Favorites App', () {
    testWidgets('is A MaterialApp', (_) async {
      expect(const App(), isA<StatelessWidget>());
    });
    testWidgets('renders HomePage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
