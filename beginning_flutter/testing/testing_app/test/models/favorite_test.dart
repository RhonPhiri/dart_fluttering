import 'package:test/test.dart';
import 'package:testing_app/models/favorites.dart';

void main() {
  //tests that are related to each other can be paced in a group
  group('Testing App Provider', () {
    final favorites = Favorites();
    // a test has a description and a call back where the actual test is written
    //test to add an item to the list of items
    test('A new item should be added', () {
      var number = 35;
      favorites.addItem(number);
      expect(favorites.items.contains(number), true);
    });

    //test to remove an item from the list of favorites
    test('An item must be removed', () {
      var number = 45;
      favorites.addItem(number);
      expect(favorites.items.contains(number), true);
      favorites.removeItem(number);
      expect(favorites.items.contains(number), false);
    });
  });
}
