import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('defaultRangeIfEmpty', () {
    test('Empty list', () {
      final list = <int>[];
      final result = list.defaultRangeIfEmpty([5, 6, 7]);
      expect(result, orderedEquals(<int>[5, 6, 7]));
    });

    test('Non-empty list', () {
      final list = [0, 1, 2, 3, 4];
      final result = list.defaultRangeIfEmpty([5, 6, 7]);
      expect(result, orderedEquals(<int>[0, 1, 2, 3, 4]));
    });
  });
}
