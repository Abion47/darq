import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('reverse', () {
    test('Reverse list', () {
      final test = [0, 1, 2, 3];
      final result = test.reverse();
      expect(result, orderedEquals(<int>[3, 2, 1, 0]));
    });

    test('Reverse empty list', () {
      final test = <int>[];
      final result = test.reverse();
      expect(result, orderedEquals(<int>[]));
    });
  });
}
