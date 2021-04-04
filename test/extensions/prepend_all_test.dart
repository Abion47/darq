import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('prependAll', () {
    test('Prepend all values', () {
      var list = [0, 1, 2, 3];
      var result = list.prependAll([4, 5, 6]);
      expect(result, orderedEquals(<int>[4, 5, 6, 0, 1, 2, 3]));
    });
  });
}
