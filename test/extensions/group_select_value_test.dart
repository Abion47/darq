import 'package:darq/darq.dart';
import 'package:test/test.dart';

import '../fixtures/pet.dart';

void main() {
  group('groupSelectValue', () {
    test('Group on class members', () {
      final barley = Pet('Barley', 8.3);
      final boots = Pet('Boots', 4.9);
      final whiskers = Pet('Whiskers', 1.5);
      final daisy = Pet('Daisy', 4.3);

      final pets = [barley, boots, whiskers, daisy];

      final result = pets.groupSelectValue(
        (age, pets) => {
          'key': age,
          'names': pets,
          'count': pets.length,
        },
        keySelector: (pet) => pet.age.floor(),
        valueSelector: (pet) => pet.name,
      );

      expect(result, [
        {
          'key': 8,
          'names': ['Barley'],
          'count': 1
        },
        {
          'key': 4,
          'names': ['Boots', 'Daisy'],
          'count': 2
        },
        {
          'key': 1,
          'names': ['Whiskers'],
          'count': 1
        },
      ]);
    });

    test('Group on class members with custom EqualityComparer', () {
      final barley = Pet('Barley', 8.3);
      final boots = Pet('Boots', 4.9);
      final whiskers = Pet('Whiskers', 1.5);
      final daisy = Pet('Daisy', 4.3);

      final pets = [barley, boots, whiskers, daisy];

      final result2 = pets.groupSelectValue(
        (age, pets) => {
          'key': age,
          'names': pets,
          'count': pets.length,
        },
        keySelector: (pet) => pet.age,
        valueSelector: (pet) => pet.name,
        keyComparer: EqualityComparer<double>(
          comparer: (k1, k2) => k1.floor() == k2.floor(),
          hasher: (key) => key.floor().hashCode,
        ),
      );

      expect(result2, [
        {
          'key': 8.3,
          'names': ['Barley'],
          'count': 1
        },
        {
          'key': 4.9,
          'names': ['Boots', 'Daisy'],
          'count': 2
        },
        {
          'key': 1.5,
          'names': ['Whiskers'],
          'count': 1
        },
      ]);
    });
  });
}
