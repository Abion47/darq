import 'package:darq/darq.dart';
import 'package:test/test.dart';

import '../fixtures/pet.dart';

void main() {
  group('groupBy', () {
    test('Group on class member', () {
      final barley = Pet('Barley', 8);
      final boots = Pet('Boots', 4);
      final whiskers = Pet('Whiskers', 1);
      final daisy = Pet('Daisy', 4);

      final pets = [barley, boots, whiskers, daisy];

      final results = pets.groupBy((pet) => pet.age);

      expect(results, [
        [barley],
        [boots, daisy],
        [whiskers],
      ]);

      expect(results.elementAt(0).key, 8);
      expect(results.elementAt(1).key, 4);
      expect(results.elementAt(2).key, 1);
    });

    test('Long group test', () {
      final list = [
        'ZZ',
        'ZZ',
        'AA',
        'AA',
        'AB',
        'AC',
        'AD',
        'AE',
        'AF',
        'AG',
        'ZZ',
        'ZZ',
      ];

      final results = list.groupBy((e) => e).toList();

      expect(results.length, 8);

      expect(results.elementAt(0).key, 'ZZ');
      expect(results.elementAt(0).elements,
          orderedEquals(<String>['ZZ', 'ZZ', 'ZZ', 'ZZ']));

      expect(results.elementAt(1).key, 'AA');
      expect(
          results.elementAt(1).elements, orderedEquals(<String>['AA', 'AA']));

      expect(results.elementAt(2).key, 'AB');
      expect(results.elementAt(2).elements, orderedEquals(<String>['AB']));

      expect(results.elementAt(3).key, 'AC');
      expect(results.elementAt(3).elements, orderedEquals(<String>['AC']));

      expect(results.elementAt(4).key, 'AD');
      expect(results.elementAt(4).elements, orderedEquals(<String>['AD']));

      expect(results.elementAt(5).key, 'AE');
      expect(results.elementAt(5).elements, orderedEquals(<String>['AE']));

      expect(results.elementAt(6).key, 'AF');
      expect(results.elementAt(6).elements, orderedEquals(<String>['AF']));

      expect(results.elementAt(7).key, 'AG');
      expect(results.elementAt(7).elements, orderedEquals(<String>['AG']));
    });
  });
}
