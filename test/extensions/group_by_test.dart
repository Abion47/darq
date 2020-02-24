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
  });
}
