import 'package:test/test.dart';
import 'package:darq/darq.dart';

void main() {
  group('interleave', () {
    test('Interleave equal lists', () {
      var list = [0, 1, 2];
      var other = [3, 4, 5];
      var result = list.interleave(other);
      expect(result, orderedEquals(<int>[0, 3, 1, 4, 2, 5]));
    });

    test('Interleave unequal lists', () {
      var list = [0, 1];
      var others = [5];
      var result = list.interleave(others);
      expect(result, orderedEquals(<int>[0, 5, 1]));
    });
  });
}
