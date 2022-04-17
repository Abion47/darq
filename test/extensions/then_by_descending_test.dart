import 'package:darq/darq.dart';
import 'package:test/test.dart';

import '../fixtures/pet.dart';

void main() {
  group('thenByDescending', () {
    test('Ordering by age and then name', () {
      final barley = Pet('Barley', 8);
      final daisy = Pet('Daisy', 4);
      final whiskers = Pet('Whiskers', 1);
      final boots = Pet('Boots', 4);

      final pets = [barley, whiskers, boots, daisy];

      expect(
        pets,
        orderedEquals(
          <Pet>[
            barley,
            whiskers,
            boots,
            daisy,
          ],
        ),
      );

      final interim = pets.orderBy((p) => p.age);

      expect(
        interim,
        orderedEquals(
          <Pet>[
            whiskers,
            boots,
            daisy,
            barley,
          ],
        ),
      );

      final result = interim.thenByDescending((p) => p.name);

      expect(
        result,
        orderedEquals(
          <Pet>[
            whiskers,
            daisy,
            boots,
            barley,
          ],
        ),
      );
    });

    test('Error: calling thenByDescending without calling orderBy first', () {
      void task() => [0, 1, 2].map((i) => i + 1).thenByDescending((i) => i);
      expect(task, throwsA(isA<UnsupportedError>()));
    });
  });
}
