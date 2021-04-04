import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('insertAll', () {
    test('Insert all list', () {
      final Iterable<int> list = [1, 2, 3];
      final result = list.insertAll(2, [4, 5, 6]);
      expect(result, orderedEquals(<int>[1, 2, 4, 5, 6, 3]));
    });

    test('Insert empty list', () {
      final Iterable<int> list = [1, 2, 3];
      final result = list.insertAll(2, []);
      expect(result, orderedEquals(<int>[1, 2, 3]));
    });

    test('Error: index past length of source', () {
      final Iterable<int> list = [1, 2, 3];
      final task = () => list.insertAll(5, [4, 5]);
      expect(task, throwsA(isA<RangeError>()));
    });

    test('Error: index less than zero', () {
      final Iterable<int> list = [1, 2, 3];
      final task = () => list.insertAll(-1, [4, 5]);
      expect(task, throwsA(isA<ArgumentError>()));
    });
  });
}
