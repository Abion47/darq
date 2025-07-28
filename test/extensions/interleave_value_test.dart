import 'package:test/test.dart';
import 'package:darq/darq.dart';

void main() {
  group('interleaveValue', () {
    test('Interleave a list with a value', () {
      var list = [0, 1, 2];
      var value = 5;
      var result = list.interleaveValue(value);
      expect(result, orderedEquals(<int>[0, 5, 1, 5, 2]));
    });

    test('Interleave short lists', () {
      var list = [0];
      var value = 5;
      var result = list.interleaveValue(value);
      expect(result, orderedEquals(<int>[0]));

      var list2 = [];
      var result2 = list2.interleaveValue(value);
      expect(result2, orderedEquals(<int>[]));
    });
  });
}
