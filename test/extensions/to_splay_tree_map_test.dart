import 'dart:collection';

import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('toSplayTreeMap', () {
    test('int list to map', () {
      final input = [1, 2, 3, 4, 5];
      final result = input.toSplayTreeMap((x) => MapEntry(x, x.toString()));
      expect(result, isA<SplayTreeMap<int, String>>());
      expect(result, equals({1: '1', 2: '2', 3: '3', 4: '4', 5: '5'}));
    });

    test('int list to map (unmodifiable)', () {
      final input = [1, 2, 3, 4, 5];
      final result = input.toSplayTreeMap((x) => MapEntry(x, x.toString()),
          modifiable: false);

      expect(result, equals({1: '1', 2: '2', 3: '3', 4: '4', 5: '5'}));

      void task() => result[1] = 'a';
      expect(task, throwsA(isA<UnsupportedError>()));
    });
  });
}
