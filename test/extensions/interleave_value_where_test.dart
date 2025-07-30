import 'package:test/test.dart';
import 'package:darq/darq.dart';

void main() {
  group('interleaveValueWhere', () {
    test(
        'Interleave a list with a value when adjacent elements match condition',
        () {
      var list = [0, 0, 1, 0, 1, 0, 0, 0, 1];
      var value = 5;
      var result = list.interleaveValueWhere(value, (a, b) => a == b);
      expect(result, orderedEquals(<int>[0, 5, 0, 1, 0, 1, 0, 5, 0, 5, 0, 1]));
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
