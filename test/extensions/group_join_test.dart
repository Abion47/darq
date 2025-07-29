import 'package:darq/darq.dart';
import 'package:test/test.dart';

import '../fixtures/person.dart';
import '../fixtures/pet_with_owner.dart';

void main() {
  group('Extension Methods', () {
    test('Group on elements', () {
      final indices = [0, 1];
      final characters = [0, 0, 0, 1, 0, 1, 1, 1, 0, 1];

      final results = indices.groupJoin(
        characters,
        (c, i) => {
          'id': c,
          'values': i,
        },
      );

      expect(results, [
        {
          'id': 0,
          'values': [0, 0, 0, 0, 0]
        },
        {
          'id': 1,
          'values': [1, 1, 1, 1, 1]
        },
      ]);
    });

    test('Group on class members', () {
      final travis = Person('Travis');
      final terry = Person('Terry');
      final charlotte = Person('Charlotte');
      final benny = Person('Benny');

      final people = [travis, terry, charlotte, benny];

      final barley = Pet('Barley', 8, terry);
      final boots = Pet('Boots', 4, terry);
      final whiskers = Pet('Whiskers', 1, charlotte);
      final daisy = Pet('Daisy', 4, travis);

      final pets = [barley, boots, whiskers, daisy];

      final result = people.groupJoin<Pet, String, Map<String, dynamic>>(
        pets,
        (person, pets) => <String, dynamic>{
          'ownerName': person.name,
          'pets': pets.select((pet, i) => pet.name)
        },
        outerKeySelector: (person) => person.name,
        innerKeySelector: (pet) => pet.owner.name,
      );

      expect(result, [
        {
          'ownerName': 'Travis',
          'pets': ['Daisy']
        },
        {
          'ownerName': 'Terry',
          'pets': ['Barley', 'Boots']
        },
        {
          'ownerName': 'Charlotte',
          'pets': ['Whiskers']
        },
        {
          'ownerName': 'Benny',
          'pets': <String>[],
        },
      ]);
    });

    test('Group on class members with custom EqualityComparer', () {
      final travis = Person('Travis');
      final terry = Person('Terry');
      final charlotte = Person('Charlotte');
      final benny = Person('Benny');

      final people = [travis, terry, charlotte, benny];

      final barley = Pet('Barley', 8, terry);
      final boots = Pet('Boots', 4, terry);
      final whiskers = Pet('Whiskers', 1, charlotte);
      final daisy = Pet('Daisy', 4, travis);

      final pets = [barley, boots, whiskers, daisy];

      final result2 = people.groupJoin<Pet, String, Map<String, dynamic>>(
        pets,
        (person, pets) => <String, dynamic>{
          'ownerName': person.name,
          'pets': pets.map((pet) => pet.name),
        },
        outerKeySelector: (person) => person.name,
        innerKeySelector: (pet) => pet.owner.name,
        keyComparer: EqualityComparer(
          comparer: (k1, k2) => k1.substring(0, 1) == k2.substring(0, 1),
          hasher: (key) => key.substring(0, 1).hashCode,
        ),
      );

      expect(result2, [
        {
          'ownerName': 'Travis',
          'pets': ['Barley', 'Boots', 'Daisy']
        },
        {
          'ownerName': 'Terry',
          'pets': ['Barley', 'Boots', 'Daisy']
        },
        {
          'ownerName': 'Charlotte',
          'pets': ['Whiskers']
        },
        {'ownerName': 'Benny', 'pets': <String>[]},
      ]);
    });
  });
}
