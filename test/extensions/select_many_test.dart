import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('selectMany', () {
    test('Basic mapping', () {
      final list = [
        [0, 1, 2, 3, 4],
        [5, 6, 7, 8, 9],
        [10, 11, 12, 13, 14],
      ];
      final result = list.selectMany((x, i) => x);
      expect(
          result,
          orderedEquals(
              <int>[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]));
    });

    test('Mapping using index', () {
      final list = [
        [0, 1, 2, 3, 4],
        [5, 6, 7, 8, 9],
        [10, 11, 12, 13, 14],
      ];
      final result = list.selectMany((x, i) => [i, ...x]);
      expect(
          result,
          orderedEquals(<int>[
            0,
            0,
            1,
            2,
            3,
            4,
            1,
            5,
            6,
            7,
            8,
            9,
            2,
            10,
            11,
            12,
            13,
            14
          ]));
    });

    test('Basic mapping on Strings', () {
      final list = ['abc', 'de', 'f', 'ghij'];
      final result = list.selectMany((s, i) => s.iterable);
      expect(
          result,
          orderedEquals(
              <String>['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j']));
    });
  });
}
