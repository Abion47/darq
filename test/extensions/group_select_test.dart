import 'package:darq/darq.dart';
import 'package:test/test.dart';

import '../fixtures/pet.dart';

void main() {
  group('groupSelect', () {
    test('Group on class members', () {
      final barley = Pet('Barley', 8.3);
      final boots = Pet('Boots', 4.9);
      final whiskers = Pet('Whiskers', 1.5);
      final daisy = Pet('Daisy', 4.3);

      final pets = [barley, boots, whiskers, daisy];

      int ageComparer(Pet p1, Pet p2) => p1.age.compareTo(p2.age);

      final result = pets.groupSelect(
        (age, pets) => {
          'key': age,
          'count': pets.length,
          'min': pets.min(ageComparer),
          'max': pets.max(ageComparer),
        },
        keySelector: (pet) => pet.age.floor(),
      );

      expect(result, [
        {
          'key': 8,
          'count': 1,
          'min': Pet('Barley', 8.3),
          'max': Pet('Barley', 8.3),
        },
        {
          'key': 4,
          'count': 2,
          'min': Pet('Daisy', 4.3),
          'max': Pet('Boots', 4.9),
        },
        {
          'key': 1,
          'count': 1,
          'min': Pet('Whiskers', 1.5),
          'max': Pet('Whiskers', 1.5),
        },
      ]);
    });

    test('Group on class members with custom EqualityComparer', () {
      final barley = Pet('Barley', 8.3);
      final boots = Pet('Boots', 4.9);
      final whiskers = Pet('Whiskers', 1.5);
      final daisy = Pet('Daisy', 4.3);

      final pets = [barley, boots, whiskers, daisy];

      int ageComparer(Pet p1, Pet p2) => p1.age.compareTo(p2.age);

      final result2 = pets.groupSelect(
        (age, pets) => {
          'key': age,
          'count': pets.length,
          'min': pets.min(ageComparer),
          'max': pets.max(ageComparer),
        },
        keySelector: (pet) => pet.age,
        keyComparer: EqualityComparer<double>(
          comparer: (k1, k2) => k1.floor() == k2.floor(),
          hasher: (key) => key.floor().hashCode,
        ),
      );

      expect(result2, [
        {
          'key': 8.3,
          'count': 1,
          'min': Pet('Barley', 8.3),
          'max': Pet('Barley', 8.3),
        },
        {
          'key': 4.9,
          'count': 2,
          'min': Pet('Daisy', 4.3),
          'max': Pet('Boots', 4.9),
        },
        {
          'key': 1.5,
          'count': 1,
          'min': Pet('Whiskers', 1.5),
          'max': Pet('Whiskers', 1.5),
        },
      ]);
    });
  });
}
