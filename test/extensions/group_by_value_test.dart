import 'package:darq/darq.dart';
import 'package:test/test.dart';

import '../fixtures/pet.dart';

void main() {
  group('groupByValue', () {
    test('Group on elements', () {
      final list = ['a', 'a', 'b', 'c', 'c', 'c'];

      final results = list.groupByValue();

      expect(results, [
        ['a', 'a'],
        ['b'],
        ['c', 'c', 'c'],
      ]);

      expect(results.elementAt(0).key, 'a');
      expect(results.elementAt(1).key, 'b');
      expect(results.elementAt(2).key, 'c');
    });

    test('Group on class member', () {
      final barley = Pet('Barley', 8);
      final boots = Pet('Boots', 4);
      final whiskers = Pet('Whiskers', 1);
      final daisy = Pet('Daisy', 4);

      final pets = [barley, boots, whiskers, daisy];

      final results = pets.groupByValue(
        keySelector: (pet) => pet.age,
        valueSelector: (pet) => pet.name,
      );

      expect(results, [
        ['Barley'],
        ['Boots', 'Daisy'],
        ['Whiskers'],
      ]);

      expect(results.elementAt(0).key, 8);
      expect(results.elementAt(1).key, 4);
      expect(results.elementAt(2).key, 1);
    });
  });
}
