import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('insertOrAppendAll', () {
    test('Insert all list', () {
      final Iterable<int> list = [1, 2, 3];
      final result = list.insertOrAppendAll(2, [4, 5, 6]);
      expect(result, orderedEquals([1, 2, 4, 5, 6, 3]));
    });

    test('Insert empty list', () {
      final Iterable<int> list = [1, 2, 3];
      final result = list.insertOrAppendAll(2, []);
      expect(result, orderedEquals([1, 2, 3]));
    });

    test('Append list', () {
      final Iterable<int> list = [1, 2, 3];
      final result = list.insertOrAppendAll(5, [4, 5]);
      expect(result, [1, 2, 3, 4, 5]);
    });

    test('Error: index less than zero', () {
      final Iterable<int> list = [1, 2, 3];
      final task = () => list.insertOrAppendAll(-1, [4, 5]);
      expect(task, throwsA(isA<ArgumentError>()));
    });
  });
}
