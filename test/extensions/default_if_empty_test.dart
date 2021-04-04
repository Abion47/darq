import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('defaultIfEmpty', () {
    test('Empty list', () {
      final list = <int>[];
      final result = list.defaultIfEmpty(5);
      expect(result, orderedEquals(<int>[5]));
    });

    test('Non-empty list', () {
      final list = [0, 1, 2, 3, 4];
      final result = list.defaultIfEmpty(5);
      expect(result, orderedEquals(<int>[0, 1, 2, 3, 4]));
    });
  });
}
