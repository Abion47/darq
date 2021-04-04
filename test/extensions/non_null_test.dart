import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('nonNull', () {
    test('Filter nulls', () {
      final list = [1, null, 2, null, 3];
      final result = list.nonNull();
      expect(result, orderedEquals(<int>[1, 2, 3]));
    });

    test('No nulls', () {
      final list = [1, 2, 3];
      final result = list.nonNull();
      expect(result, orderedEquals(<int>[1, 2, 3]));
    });
  });
}
