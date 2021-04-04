import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('String Extensions', () {
    test('Creating a string iterable', () {
      var string = 'abcdef';
      var e = string.iterable;

      expect(e, isA<Iterable<String>>());
      expect(e.length, 6);
      expect(e, orderedEquals(<String>['a', 'b', 'c', 'd', 'e', 'f']));

      var string2 = String.fromCharCode(0x1F01C); // 🀜
      var e2 = string2.iterable;

      expect(e2, isA<Iterable<String>>());
      expect(e2.length, 2);
      expect(
        e2,
        orderedEquals(
          <String>[
            String.fromCharCode(0xD83C),
            String.fromCharCode(0xDc1c),
          ],
        ),
      );
    });

    test('Creating a string rune iterable', () {
      var string = 'abcdef';
      var e = string.iterableRunes;

      expect(e, isA<Iterable<String>>());
      expect(e, orderedEquals(<String>['a', 'b', 'c', 'd', 'e', 'f']));

      var string2 = String.fromCharCode(0x1F01C); // 🀜
      var e2 = string2.iterableRunes;

      expect(e2, isA<Iterable<String>>());
      expect(e2.length, 1);
      expect(e2, orderedEquals(<String>[String.fromCharCode(0x1F01c)]));
    });
  });
}
