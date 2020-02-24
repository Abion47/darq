import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('concat', () {
    test('Concatenate one list', () {
      final list = [0, 1, 2];
      final result = list.concat([3]);
      expect(result, orderedEquals([0, 1, 2, 3]));
    });

    test('Concatenate two lists', () {
      final list = [0, 1, 2];
      final result = list.concat2([3], [4]);
      expect(result, orderedEquals([0, 1, 2, 3, 4]));
    });

    test('Concatenate three lists', () {
      final list = [0, 1, 2];
      final result = list.concat3([3], [4], [5]);
      expect(result, orderedEquals([0, 1, 2, 3, 4, 5]));
    });

    test('Concatenate four lists', () {
      final list = [0, 1, 2];
      final result = list.concat4([3], [4], [5], [6]);
      expect(result, orderedEquals([0, 1, 2, 3, 4, 5, 6]));
    });

    test('Concatenate five lists', () {
      final list = [0, 1, 2];
      final result = list.concat5([3], [4], [5], [6], [7]);
      expect(result, orderedEquals([0, 1, 2, 3, 4, 5, 6, 7]));
    });

    test('Concatenate six lists', () {
      final list = [0, 1, 2];
      final result = list.concat6([3], [4], [5], [6], [7], [8]);
      expect(result, orderedEquals([0, 1, 2, 3, 4, 5, 6, 7, 8]));
    });

    test('Concatenate seven lists', () {
      final list = [0, 1, 2];
      final result = list.concat7([3], [4], [5], [6], [7], [8], [9]);
      expect(result, orderedEquals([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]));
    });

    test('Concatenate eight lists', () {
      final list = [0, 1, 2];
      final result = list.concat8([3], [4], [5], [6], [7], [8], [9], [10]);
      expect(result, orderedEquals([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]));
    });

    test('Concatenate nine lists', () {
      final list = [0, 1, 2];
      final result =
          list.concat9([3], [4], [5], [6], [7], [8], [9], [10], [11]);
      expect(result, orderedEquals([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]));
    });
  });
}
