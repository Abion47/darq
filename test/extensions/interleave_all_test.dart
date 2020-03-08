import 'package:test/test.dart';
import 'package:darq/darq.dart';

void main() {
  group('interleaveAll', () {
    test('Interleave equal lists', () {
      var list = [0, 1, 2];
      var others = [
        [3, 4, 5],
        [6, 7, 8]
      ];
      var result = list.interleaveAll(others);
      expect(result, orderedEquals([0, 3, 6, 1, 4, 7, 2, 5, 8]));
    });

    test('Interleave unequal lists', () {
      var list = [0, 1];
      var others = [
        [2, 3, 4],
        [5]
      ];
      var result = list.interleaveAll(others);
      expect(result, orderedEquals([0, 2, 5, 1, 3, 4]));
    });

    test('Error: null others', () {
      var list = [0, 1];
      var task = () => list.interleaveAll(null);
      expect(task, throwsA(isA<ArgumentError>()));
    });

    test('Error: null in others', () {
      var list = [0, 1];
      var task = () => list.interleaveAll([null]);
      expect(task, throwsA(isA<ArgumentError>()));
    });
  });
}
