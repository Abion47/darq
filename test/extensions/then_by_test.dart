import 'package:darq/darq.dart';
import 'package:test/test.dart';

import '../fixtures/pet.dart';

void main() {
  group('thenBy', () {
    test('Ordering by age and then name', () {
      final barley = Pet('Barley', 8);
      final boots = Pet('Boots', 4);
      final whiskers = Pet('Whiskers', 1);
      final daisy = Pet('Daisy', 4);

      final pets = [barley, daisy, whiskers, boots];

      expect(
        pets,
        orderedEquals(
          <Pet>[
            barley,
            daisy,
            whiskers,
            boots,
          ],
        ),
      );

      final interim = pets.orderBy((p) => p.age);

      expect(
        interim,
        orderedEquals(
          <Pet>[
            whiskers,
            daisy,
            boots,
            barley,
          ],
        ),
      );

      final result = interim.thenBy((p) => p.name);

      expect(
        result,
        orderedEquals(
          <Pet>[
            whiskers,
            boots,
            daisy,
            barley,
          ],
        ),
      );
    });

    test('Error: calling thenBy without calling orderBy first', () {
      final errorTest = () => [0, 1, 2].map((i) => i + 1).thenBy((i) => i);
      expect(errorTest, throwsA(isA<UnsupportedError>()));
    });
  });
}
