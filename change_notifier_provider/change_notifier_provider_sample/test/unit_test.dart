import 'package:change_notifier_provider_sample/models/favorites.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test App Provider', () {
    test('item should be added', () {
      final favorites = Favorites();
      const item = 1;
      favorites.addItem(item);
      expect(favorites.items.contains(item), isTrue);
    });
    test('item should be removed', () {
      final favorites = Favorites();
      const item = 1;
      favorites.addItem(item);
      expect(favorites.items.contains(item), isTrue);
      favorites.removeItem(item);
      expect(favorites.items.contains(item), isFalse);
    });
  });
}
