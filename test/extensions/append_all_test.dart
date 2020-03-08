import 'package:test/test.dart';
import 'package:darq/darq.dart';

void main() {
  group('appendAll', () {
    test('Append all values', () {
      var list = [0, 1, 2, 3];
      var result = list.appendAll([4, 5, 6]);
      expect(result, orderedEquals([0, 1, 2, 3, 4, 5, 6]));
    });
  });
}
