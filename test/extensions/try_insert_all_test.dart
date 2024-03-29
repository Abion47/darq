import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('tryInsertAll', () {
    test('Insert all list', () {
      final Iterable<int> list = [1, 2, 3];
      final result = list.tryInsertAll(2, [4, 5, 6]);
      expect(result, orderedEquals(<int>[1, 2, 4, 5, 6, 3]));
    });

    test('Insert empty list', () {
      final Iterable<int> list = [1, 2, 3];
      final result = list.tryInsertAll(2, []);
      expect(result, orderedEquals(<int>[1, 2, 3]));
    });

    test('Index past length of source', () {
      final Iterable<int> list = [1, 2, 3];
      final result = list.tryInsertAll(5, [4, 5]);
      expect(result, orderedEquals(<int>[1, 2, 3]));
    });

    test('Error: index less than zero', () {
      final Iterable<int> list = [1, 2, 3];
      void task() => list.tryInsertAll(-1, [4, 5]);
      expect(task, throwsA(isA<ArgumentError>()));
    });
  });
}
